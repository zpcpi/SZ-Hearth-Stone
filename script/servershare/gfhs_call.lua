
local GF = require "gfbase"
local co = require "co"
local es = require 'gevent'
local js  = require "cjson.c"
local _d

local os_clock = os.clock
local table_unpack = table.unpack
local table_insert = table.insert
GF.notify = {}
local api = {}
GF.api = api
GF.noti_call_count = 0
GF.isCollect=true
local trig_count = 0
local lastGCTime = 0
local boolean_needGC = false
GF.o_meta = {
	__index = function(t,k)
		local string_k = tostring(k)
		local v = rawget(t,GF.esc..tostring(k))
		if v then
			if type(v) == 'number' then
				v = GF.QueryName(v)
				rawset(t,k,v)
			else
				rawset(t,GF.esc..string_k,nil)
				v = GF.call(v)
				rawset(t,k,v)
			end
			if not GF.is_editor then
				rawset(t,GF.esc..string_k,nil)
			end
		end
		return v
	end,
	__newindex = function(t,k,v)
		rawset(t,k,v)
		if not GF.is_editor then
			rawset(t,'__'..tostring(k),nil)
		end
	end,
	__len = function(t)
		if t.n then return t.n + 1 end
		local i = 1
		while t[i] do
			i = i + 1
		end
		return i - 1
	end
}

function GF.editor_meta(value)
	if type(value) == 'table' then
		for k,v in pairs(value) do
			GF.meta(v)
		end
		local old_meta = getmetatable(value)
		if old_meta == nil then
			setmetatable(value, GF.o_meta)
		end
	end
end

function GF.meta(value)
	if GF.is_editor then
		return
	end
	if NEW_DATA_TEST_FZT then
		return
	end
	if type(value) == 'table' then
		for k,v in pairs(value) do
			GF.meta(v)
		end
		local old_meta = getmetatable(value)
		if old_meta == nil then
			setmetatable(value, GF.o_meta)
		end
	end
end

function GF.getFuncTips(farg_table)
	local func_name = farg_table[1]
	if GF.api[func_name] then
		local string_tips = c.GetFuncTips(func_name)
		return string_tips
	end
	return ""
end


local function noti_call(func,...)
	GF.noti_call_count = GF.noti_call_count + 1
	local f = GF.notify[func]
	local res
	if f then
		res = {f(...)}
	end
	GF.noti_call_count = GF.noti_call_count - 1
	if res ~= nil then
		return table_unpack(res)
	end
end

function GF.do_profile(funcName, funcNamePrefix, isCallOrRet)
	if GF.profileData then
		if type(funcName) ~= 'string' then
			return
		end
		funcName = '(' .. funcNamePrefix .. ')' .. ',' .. funcName
		local d = GF.profileData[funcName]
		if not d then
			d = {
				call_count = 0,
				call_time = 0,
				total_time = 0,
			}
			GF.profileData[funcName] = d
		end
		if isCallOrRet then
			-- call
			d.call_count = d.call_count + 1
			d.call_time = os_clock()
		else
			-- return
			if d.call_time > 0 then
				d.total_time = d.total_time + (os_clock() - d.call_time)
				d.call_time = 0
			end
		end
	end
end

GF.noti_call = noti_call
function GF.call(func,ex,...)
	local f
	local type_func = type(func)
	if type_func == 'string' then
		f = GF.api[func]
	elseif GF.IsTable(func) then
		local a = {}
		setmetatable(a, nil)
		for k,v in pairs(a) do
			a[k] = nil
		end
		for k,v in pairs(func) do
			a[k] = v
		end
		setmetatable(a, GF.o_meta)
		if type(a.n) == 'number' then
			for i = 1, a.n + 1 do
				rawset(a,i,a[i])
			end
		else
			for i = 1,#a do
				rawset(a,i,a[i])
			end
		end
		if ex then
			local arg = {ex, ...}
			local index = 2
			for k,v in ipairs(arg) do
				table_insert(a,index,v)
				index = index + 1
			end
		end
		local ret = GF.call(table_unpack(a))
		return ret
	elseif type_func == 'function' then
		f = func
	else
		f = GF.api[func]
	end
	local r1
	if f ~= nil then
		r1 = {f(ex, ...)}
		if GF.notify[func] == nil then
			return table_unpack(r1)
		end
	end
	noti_call(func, ex, ...)
	if r1 then
		return table_unpack(r1)
	else
		return r1
	end
end


local srED = es.newctx()
GF.srED = srED

function GF.srvEventData(ED)
	ED.uncase = ED.uncase or {}
	GF.srED = ED
	srED = ED
end
function GF.Clean_srED()
	srED = es.newctx()
	GF.srED = srED
end
local ev_info

local function init_ev_info()
	ev_info = {}
	for k,v in ipairs(require('o_event')[2]) do
		ev_info[v.name] = v
	end
end

function GF.needPreloadRes()
	GF.cacheData.need_preload_res = true
end

function GF.preloadResRun()
	if GF.cacheData and GF.cacheData.need_preload_res and GF.cacheData.preloadResource then
		GF.cacheData.need_preload_res = false
		GF.SetPreload(GF.cacheData.preloadResource, function()
			GF.trig_event('preload_res_over')
		end)
	end
end

table.insert(GF.update, function(t)
	if GF.is_editor then 
		return
	end
	GF.preloadResRun()
	es.tick(srED)
	if os_clock() - lastGCTime > 60 then -- 3分钟没有gc就gc一次
		boolean_needGC = true
	end
	if boolean_needGC then
		GF.callGC()
	end
end)

function GF.callGC()
	trig_count = 0
	boolean_needGC = false
	lastGCTime = os_clock()
	collectgarbage("collect")
	print('gc time:', os_clock() - lastGCTime)
end

function GF.get_event_def_data(event_name)
	if ev_info == nil then 
		init_ev_info()
	end
	return ev_info[event_name]
end

function GF.wait1(arg,...)
	local func = arg
	local earg
	if type(arg) == 'table' then -- new case
		func = arg[1]
	end
	local noti_func = es.parse_event(func)

	GF.case(0,arg,...)
	if type(arg) == 'table' then -- new case
		earg = arg
	else
		earg = {arg,...}
	end
	GF.set_readonly(true)
	noti_call(noti_func, earg)
	GF.set_readonly(false)

	local p = co.yield()
	local ev = p.e
	--es.remove_wait(srED, p)
	local endfunc = noti_func..'end'
	GF.set_readonly(true)
	noti_call(endfunc, earg)
	GF.set_readonly(false)
	srED.info = ev
end

function GF.wait_case()
	local arg = GF.get_case_event()
	for k = 1,#arg do
		local func = arg[k][1]
		noti_call(func, arg[k])
	end
	local p = co.yield()
	local ev = p.e

	for k = 1,#arg do
		local func = arg[k][1]
		noti_call(func..'end', arg[k])
	end
	srED.info = ev
	return p.id
end

function GF.wait_case_pure()
	local arg = GF.get_case_event()
	local p = co.yield()
	local ev = p.e

	srED.info = ev
	return p.id
end

function GF.is_newgame()
	return #srED.wait <= 1
end

local function program_exit(ct)
	srED.uncase[ct] = nil
end

function GF.start_program(fname, ...)
	local func = api[fname]
	if func then
		local p = es.start_program(srED,fname, func, {...}, program_exit)
		return p
	end
end

function GF.remove_program(p, with_timer)
	if type(GF.update_data_event_list) == 'function' then
		GF.update_data_event_list(srED, p)
	end
	if with_timer then
		local timer = GF.__timer
		local rco
		if type(p) == 'string' then
			rco = es.get_co(srED, p)
		else
			rco = p.co
		end
		for k = #timer, 1, - 1 do
			if timer[k][2] == rco then
				table.remove(timer,k)
			end
		end
	end
	es.remove_wait(srED, p)
	local co_name
	local co_info
	if type(p) == 'string' then 
		co_name = p
		co_info = GF.get_co_by_name(co_name)
	else
		co_info = p.co
	end
	for k, v in pairs(srED.name) do
		if co_info and co_info == k then 
			srED.name[k] = nil
			return
		end
	end
end

function GF.get_co_by_name(co_name)
	for k = #srED.wait, 1, -1 do
		local pco = srED.wait[k].co
		if srED.name[pco] == co_name then 
			return pco
		end
    end
end

local function is_uncase(id)
	local rco = co.running()
	if srED.uncase[rco] then
		return srED.uncase[rco][id]
	end
end

function GF.case(id, ...)
	if is_uncase(id) then return end
	local p = {...}
	if GF.IsTable(p[1]) then -- new case
		if type(p[2]) == 'function' then
			p[1].cond = p[2]
		end
		if type(p[3]) == 'number' then
			p[1].prior = p[3]
		end
		if type(p[4]) == 'string' then
			p[1].group = p[4]
		end
		if type(p[1][2]) == 'string' then
			p[1][2] = es.parse_string(p[1][2],GF)
		end
		p = p[1]
	else
		for k,v in pairs(p) do
			if type(v) == 'function' then
				p[k] = nil
				p.cond = v
				break
			end
		end
	end

	local event_suffix
	p[1], event_suffix = es.parse_event(p[1])

	p.id = id
	p.co = co.running()
	local didx = 2
	if id == 0 then
		didx = 3
	end
	local di = debug.getinfo(didx, 'fl')
	p._func = di.func
	p._cline = di.current
	p.suffix = event_suffix
	if ev_info == nil then
		init_ev_info()
	end
	local info = ev_info[p[1]]
	if info then
		if p.group == nil or p.group == "" then
			p.group = info.def_group
		end
		p.mono = info.mono
	end
	es.add_wait(srED, p)
	return p
end

function GF.uncase(id)
	local rco = co.running()
	srED.uncase[rco] = srED.uncase[rco] or setmetatable({}, co.weak_meta)
	srED.uncase[rco][id] = 1
end

function GF.clearuncase()
	local rco = co.running()
	local uncase = srED.uncase[rco]
	if uncase then
		for k,v in pairs(uncase) do
			uncase[k] = nil
		end
	end
end

function GF.event_stop(bstop)
	srED.stop = bstop
end


function GF.set_key_event(ev)
	if not srED.key_event then
		srED.key_event = {}
	end
	srED.key_event[ev] = {}
	srED.key_event[ev].group = ev_info[ev].def_group
end

function GF.unset_key_event(ev)
	if not srED.key_event then
		return
	end
	srED.key_event[ev] = nil
end

function GF.setevent_info(info)
	srED.info = info
end

function GF.event_info()
	local info = srED.info
	if info then
		return table_unpack(info, 2, info._sz)
	end
end

function GF.event_info_length()
	local info = srED.info
	if info then
		return info._sz
	end
	return 0
end

function GF.event_name()
	local info = srED.info
	if info then
		return srED.info[1] or ""
	end
end

function GF.addListener(fname, earg, cond, prior, group, isBattleListener)
	local event = earg
	if GF.IsTable(earg) == false then
		earg = {event}
	end
	earg.cond = cond
	earg.prior = prior
    earg.group = group
    earg.isBattleListener = isBattleListener
	local func = api[fname]
	if func == nil then return end
	es.add_callback(srED, func, earg)
end

function GF.clearBattleListener()
    if srED.callback == nil then 
        return
    end
    for event, eargList in pairs(srED.callback) do 
        for i = #eargList, 1, -1 do 
            local earg = eargList[i]
            if earg.isBattleListener then 
                table.remove(eargList, i)
            end
        end
    end
end

function GF.removeListener(fname,ev_name)
	local func = api[fname]
	if func == nil then return end
	es.remove_callback(srED, func, ev_name)
end

function GF.get_listering(ev_name)
	return srED.wait[ev_name]
end

function GF.find_event(...)
	local arg = {...}
	local same
	for _,v in ipairs(srED.event) do
		same = true
		for k = 1,#arg do
			if arg[k] ~= v[k] then
				same = false
				break
			end
		end
		if same then
			return true
		end
	end
end

function GF.get_case_event()
	local cc = co.running()
	local lst = {}
	local idtab = {}
	srED.wait.__mono_wait = srED.mono_wait
	for _,wait in pairs(srED.wait) do
		for k = #wait, 1, -1 do
			local p = wait[k]
			if p.co == cc then
				if not GF.ContainData(lst,p) then
					table_insert(lst, p)
					idtab[p] = p.id or 1
				end
			end
		end
	end
	table.sort(lst,function(a,b)
		return idtab[a] < idtab[b]
	end)
	srED.wait.__mono_wait = nil
	return lst
end

function GF.get_curcase(event_name, lst)
	local cc = co.running()
	local ev_wait = srED.wait[event_name]
	for _,wait in ipairs({srED.mono_wait, ev_wait}) do
		--for k = #wait, 1, -1 do
		for k = 1, #wait do
			local p = wait[k]
			if p.co == cc and p[1] == event_name and (not p.cond or p.cond()) then
				if lst then
					table_insert(lst, p)
				else
					return p
				end
			end
		end
	end
	return lst
end

function GF.get_case(event_name, lst)
	local ev_wait = srED.wait[event_name]
	for _,wait in ipairs({srED.mono_wait, ev_wait}) do
		--for k = #wait, 1, -1 do
		for k = 1, #wait do
			local p = wait[k]
			if p[1] == event_name then
				if lst then
					table_insert(lst, p)
				else
					return p
				end
			end
		end
	end
	return lst
end

-- 获取当前等待的 case 总数
-- @return  返回 case 的数量
function GF.get_case_count()
	local cc = co.running()
    local case_count = 0
	srED.wait.__mono_wait = srED.mono_wait
    for _,wait in pairs(srED.wait) do
        for k = #wait, 1, -1 do
            local p = wait[k]
			if p.co == cc then
            	case_count = case_count + 1
            end
        end
    end
    srED.wait.__mono_wait = nil
    return case_count
end

function GF.trig_event(...)
	local run, main_thread = co.running()
	local ev = {...}

	if ev_info == nil then
		init_ev_info()
	end
	if type(GF.trig_event_dreamland) == 'function' then
		GF.trig_event_dreamland(ev, main_thread)
	end

	if srED.key_event and ev_info[ev[1]] then
		for k, v in pairs(srED.key_event) do
			if v.group == ev_info[ev[1]].def_group and ev[1] ~= k then
				return
			end
		end
	end
	srED.info = {...}
	es.trig_event(srED, not main_thread, ...)
	
	if main_thread and ev[1] ~= '等待下一帧' and ev[1] ~= '任务等待下一帧' then -- 主协程
		trig_count = trig_count + 1
		-- table_insert(GF.MSG_QUEUE,ev)
	end
	if trig_count > 30 then
		boolean_needGC = true
	end
	
	ev = nil
end

function GF.remove_all_program()
	local pname = {}
	for k, v in pairs(srED.name) do
		table_insert(pname, v)
	end
	for i = 1, #pname do
		es.remove_wait(srED, pname[i])
	end
end

-- 获取所有协程信息
function GF.get_all_programinfo()
	local coroutineinfo = {}
	for k, v in pairs(srED.name) do
		table_insert(coroutineinfo, {name = v})
	end

	return coroutineinfo
end

-- 判断一个协程是否存在
-- @params(string)  name: 协程的名称
-- @return(boolean)  返回是否存在
function GF.program_alive(name)
	for _,wait in pairs(srED.wait) do
		for k = #wait, 1, -1 do
			if srED.name[wait[k].co] == name then
				return true
			end
		end
	end
	return false
end

-- 判断一个协程是否存在
-- @params(string)  name: 协程的名称
-- @return(boolean)  返回是否存在
function GF.co_alive(coroutineinfo)
	if co.status(coroutineinfo) == 'dead' then 
		return false
	end
	for k, v in pairs(srED.name) do
		if k == coroutineinfo then
			return true
		end
	end
	return false
end

-- 获取一个协程的数量
-- @params(string)  name: 协程的名称
-- @return(int)  返回协程的数量
function GF.GetProgramCount(name)
	local count
	count = 0
	for k, v in pairs(srED.name) do
		if v == name then
			count = count + 1
		end
	end
	return count
end

-- 清空事件队列
-- @params(table)  ED: 事件系统数据
function GF.ClearEventQueue()
    es.clear_event_queue(srED)
end

-- 输出所有协程信息
function GF.LogEventInfo(dont_show_detail)
	GF.log('[gfcall]->LogEventInfo')
	GF.logtable(srED, dont_show_detail)
end

function GF.IsStartProgramQueueEmpty()
	local head_index

	if not (type(srED.pending_start) == 'table' and #srED.pending_start > 0) then
		return true
	end

	if #srED.pending_start <= srED.lock_pending_start_idx then 
		return true
	end

	return false
end

function GF.IsMonoWaitEmpty()
	if type(srED.mono_wait) == 'table' and #srED.mono_wait > 0 then
		return false
	end
	return true
end

function GF.GetMonoWaitCount()
	if type(srED.mono_wait) == 'table' then
		return #srED.mono_wait
	end
	return 0
end

function GF.GetMonoWait()
	return srED.mono_wait
end

function GF.ResetMonoWait()
	srED.mono_wait = {}
end

function GF.SetMonoWait(mono_wait)
	srED.mono_wait = mono_wait
end

function GF.LockEventAndProgramQueue()
	es.LockEventAndProgramQueue(srED)
end

function GF.UnlockEventAndProgramQueue()
	es.UnlockEventAndProgramQueue(srED)
end

function GF.IsNotiCall()
	return GF.noti_call_count > 0
end

function GF.set_readonly(boolean_open)
end

function GF.get_readonly()
end

function GF.reset_net_event_count()
end

function GF.IsEventInQueue(event_name)
	return es.IsEventInQueue(srED, event_name)
end

function GF.IsEventWaitExist(event_name)
	return es.IsEventWaitExist(srED, event_name)
end

function GF.IsEventAndProgramQueueLocked()
	return es.IsEventAndProgramQueueLocked(srED)
end
