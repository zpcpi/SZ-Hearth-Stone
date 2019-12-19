--[[4006

]]
local G = require "gf"
local L = {}
local t = G.api

-- 指令结构
--[[
    以UI事件为驱动的任务系统
    约定绝对不修改数据
    通过抛出事件，来告知逻辑相关信息

    order
        共用信息池 -- table
            Caster
            ListenerList
        state -- 记录入口状态
            _edge -- 边信息

]]

local listener_count_max = 0
local cur_listener_list = {}
local create_listener_name = function ()
    local count = listener_count_max + 1
    listener_count_max = count

    return '|#listener#|#count#|' .. count
end

local add_listener = function (event_func, listener, order_info)
    if event_func then
        local key = create_listener_name()
        local earg = event_func(order_info)

        if order_info['ListenerList'] then
        else
            order_info['ListenerList'] = {}
        end
        table.insert(order_info['ListenerList'], {['key'] = key, ['event_name'] = earg[1]})

        G.api[key] = listener
        G.addListener(key, earg)
    end
end

local remove_listener = function (order_info)
    for _,t in ipairs(order_info['ListenerList'] or {}) do
        G.removeListener(t['key'], t['event_name'])
        G.api[t['key']] = nil
    end
    order_info['ListenerList'] = nil
end

--hide=true
--ret=o_order
t['卡牌注册指令'] = function (o_card_使用卡牌, i_order_当前指令)
    i_order_当前指令 = i_order_当前指令 or CARD_GET_ATTR(o_card_使用卡牌, '逻辑数据', '卡牌指令')
    local o_order_当前指令 = G.QueryName(i_order_当前指令)

    if o_order_当前指令 and o_order_当前指令['状态列表'] then
        local o_order_info_当前指令信息 = {}
        local state = 1
        local state_max = #o_order_当前指令['状态列表']

        G.call('卡牌注册指令_初始化', o_order_info_当前指令信息, o_card_使用卡牌)

        local function init_order_edge()
            -- 注销当前指令信息
            remove_listener(o_order_info_当前指令信息)

            -- 状态分支
            if (state > 0) and (state <= state_max) then
                local state_info = o_order_当前指令['状态列表'][state]
                local function create_listener(edge, t1, t2)
                    local function worker()
                        local next = 0
                        if t[edge['条件']](o_order_info_当前指令信息) then
                            next = t1
                            t[edge['修改数据']](o_order_info_当前指令信息)
                        else
                            next = t2
                        end
                        print(G.event_info())
                        print('asd', string.format('0x%x', o_card_使用卡牌.name), edge.showname, state, next)
                        if next ~= 0 then
                            state = next
                            init_order_edge()
                        end
                    end
        
                    -- 创建动态key，注册监听
                    add_listener(t[edge['事件']], worker, o_order_info_当前指令信息)
                end

                for index = 1, #state_info['监测列表'], 1 do
                    create_listener(state_info['监测列表'][index], state_info['跳转节点'][index], state_info['分支跳转节点'][index])
                end
            elseif state == -1 then
                -- 执行成功
                G.call('卡牌注册指令_完成', o_order_info_当前指令信息)

                -- 执行卡牌使用效果
                G.call('卡牌使用_主流程', '我方', o_order_info_当前指令信息)
            elseif state == -2 then
                G.call('卡牌注册指令_退出', o_order_info_当前指令信息)
                -- 重新注册指令
                G.call('卡牌注册指令', o_card_使用卡牌, i_order_当前指令)
            end
        end

        init_order_edge()
    end
end