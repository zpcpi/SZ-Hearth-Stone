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
        state -- 记录入口状态
            _edge -- 边信息

]]

--hide=true
--ret=o_order
t['卡牌注册指令'] = function (o_card_使用卡牌)
    local o_order_当前指令 = o_card_使用卡牌['卡牌指令']
    
    if o_order_当前指令 and o_order_当前指令['状态列表'] then
        local o_order_info_当前指令信息 = {}
        local state = 1
        local state_max = #o_order_当前指令['状态列表']

        o_order_info_当前指令信息['Caster'] = o_card_使用卡牌

        local function init_order_edge()
            --todo，注销监听
            if (state > 0) and (state <= state_max) then
                local state_info = o_order_当前指令['状态列表'][state]
                local function create_listener(edge, t1, t2)
                    local function worker()
                        local next = 0
                        if edge['条件'](o_order_info_当前指令信息) then
                            next = t1
                            edge['修改数据'](o_order_info_当前指令信息)
                        else
                            next = t2
                        end
                        if next ~= 0 then
                            state = next
                            init_order_edge()
                        end
                    end
        
                    --todo，生成唯一key
                    t['xxx'] = worker
                    G.addListener('xxx', edge['事件'])
                end

                for index = 1, #state_info['监测列表'], 1 do
                    create_listener(state_info['监测列表'][index], state_info['跳转节点'][index], state_info['分支跳转节点'][index])
                end
            elseif state == -1 then

            elseif state == -2 then

            end
        end

        init_order_edge()
    end
end




























