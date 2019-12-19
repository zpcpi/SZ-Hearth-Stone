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
    G.call('对决_初始化对决角色', '我方')
    -- 初始化卡牌实例表
    G.call('卡牌实例表_初始化')

    G.call('对决_初始化战场', G.misc().对决类型)
    G.call('对决_初始化我方对决牌库')
    G.start_program('对决_决定初始卡牌')
    G.start_program('对决_流程控制')
end

t['对决_决定初始卡牌'] = function()
    -- TODO：设置英雄
    G.call('角色_战场_设置英雄', '我方', G.call('卡牌实例化', G.QueryName(0x100600aa)))

    -- TODO: 先抽 3(?) 张
    for i = 1, 3 do 
        G.call('角色_抽取随机卡牌', '我方', '我方')
    end

    -- TODO: 等待换牌结束
    -- TODO: 换牌
    if not G.call('对决_我方是否是先手') then 
        -- 后手添加硬币
        local o_card_硬币 = G.call('卡牌实例化', G.QueryName(0x1006000e))
        G.call('角色_添加手牌', '我方', o_card_硬币, true)
    end
end

t['对决_流程控制'] = function()
    G.call('对决_重置当前回合数')
    if not G.call('对决_我方是否是先手') then 
        G.call('对决_等待对方回合结束')
    end
    while not G.call('对决_是否超过最大回合') do
        G.call('对决_回合开始')
        G.call('对决_更加当前回合数', 1)
        G.call('对决_设置当前回合玩家绝对身份', G.call('房间_获取绝对身份', '我方'))
        G.call('对决_等待我方回合结束')
        G.call('对决_设置当前回合玩家绝对身份', G.call('房间_获取绝对身份', '敌方1'))
        -- TODO: 播放对方回合开始动画
        G.call('对决_等待对方回合结束')
    end
end

t['对决_重置当前回合数'] = function()
    G['当前回合数'] = 0
end

t['对决_更加当前回合数'] = function(int_回合数跨度)
    G['当前回合数'] = G['当前回合数'] or 0
    G['当前回合数'] = G['当前回合数'] + int_回合数跨度
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

t['对决_设置当前回合玩家绝对身份'] = function(any_绝对身份)
    G['当前回合玩家绝对身份'] = any_绝对身份
end

t['对决_获取当前回合玩家绝对身份'] = function()
    return G['当前回合玩家绝对身份']
end

t['对决_当前是否是我方回合'] = function()
    local any_我方绝对身份 = G.call('房间_获取绝对身份', '我方') 
    local any_当前回合玩家绝对身份 = G.call('对决_获取当前回合玩家绝对身份')
    if any_我方绝对身份 == any_当前回合玩家绝对身份 then 
        return true
    end
    return false
end

--ret=o_deck
t['对决_获取对决卡组'] = function()
    return G['对决卡组']
end

t['对决_设置对决卡组'] = function(o_deck_卡组)
    G['对决卡组'] = o_deck_卡组
end

--ret=o_battle_role
t['对决_初始化对决角色'] = function(estr_player_相对身份)
    local o_deck_卡组 = G.call('对决_获取对决卡组')
    if not G.call('对决_卡组模板是否有效', o_deck_卡组) then
        G.call('提示_添加提示', '卡组模板数据不正确')
        return 
    end
    -- TODO: 暂时读取卡组的第一职业作为角色职业
    local i_profession_职业 = o_deck_卡组.职业[1]
    local o_battle_role_对决角色 = {}
    o_battle_role_对决角色.生命值 = G.call('对决_获取初始生命值')
    o_battle_role_对决角色.职业 = i_profession_职业
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    G['对决角色'] = G['对决角色'] or {}
    G['对决角色'][estr_absolute_id_type_绝对身份] = o_battle_role_对决角色
    return o_battle_role_对决角色
end

--ret=int
t['对决_获取对决角色生命值'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('对决_获取对决角色生命值_绝对身份', estr_absolute_id_type_绝对身份)
end

--ret=o_battle_role
t['对决_获取对决角色'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('对决_获取对决角色_绝对身份', estr_absolute_id_type_绝对身份)
end

--ret=int
t['对决_获取初始生命值'] = function()
    -- TODO: 应该做成可配置可修改的
    return 30
end

--ret=o_deck
t['对决_初始化我方对决牌库'] = function()
    local o_deck_卡组 = G.call('对决_获取对决卡组')
    G['对决牌库'] = {}
    if not G.call('对决_卡组模板是否有效', o_deck_卡组) then 
        G.call('提示_添加提示', '卡组模板数据不正确')
        return 
    end
    for _, o_card_卡片模板 in ipairs(o_deck_卡组['卡牌列表']) do 
        local o_card_卡片实例 = G.call('卡牌实例化', o_card_卡片模板)
        table.insert(G['对决牌库'], o_card_卡片实例)
    end
end

--ret=boolean
t['对决_卡组模板是否有效'] = function(o_deck_卡组)
    return type(o_deck_卡组) == 'table' and type(o_deck_卡组.职业) == 'table' and #o_deck_卡组.职业 > 0
end

--ret=o_deck
t['对决_获取我方对决牌库'] = function()
    return G['对决牌库']
end

t['对决_结算_相对身份'] = function(estr_player_相对身份, boolean_是否胜利)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)

    G.call('网络通用_广播消息', '对决_结算_绝对身份', estr_absolute_id_type_绝对身份, boolean_是否胜利)
end

t['对决_投降'] = function()
    G.call('对决_结算_相对身份', '我方', false)
    -- TODO: 投降碎裂的动画接入, 界面显示也需要进入动画队列
end
