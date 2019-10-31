--[[4009

]]
local G = require "gf"
local L = {}
local t = G.api

t['对决_初始化战场'] = function(estr_battle_type_对决类型)

end

--ret=estr_battle_type
t['对决_获取对决类型'] = function()
    return G.misc().对决类型
end

t['对决_开始'] = function()
    if not G.call('房间_是否满足开始条件') then 
        G.call('系统_输出信息', '人数不足， 无法开始游戏！')
        return 
    end
    if not G.call('房间_是否所有玩家准备就绪') then 
        G.call('系统_输出信息', '有玩家没有准备就绪， 无法开始游戏！')
        return 
    end
    -- TODO: 根据游戏模式初始化数据
    if G.call('主机_是主机') then 
        G.call('房间_分配绝对身份')
        G.call('网络通用_广播消息', '对决_开始')
    end
    G.call('对决_初始化战场', G.misc().对决类型)
    G.start_program('对决_决定初始卡牌')
    G.start_program('对决_流程控制')
end

t['对决_决定初始卡牌'] = function()
    -- TODO：设置英雄
    G.call('角色_战场_设置英雄', '我方', G.QueryName(0x10060079))

    -- TODO: 先抽 3(?) 张
    for i = 1, 3 do 
        G.call('角色_抽取随机卡牌', '我方', '我方')
    end

    -- TODO: 等待换牌结束
    -- TODO: 换牌
    if not G.call('对决_我方是否是先手') then 
        local o_card_硬币 = G.QueryName(0x1006000e)
        
        -- 后手添加硬币
        G.call('角色_添加手牌', '我方', o_card_硬币)
    else
        -- 测试用卡牌
        G.call('角色_添加手牌', '我方', G.QueryName(0x10060061))
    end
end

t['对决_流程控制'] = function()
    if not G.call('对决_我方是否是先手') then 
        G.call('对决_等待对方回合结束')
    end
    while not G.call('对决_是否超过最大回合') do
        G.call('对决_回合开始')
        G.call('对决_等待我方回合结束')
        G.call('对决_等待对方回合结束')
    end
end

t['对决_回合开始'] = function()
    G.call('角色_设置水晶数据_回合开始', '我方')
    G.call('角色_抽取随机卡牌', '我方', '我方')
end

t['对决_我方回合结束'] = function()
    local any_玩家绝对身份 = G.call('房间_获取绝对身份', '我方')
    G.trig_event('对决事件_回合结束', any_玩家绝对身份)
    G.call('网络通用_广播消息', '通用_触发事件', '对决事件_回合结束', any_玩家绝对身份)
end

t['对决_我方是否是先手'] = function()
    local any_玩家绝对身份 = G.call('房间_获取绝对身份', '我方')
    return G.call('对决_是否是先手身份', any_玩家绝对身份)
end

t['对决_等待我方回合结束'] = function()
    local any_玩家绝对身份 = G.call('房间_获取绝对身份', '我方')
    G.wait1('对决事件_回合结束', any_玩家绝对身份)
end

t['对决_等待对方回合结束'] = function()
    local any_上一个行动玩家身份 = G.call('对决_获取上一个行动绝对角色身份')
    G.wait1('对决事件_回合结束', any_上一个行动玩家身份)
end

t['对决_获取上一个行动绝对角色身份'] = function()
    local any_玩家绝对身份 = G.call('房间_获取绝对身份', '我方')
    if G.misc().对决类型 == '1v1' then
        if any_玩家绝对身份 == '红1' then 
            return '蓝1'
        else
            return '红1'
        end
    elseif G.misc().对决类型 == '2v2' then
        -- TODO: 2v2 行动顺序待定
    end
    print('[p_battle] -> Error! Cannot find last act player!')
end

t['对决_是否是先手身份'] = function(any_玩家绝对身份)
    return any_玩家绝对身份 == '红1'
end

t['对决_是否超过最大回合'] = function()
    -- TODO: 判断当前回合是否超过最大回合
    return false
end