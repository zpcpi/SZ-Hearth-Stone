--[[4009

]]
local G = require "gf"
local L = {}
local t = G.api

t['对决_初始化战场'] = function(i_game_mode_游戏模式)
    -- 根据游戏模式入口函数初始化战场
    local o_game_mode_游戏模式 = G.QueryName(i_game_mode_游戏模式)
    if o_game_mode_游戏模式 == nil then 
        G.call('系统_输出信息', '游戏模式错误！')
        return
    end
    G.call(o_game_mode_游戏模式.初始化函数名)
end

t['对决_初始化1v1战场'] = function()
end

t['对决_初始化2v2战场'] = function()
    -- TODO: 2v2 游戏模式初始化
end

t['对决_开始'] = function()
    if not G.call('主机_是主机') then 
        -- 只有主机可以开始游戏
        return 
    end
    if not G.call('房间_是否满足开始条件') then 
        return 
    end
    if not G.call('房间_是否所有玩家准备就绪') then 
        G.call('系统_输出信息', '有玩家没有准备就绪， 无法开始游戏！')
        return 
    end
    G.call('对决_重置对决结果')
    G.call('对决_初始化界面')
    G.call('网络通用_广播消息', '对决_初始化界面')
    G.call('战斗AI_AI空位补全AI')
    -- TODO: 根据游戏模式初始化数据
    G.call('房间_分配绝对身份')
    -- 流程监听初始化
    G.call('通用逻辑_默认流程注册')
    for _, o_room_player_玩家信息 in ipairs(G.misc().房间玩家列表) do 
        G.call('通用逻辑_角色相关流程注册', o_room_player_玩家信息.绝对身份)
    end
    G.misc().当前效果堆栈 = G.call('create_stack')
    -- 清空卡牌实例
    G.ClearDynamicData('o_card')
    -- AI 模块初始化
    G.call('战斗AI_对决初始化')
    for _, o_room_player_玩家信息 in ipairs(G.misc().房间玩家列表) do 
        G.call('对决_初始化数据', o_room_player_玩家信息)
        G.call('对决_初始化协程', o_room_player_玩家信息)
    end
end

t['对决_初始化界面'] = function()
    G.call('对决_初始化战场', G.call('对决_获取当前游戏模式'))
end

t['对决_初始化数据'] = function(o_room_player_玩家)
    G.trig_event('流程_对局开始', o_room_player_玩家.绝对身份, o_room_player_玩家)
end

t['对决_初始化协程'] = function(o_room_player_玩家)
    -- TODO: 完善初始化协程逻辑
    G.start_program('对决_决定初始卡牌', o_room_player_玩家)
    G.start_program('对决_流程控制', o_room_player_玩家)
end

t['对决_决定初始卡牌'] = function(o_room_player_玩家)
    local estr_player_相对身份 = G.call('房间_获取相对身份', o_room_player_玩家.绝对身份)
    -- TODO: 先抽 3(?) 张
    for i = 1, 3 do 
        G.call('角色_牌库抽取卡牌', o_room_player_玩家.绝对身份, o_room_player_玩家.绝对身份)
    end

    -- TODO: 等待换牌结束
    -- TODO: 换牌
    if not G.call('对决_是否是先手身份', o_room_player_玩家.绝对身份) then 
        -- 后手添加硬币
        local estr_absolute_id_type_绝对身份 = o_room_player_玩家['绝对身份']
        local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)
        
        local o_card_硬币 = G.call('卡牌实例化', G.QueryName(0x1006000e), estr_player_相对身份)

        G.call('技能效果_效果树_执行子效果', {
            ['Player'] = estr_player_相对身份,
            ['卡牌来源'] = '发现',
        },function ()
            G.call('角色属性_手牌_添加', estr_player_相对身份, o_card_硬币, true)
        end)
    end
end

t['对决_流程控制'] = function(o_room_player_玩家)
    local estr_absolute_id_type_绝对身份 = o_room_player_玩家.绝对身份
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)
    G.call('对决_重置当前回合数', estr_absolute_id_type_绝对身份)
    G.trig_event('流程_游戏开始', estr_absolute_id_type_绝对身份)
    if not G.call('对决_是否是先手身份', estr_absolute_id_type_绝对身份) then 
        G.call('对决_等待对方回合结束', estr_absolute_id_type_绝对身份)
    end
    while not G.call('对决_是否超过最大回合') do
        G.call('对决_增加当前回合数', estr_absolute_id_type_绝对身份, 1)
        G.call('对决_设置当前回合玩家绝对身份', estr_absolute_id_type_绝对身份)
        G.call('对决_回合开始', o_room_player_玩家)
        G.call('对决_等待我方回合结束', estr_absolute_id_type_绝对身份)
        -- TODO: 播放对方回合开始动画
        G.call('对决_等待对方回合结束', estr_absolute_id_type_绝对身份)
    end
    -- TODO: 超过最大回合, 平局
end

t['对决_重置当前回合数'] = function(estr_absolute_id_type_绝对身份)
    G[estr_absolute_id_type_绝对身份 .. '当前回合数'] = 0
end

t['对决_增加当前回合数'] = function(estr_absolute_id_type_绝对身份, int_回合数跨度)
    G[estr_absolute_id_type_绝对身份 .. '当前回合数'] = G[estr_absolute_id_type_绝对身份 .. '当前回合数'] + int_回合数跨度
end

t['对决_获取当前回合数'] = function(estr_absolute_id_type_绝对身份)
    return G[estr_absolute_id_type_绝对身份 .. '当前回合数'] or 0
end

t['对决_回合开始'] = function(o_room_player_玩家)
    local estr_absolute_id_type_绝对身份 = o_room_player_玩家.绝对身份
    G.trig_event('流程_回合开始', estr_absolute_id_type_绝对身份)
    G.call('网络通用_广播消息', '通用_触发事件', '流程_回合开始', estr_absolute_id_type_绝对身份)
end

t['对决_回合结束'] = function(estr_absolute_id_type_绝对身份)
    if estr_absolute_id_type_绝对身份 == nil then 
        return
    end
    G.trig_event('流程_回合结束', estr_absolute_id_type_绝对身份)
    G.call('网络通用_广播消息', '通用_触发事件', '流程_回合结束', estr_absolute_id_type_绝对身份)
end

t['对决_等待我方回合结束'] = function(estr_absolute_id_type_绝对身份)
    G.wait1('流程_回合结束', estr_absolute_id_type_绝对身份)
end

t['对决_等待对方回合结束'] = function(estr_absolute_id_type_绝对身份)
    local estr_absolute_id_type_上一个行动玩家身份 = G.call('对决_获取上一个行动角色绝对身份', estr_absolute_id_type_绝对身份)
    G.wait1('流程_回合结束', estr_absolute_id_type_上一个行动玩家身份)
end

t['对决_获取上一个行动角色绝对身份'] = function(estr_absolute_id_type_绝对身份)
    -- TODO: 身份映射表应该设置在 游戏模式 数据中
    local i_game_mode_游戏模式 = G.call('对决_获取当前游戏模式')
    if (i_game_mode_游戏模式 == 0x10150001) or (i_game_mode_游戏模式 == 0x10150003) then
        if estr_absolute_id_type_绝对身份 == '红1' then 
            return '蓝1'
        else
            return '红1'
        end
    elseif (i_game_mode_游戏模式 == 0x10150002) then
        -- TODO: 2v2 行动顺序待定
    end
    print('[p_battle] -> Error! Cannot find last act player!')
end

t['对决_是否是先手身份'] = function(estr_absolute_id_type_绝对身份)
    -- TODO: 先手判断应该记录在表里面
    return estr_absolute_id_type_绝对身份 == '红1'
end

t['对决_是否超过最大回合'] = function()
    -- TODO: 判断当前回合是否超过最大回合
    return false
end

t['对决_设置当前回合玩家绝对身份'] = function(any_绝对身份)
    G['当前回合玩家绝对身份'] = any_绝对身份
    if G.call('网络通用_能否广播') then 
        G.call('网络通用_广播消息', '对决_设置当前回合玩家绝对身份', any_绝对身份)
    end
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
t['对决_获取当前玩家对决卡组'] = function()
    local o_room_player_当前玩家信息 = G.call('系统_获取当前玩家信息')
    if o_room_player_当前玩家信息 == nil then 
        print('[对决_获取当前玩家对决卡组] 找不到当前玩家信息')
        return nil
    end
    return o_room_player_当前玩家信息.卡组 
end

t['对决_设置预设对决卡组'] = function(o_deck_卡组)
    local o_room_player_当前玩家信息 = G.call('系统_获取当前玩家信息')
    o_room_player_当前玩家信息.卡组 = {
        卡牌列表 = {},
        英雄 = o_deck_卡组.英雄,
        英雄技能 = o_deck_卡组.英雄技能,
        卡组名称 = o_deck_卡组.卡组名称,
        模式 = o_deck_卡组.模式,
    }
    for _, o_card_卡牌 in ipairs(o_deck_卡组.卡牌列表) do 
        local i_card_卡牌ID = o_card_卡牌.name
        table.insert(o_room_player_当前玩家信息.卡组.卡牌列表, i_card_卡牌ID)
    end
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

t['对决_初始化对决牌库'] = function(o_room_player_玩家)
    local o_deck_卡组 = G.call('对决_获取预设卡组', o_room_player_玩家)
    if not G.call('对决_卡组模板是否有效', o_deck_卡组) then 
        G.call('提示_添加提示', '[对决_初始化对决牌库] 卡组模板数据不正确, 是无效卡组')
        return 
    end

    local o_randomlib_牌库顶 = G.call('Create_Randomlib', G.QueryName(0x100c0004)) -- 顺序选取
    local o_randomlib_随机牌库 = G.call('Create_Randomlib', G.QueryName(0x100c0002)) -- 抽取随机
    local o_randomlib_牌库底 = G.call('Create_Randomlib', G.QueryName(0x100c0004)) -- 顺序选取

    local estr_absolute_id_type_绝对身份 = o_room_player_玩家['绝对身份']
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)
    for _, o_card_卡片模板 in ipairs(o_deck_卡组['卡牌列表']) do 
        -- todo，需要判断模板是否双方一致，比如自创卡
        local o_card_卡片实例 = G.call('卡牌实例化', o_card_卡片模板, estr_player_相对身份)

        o_randomlib_随机牌库:添加数据({o_card_卡片实例, 1})
    end

    -- 如果是AI的卡，那么打上未知标签
    if o_room_player_玩家.AI ~= nil then
        G.call('技能效果_效果树_执行子效果', {
            ['Target'] = G.call('array_map', o_randomlib_随机牌库.datas, function (data)
                return data['value']
            end),
        }, function ()
            G.call('技能效果_特性', {'未知'})
        end)
    end
    
    o_randomlib_牌库顶:初始化(false, true)
    o_randomlib_随机牌库:初始化(false, true)
    o_randomlib_牌库底:初始化(false, true)

    local estr_absolute_id_type_绝对身份 = o_room_player_玩家.绝对身份
    local string_牌库键 = estr_absolute_id_type_绝对身份 .. '牌库'
    G.misc()[string_牌库键] = {
        o_randomlib_牌库顶,
        o_randomlib_随机牌库,
        o_randomlib_牌库底,
    }
    G.trig_event('UI_牌库更新')
end

t['对决_初始化对决角色'] = function(o_room_player_玩家)
    local o_deck_卡组 = G.call('对决_获取预设卡组', o_room_player_玩家)
    if not G.call('对决_卡组模板是否有效', o_deck_卡组) then
        G.call('提示_添加提示', '[对决_初始化对决角色] 卡组模板数据不正确, 是无效卡组')
        return 
    end

    -- TODO: 暂时读取卡组的第一英雄作为角色英雄
    local hero = o_deck_卡组.英雄[1]
    -- TODO: 暂时读取英雄的第一衍生卡作为角色技能
    local skill = G.QueryName(hero).局外数据.衍生卡[1]
    local estr_absolute_id_type_绝对身份 = o_room_player_玩家['绝对身份']
    local estr_player_相对身份 = G.call('房间_获取相对身份', estr_absolute_id_type_绝对身份)
    
    G.call('角色_战场_设置英雄', estr_player_相对身份, G.call('卡牌实例化', G.QueryName(hero), estr_player_相对身份))
    G.call('角色_战场_设置英雄技能', estr_player_相对身份, G.call('卡牌实例化', G.QueryName(skill), estr_player_相对身份))
end

--ret=boolean
t['对决_卡组模板是否有效'] = function(o_deck_卡组)
    return type(o_deck_卡组) == 'table' and type(o_deck_卡组.英雄) == 'table' and #o_deck_卡组.英雄 > 0
end

--ret=o_deck
t['对决_获取我方对决牌库'] = function()
    return G['对决牌库']
end

t['对决_投降'] = function(estr_absolute_id_type_绝对身份)
    if estr_absolute_id_type_绝对身份 == nil then 
        estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', '我方') 
    end
    if G.call('主机_是主机') then 
        G.call('对决_结算对决结果', estr_absolute_id_type_绝对身份, false)
    else
        G.call('客机_向主机发送消息', '对决_投降', estr_absolute_id_type_绝对身份)
    end
    -- TODO: 投降碎裂的动画接入, 界面显示也需要进入动画队列
end

t['对决_重置对决结果'] = function()
    G.battleResult = nil
end

--ret=boolean
t['对决_获取对决结果'] = function(estr_absolute_id_type_绝对身份)
    if G.battleResult == nil then 
        return nil
    end
    return G.battleResult[estr_absolute_id_type_绝对身份]
end

t['对决_设置对决结果'] = function(estr_absolute_id_type_绝对身份, boolean_是否胜利)
    G.battleResult = G.battleResult or {}
    G.battleResult[estr_absolute_id_type_绝对身份] = boolean_是否胜利
    if G.call('网络通用_能否广播') then 
        G.call('网络通用_广播消息', '对决_设置对决结果', estr_absolute_id_type_绝对身份, boolean_是否胜利)
    end
end

t['对决_结算对决结果'] = function(estr_absolute_id_type_绝对身份, boolean_是否胜利)
    if G.call('对决_获取对决结果', estr_absolute_id_type_绝对身份) ~= nil then 
        return
    end
    local o_misc = G.misc()
    for index, o_room_player in ipairs(o_misc.房间玩家列表) do 
        local boolean_是同一阵营 = G.call('房间_是否同一阵营_绝对身份', o_room_player.绝对身份, estr_absolute_id_type_绝对身份)
        if boolean_是同一阵营 then 
            G.call('对决_设置对决结果', o_room_player.绝对身份, boolean_是否胜利)
        else
            G.call('对决_设置对决结果', o_room_player.绝对身份, not boolean_是否胜利)
        end
    end
    G.clearBattleListener()
end

--ret=_i_game_mode
t['对决_获取游戏模式列表'] = function()
    local _o_game_mode_游戏模式列表 = G.DBTable('o_game_mode')
    local _i_game_mode_游戏模式列表 = {}
    for _, o_game_mode_游戏模式 in ipairs(_o_game_mode_游戏模式列表) do 
        table.insert(_i_game_mode_游戏模式列表, o_game_mode_游戏模式.name)
    end
    return _i_game_mode_游戏模式列表
end

t['对决_设置游戏模式'] = function(i_game_mode_对决模式)
    if G.IsSteamAvaliable() then 
        G.Steam_SetLobbyData('gameMode', tostring(i_game_mode_对决模式))
        print('对决_设置游戏模式', 'gameMode', i_game_mode_对决模式)
    else
        G.misc().游戏模式 = i_game_mode_对决模式
        if G.call('网络通用_能否广播') then 
            G.call('网络通用_广播消息', '对决_设置游戏模式', i_game_mode_对决模式)
        end
    end
end

--ret=i_game_mode
t['对决_获取当前游戏模式'] = function()
    if G.IsSteamAvaliable() then 
        local gameMode = G.Steam_GetLobbyData('gameMode')
        return tonumber(gameMode) or 0
    else
        return G.misc().游戏模式 or 0x10150001
    end
end

--ret=o_deck
t['对决_获取预设卡组'] = function(o_room_player_玩家)
    local o_deck_卡组 = nil
    if o_room_player_玩家.AI ~= nil then 
        local i_deck_卡组 = G.call('战斗AI_获取随机卡组', o_room_player_玩家.AI)
        o_deck_卡组 = G.QueryName(i_deck_卡组)
    else
        local o_deck_template_预设卡组 = o_room_player_玩家.卡组 
        o_deck_卡组 = {
            卡组名称 = o_deck_template_预设卡组.卡组名称,
            卡牌列表 = {},
            英雄 = o_deck_template_预设卡组.英雄,
            英雄技能 = o_deck_template_预设卡组.英雄技能,
            模式 = o_deck_template_预设卡组.模式,
        }
        for _, i_card_卡片ID in ipairs(o_room_player_玩家.卡组.卡牌列表) do 
            local o_card_卡片 = G.QueryName(i_card_卡片ID)
            table.insert(o_deck_卡组.卡牌列表, o_card_卡片)
        end
    end
    return o_deck_卡组
end