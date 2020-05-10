local co = require 'co'
local t = {}
local GF = require "gfbase"

function t.newctx()
    local ctx = {
        event = {},
        wait = {},
        name = setmetatable({}, co.weak_meta),
        callback = {},
        co_pool = setmetatable({}, co.weak_meta),
        -- keep context wait
        mono_run = nil,
        mono_wait = {},
        pending_start = {},
        pending_running = {},
        uncase = {},
        lock_event_queue_idx = -1,
        lock_pending_running_idx = -1,
        lock_pending_start_idx = -1,
        lock_event_queue_stack = {},
        lock_pending_running_stack = {},
        lock_pending_start_stack = {},
        lock_count = 0,
    }
    return ctx
end

local function resume_wait(ED,p)
    local ret,tag
    ED.info = p.e
    t.remove_wait(ED, p)

    if p.isAction ~= true then
        GF.set_readonly(false)
    end
    if p.arg then -- ?
        ret,tag = co.resume(p.co, table.unpack(p.arg))
    else
        ret,tag = co.resume(p.co, p)
    end
    if p.isAction ~= true then
        GF.set_readonly(true)
    end

    if tag == 'EXIT' then
        ED.name[p.co] = nil
    end
end

local g_s_sub = string.sub
local g_s_find = string.find
local g_type = type
local g_t_remove = table.remove
local g_t_insert = table.insert
local function match_arg(pa, ea)
    if pa == ea then return true end
    local tpa = g_type(pa)
    local tea = g_type(ea)
    if tpa ~= tea then return false end
    if (tpa == 'table' or tpa == 'userdata') and g_type(pa.name) == 'number' and g_type(ea.name) == 'number' then
        if pa.name == pa.root then
            return ea.root == pa.root
        else
            return ea.name == pa.name
        end
    elseif tpa == 'string' then
        if g_s_sub(pa, 1, 1) == '[' and g_s_sub(pa, 4, 4) == ']' then
            pa = g_s_sub(pa, 5)
        end
        if g_s_sub(ea, 1, 1) == '[' and g_s_sub(ea, 4, 4) == ']' then
            ea = g_s_sub(ea, 5)
        end
    end
    return pa == ea
end
local function match_event(p, e)
    if not e._sz then
        local sz = 0
        for k,v in pairs(e) do
            if g_type(k) == 'number' and k > sz then
                sz = k
            end
        end
        e._sz = sz
    end
    for idx = 1, e._sz do
        if p[idx] ~= nil and e[idx] ~= nil and not match_arg(p[idx], e[idx]) then
            if idx == 1 then
                local tmp_p = t.parse_event(p[1])
                if tmp_p ~= e[1] then
                    return false
                end
            else
                return false
            end
        end
    end

    GF.setevent_info(e)
    if g_type(p.cond) == 'function' and not p.cond(table.unpack(e, 2, 100)) then
        return false
    end
    return true
end

local function cmp_event(a,b)
    if a.prior == b.prior then
        return a._idx > b._idx
    end
    return a.prior > b.prior
end

local function collect_match(checks, e, out)
    local group = {}
    local i_out_count = #out
    --for k = 1, #checks do
    for k = #checks,1,-1 do
        local v = checks[k]
        if match_event(v,e) then
            v.prior = v.prior or 0
            local insert = true
            if v.group then
                local cur = group[v.group]
                if cur == nil or v.prior > cur.prior then
                    if cur then
                        --table.remove(out, cur._idx)
                        --for x = cur._idx, #out do
                        g_t_remove(out,cur._idx)
                        i_out_count = i_out_count -1
                        for x = cur._idx, i_out_count do
                            out[x]._idx = x
                        end
                    end
                else
                    insert = false
                end
            end
            if insert then
                v.e = e
                if v.group then
                    group[v.group] = v
                end
                --table.insert(out, v)
                --v._idx = #out
                i_out_count = i_out_count + 1
                out[i_out_count] = v
                v._idx = i_out_count
            end
        end
    end
    table.sort(out, cmp_event)
end

function t.add_wait(ED, p)
    if p.mono then
        g_t_insert(ED.mono_wait,p)
        return
    end
    
    local wait = ED.wait[p[1]] or {}
    ED.wait[p[1]] = wait
  
    g_t_insert(wait,p)
end

function t.removeby_co(wait, pco)
    if pco == nil then return end
    for k = #wait, 1, -1 do
        if wait[k].co == pco then
            g_t_remove(wait,k)
        end
    end
end
function t.removeby_name(wait, name_tab, name)
    for k = #wait, 1, -1 do
        local pco = wait[k].co
        if name_tab[pco] == name then
            g_t_remove(wait,k)
        end
    end
end

function t.remove_wait(ED, p)
    local mono_wait = ED.mono_wait
    if g_type(p) == 'table' then
        if #mono_wait > 0 then
            for i = #mono_wait, 1, -1 do
                if mono_wait[i].co == p.co then 
                    table.remove(mono_wait, i)
                end
            end
        end

        if p.co  ~= nil then
            for _,wait in pairs(ED.wait) do
                t.removeby_co(wait,p.co)
            end
            t.removeby_co(ED.pending_start,p.co)
            t.removeby_co(ED.pending_running,p.co)
        end
        if #ED.pending_running < ED.lock_pending_running_idx then
            ED.lock_pending_running_idx = #ED.pending_running
        end
        return
    end

    if #mono_wait > 0 then
        for i = #mono_wait, 1, -1 do
            if ED.name[mono_wait[i].co] == p then 
                table.remove(mono_wait, i)
            end
        end
    end

    for _,wait in pairs(ED.wait) do
        t.removeby_name(wait,ED.name,p)
    end
    t.removeby_name(ED.pending_start,ED.name,p)
    t.removeby_name(ED.pending_running,ED.name,p)
    if #ED.pending_running < ED.lock_pending_running_idx then
        ED.lock_pending_running_idx = #ED.pending_running
    end

    for k,v in pairs(ED.name) do
        if v == p then
            ED.name[k] = nil
        end
    end
end

function t.start_program(ED,name, func, arg, exit_cb)
    local p = {co = co.create(func, nil, exit_cb, ED.co_pool), arg = arg}
    ED.name[p.co] = name
    g_t_insert(ED.pending_start, p) -- start_program按开启顺序加入执行队列
    return p
end

function t.tick_event(ED, waiting, e, actived)
    if waiting == nil then 
        return 
    end
    local out = {}
    collect_match(waiting, e, out)
    if not actived then
        return out[1]
    end
    for k = 1, #out do
        out[k].main_thread = e.main_thread
        g_t_insert(actived, out[k])
    end
end

function t.next_pending(ED)
    local p

    if t.IsEventAndProgramQueueLocked(ED) then 
        if #ED.pending_start > ED.lock_pending_start_idx then 
            p = g_t_remove(ED.pending_start, ED.lock_pending_start_idx + 1)
        end
    else
        p = g_t_remove(ED.pending_start, 1)
    end 
    if p then 
        return p 
    end

    local actived = ED.pending_running
    if ED.stop then
        for k,_ in pairs(actived) do
            actived[k] = nil
        end
    end
    if g_type(ED.lock_pending_running_idx) ~= 'number' then
        ED.lock_pending_running_idx = -1
    end
    if g_type(ED.lock_event_queue_idx) ~= 'number' then
        ED.lock_event_queue_idx = -1
    end
    while (not t.IsEventAndProgramQueueLocked(ED) and #actived == 0) or (t.IsEventAndProgramQueueLocked(ED) and #actived <= ED.lock_pending_running_idx) do
        local ev
        local idx
        if #ED.event <= ED.lock_event_queue_idx then
            ev = nil
        else
            if t.IsEventAndProgramQueueLocked(ED) then
                idx = ED.lock_event_queue_idx + 1
            else
                idx = 1
            end
            ev = g_t_remove(ED.event, idx)
        end
        if ev == nil then
            break
        end
        t.tick_event(ED, ED.wait[ev[1]], ev, ED.pending_running)
    end
    if t.IsEventAndProgramQueueLocked(ED) then 
        if #actived > ED.lock_pending_running_idx then 
            p = g_t_remove(actived, ED.lock_pending_running_idx + 1)
        end
    else
        p = g_t_remove(actived, 1)
    end
    if p == nil then return end
    ED.stop = p.stop
    return p
end

function t.tick(ED)
    if #ED.mono_wait > 0 then
        if ED.mono_run then
            local p = ED.mono_run
            ED.mono_run = nil
            resume_wait(ED, p)
        end
        t.try_tick_mono_wait(ED)
        return
    end

    while true do
	    GF.set_readonly(false)
        local p = t.next_pending(ED)
        GF.set_readonly(true)
        if p then
            resume_wait(ED,p)
            if #ED.mono_wait > 0 then
                break
            end
        else
            break
        end
    end
end

function t.try_tick_mono_wait(ED)
    local mono_wait_event
    --if not (g_type(ED.mono_wait) == 'table' and g_type(ED.mono_wait[1]) == 'table') then
    if not (g_type(ED.mono_wait) == 'table' and g_type(ED.mono_wait[#ED.mono_wait]) == 'table') then
        return
    end
    --mono_wait_event = ED.mono_wait[1][1]
    mono_wait_event = ED.mono_wait[#ED.mono_wait][1]
    for i = 1, #ED.event do
        if ED.event[i][1] == mono_wait_event then
            local earg = ED.event[i]
            g_t_remove(ED.event, i)
            local p = t.tick_event(ED, ED.mono_wait, earg)
            if p then
                p.main_thread = true
                ED.mono_run = p
            end
            return
        end
    end
end
----------------------------------------
local save_count = 0
function t.trig_event(ED,proc_cb, ev,p,...)
    if g_type(ev) ~= 'string' then return end
    ev = t.parse_event(ev)
    local arg = {ev,p, ...}
    arg.main_thread = not proc_cb

    if #ED.mono_wait > 0 then
        local p = t.tick_event(ED, ED.mono_wait, arg)
        if p then
            p.main_thread = not proc_cb
            ED.mono_run = p
        end
        return
    end
    g_t_insert(ED.event, arg) -- next frame
    if arg[2] == nil then 
        local pos1, pos2 = string.find(arg[1], '自定义事件_任务')
        if pos1 and pos2 then 
            local ev_name = string.sub(arg[1], pos1, pos2)
            local param = string.sub(arg[1], pos2 + 1, -1)
            local new_earg = {}
            for k, v in pairs(arg) do 
                new_earg[k] = v
            end
            new_earg[1] = ev_name
            new_earg[2] = param
            arg = new_earg
        end
    end
    t.tick_callback(ED,arg) -- immediate
end

function t.parse_event(str)
    local pos = g_s_find(str,'@')
    if pos == nil then return str,'' end
    local ev = g_s_sub(str, 1, pos - 1)
    local txt = g_s_sub(str, pos + 1)
    return ev, txt
end

function t.parse_string(str,GF)
    local function parse(_str)
        local pf1,pf2 = g_s_find(_str,'@')
        local pf3,pf4 = g_s_find(_str,'#')
        if pf1 == nil or pf3 == nil then return _str end
        local str1 = g_s_sub(_str, 1, pf1 - 1)
        local str2 = g_s_sub(_str, pf4+1)
        local func = g_s_sub(_str,  pf2+1, pf3-1)
        local ret = GF.call(func)
        return str1 .. tostring(ret) .. parse(str2)
    end
    return parse(str)
end

-------------------------------------------
function t.add_callback(ED, cb, earg)
    local ev = earg[1]
    local cbs = ED.callback[ev] or {}
    ED.callback[ev] = cbs
    earg.cb = cb
    g_t_insert(cbs, earg)
end

function t.remove_callback(ED, cb, ev_name)
    local cbs = ED.callback[ev_name]
    if cbs == nil then return end
    for k = #cbs,1, -1 do
        local v = cbs[k]
        if v.cb == cb and v[1] == ev_name then
            g_t_remove(cbs, k)
            break
        end
    end
end

function t.tick_callback(ED,e) -- event
    local ev = e[1]
    if ev == nil then return end
    local cbs = ED.callback[ev]
    if cbs == nil then return end
    local call = {}
    collect_match(cbs, e, call)
    for k = 1, #call do
        GF.setevent_info(e)
        call[k].cb(table.unpack(e, 2, 100))
    end
end

-- 清空事件队列
-- @params(table)  ED: 事件系统数据
function t.clear_event_queue(ED)
    ED.event = {}
end

function t.get_co(ED, name)
    for co,v in pairs(ED.name) do
        if v == name then
            return co
        end
    end
end

-- 锁定事件与协程队列
function t.LockEventAndProgramQueue(ED)
    t.LockEventQueue(ED)
    t.LockProgramQueue(ED)
    ED.lock_count = ED.lock_count + 1
end

-- 锁定事件队列, 队列中未处理完毕的事件暂时不予以处理
function t.LockEventQueue(ED)
    if ED.lock_event_queue_stack then 
        table.insert(ED.lock_event_queue_stack, ED.lock_event_queue_idx)
    end
    ED.lock_event_queue_idx = #ED.event
end

-- 锁定协程队列
function t.LockProgramQueue(ED)
    if ED.lock_pending_running_stack then 
        table.insert(ED.lock_pending_running_stack, ED.lock_pending_running_idx)
    end
    if ED.lock_pending_start_stack then 
        table.insert(ED.lock_pending_start_stack, ED.lock_pending_start_idx)
    end
    ED.lock_pending_running_idx = #ED.pending_running
    ED.lock_pending_start_idx = #ED.pending_start
end

-- 解锁事件队列
function t.UnlockEventAndProgramQueue(ED)
    ED.lock_count = ED.lock_count - 1
    t.UnlockEventQueue(ED)
    t.UnlockProgramQueue(ED)
    if ED.lock_count <= 0 then
        ED.lock_count = 0
    end
end

function t.UnlockEventQueue(ED)
    local idx = table.remove(ED.lock_event_queue_stack)
    if idx then 
        ED.lock_event_queue_idx = idx
    else
        ED.lock_event_queue_idx = -1
    end
end

function t.UnlockProgramQueue(ED)
    local pending_running_idx = table.remove(ED.lock_pending_running_stack)
    local pending_start_idx = table.remove(ED.lock_pending_start_stack)
    if pending_running_idx then 
        ED.lock_pending_running_idx = pending_running_idx
    else
        ED.lock_pending_running_idx = -1
    end
    if pending_start_idx then 
        ED.lock_pending_start_idx = pending_start_idx
    else
        ED.lock_pending_start_idx = -1
    end
end

-- 判断是否处于锁定状态
function t.IsEventAndProgramQueueLocked(ED)
    return ED.lock_count > 0
end

function t.IsEventInQueue(ED, event_name)
	if ED.event then 
		for index, earg in ipairs(ED.event) do 
			if earg[1] == event_name then 
				return true
			end
		end
	end
    return false
end

function t.IsEventWaitExist(ED, event_name)
    if not (type(event_name) == 'string' and ED.wait[event_name] ~= nil and #ED.wait[event_name] > 0) then 
        return false
    end
    for index, event_info in ipairs(ED.wait[event_name]) do 
        if not (type(event_info.cond) == 'function' and event_info.cond() ~= true) then 
            return true
        end
    end
    return false
end


return t
