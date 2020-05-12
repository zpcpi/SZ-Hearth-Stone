--[[401c

]]
local G = require "gf"
local L = {}
local t = G.api

t['战斗AI_添加AI玩家'] = function()
    local i_battle_ai_玩家 = G.call('战斗AI_获取随机AI玩家')
    local o_room_player_AI玩家 = {}
    o_room_player_AI玩家.玩家名称 = G.call('战斗AI_生成AI名称', i_battle_ai_玩家)
    o_room_player_AI玩家.准备就绪 = true
    o_room_player_AI玩家.AI = i_battle_ai_玩家
    G.call('房间_更新玩家信息', o_room_player_AI玩家)
end

t['战斗AI_玩家空位补全AI'] = function()
    local i_game_mode_游戏模式 = G.call('对决_获取当前游戏模式')
    local o_game_mode_游戏模式 = G.QueryName(i_game_mode_游戏模式)
    if o_game_mode_游戏模式 == nil then 
        G.call('提示_添加提示', '游戏模式不存在 ' .. tostring(i_game_mode_游戏模式))
        return
    end
    local int_当前玩家数量 = G.call('房间_获取玩家数')
    local int_需求玩家数量 = o_game_mode_游戏模式.玩家数要求 or 0
    if int_当前玩家数量 >= int_需求玩家数量 then 
        return
    end
    for i = int_当前玩家数量 + 1, int_需求玩家数量 do 
        G.call('战斗AI_添加AI玩家')
    end
end

--ret=i_battle_ai
t['战斗AI_获取随机AI玩家'] = function()
    local i_game_mode_当前游戏模式 = G.call('对决_获取当前游戏模式')
    -- FIXME: 这里每次都遍历, 会存在性能问题, 是否应该先在某处初始化一份哈希表数据
    local _o_battle_ai_AI列表 = G.DBTable('o_battle_ai')
    local _i_battle_ai_可用AI列表 = {}
    for _, o_battle_ai_AI in ipairs(_o_battle_ai_AI列表) do 
        if o_battle_ai_AI.支持游戏模式 == nil then 
            table.insert(_i_battle_ai_可用AI列表, o_battle_ai_AI.name)
        else
            for _, i_game_mode_支持游戏模式 in ipairs(o_battle_ai_AI.支持游戏模式) do
                if i_game_mode_当前游戏模式 == i_game_mode_支持游戏模式 then 
                    table.insert(_i_battle_ai_可用AI列表, o_battle_ai_AI.name)
                end
            end
        end
    end
    if #_i_battle_ai_可用AI列表 == 0 then 
        G.call('提示_添加提示', '没有找到可用AI')
        return nil
    end
    local int_随机数 = math.random(1, #_i_battle_ai_可用AI列表)
    return _i_battle_ai_可用AI列表[int_随机数]
end

t['战斗AI_AI空位补全AI'] = function()
    local i_game_mode_游戏模式 = G.call('对决_获取当前游戏模式')
    local o_game_mode_游戏模式 = G.QueryName(i_game_mode_游戏模式)
    if o_game_mode_游戏模式 == nil then 
        G.call('提示_添加提示', '游戏模式不存在 ' .. tostring(i_game_mode_游戏模式))
        return
    end
    local int_需求AI数量 = o_game_mode_游戏模式.AI数要求 or 0
    for i = 1, int_需求AI数量 do 
        G.call('战斗AI_添加AI玩家')
    end
end

--ret=string
t['战斗AI_生成AI名称'] = function(i_battle_ai_玩家)
    if i_battle_ai_玩家 == nil then
        return ''
    end
    local o_battle_ai_玩家 = G.QueryName(i_battle_ai_玩家)
    if o_battle_ai_玩家 == nil then 
        return ''
    end
    if o_battle_ai_玩家.AI名称库 ~= nil and #o_battle_ai_玩家.AI名称库 > 0 then 
        local _string_名称库 = o_battle_ai_玩家.AI名称库
        local int_随机数 = math.random(1, #_string_名称库)
        return _string_名称库[int_随机数]
    else
        return G.call('战斗AI_获取随机名称')
    end
    return ''
end

--ret=string
t['战斗AI_获取随机名称'] = function()
    -- TODO: 从名称库中随机
    return '酒馆老板'
end

t['战斗AI_对决初始化'] = function()
    local _o_room_player_AI玩家列表 = G.call('房间_获取玩家信息列表', false)
    for _, o_room_player_AI玩家 in ipairs(_o_room_player_AI玩家列表) do 
        G.call('战斗AI_启动AI逻辑监听', o_room_player_AI玩家)
        G.call('对决_初始化数据', o_room_player_AI玩家)
        G.call('对决_初始化协程', o_room_player_AI玩家)
    end
end

t['战斗AI_启动AI逻辑监听'] = function(o_room_player_AI玩家)
    local i_battle_ai_AI = o_room_player_AI玩家.AI
    local o_battle_ai_AI = G.QueryName(i_battle_ai_AI)
    if o_battle_ai_AI.AI逻辑 == nil then 
        return
    end
    local estr_absolute_id_type_AI绝对身份 = o_room_player_AI玩家.绝对身份
    for _, o_battle_ai_logic_逻辑 in ipairs(o_battle_ai_AI.AI逻辑) do
        local even_事件 = o_battle_ai_logic_逻辑.时机
        local funs_回调 = o_battle_ai_logic_逻辑.处理函数
        G.addListener(funs_回调, {even_事件, estr_absolute_id_type_AI绝对身份})
    end
end

--ret=i_deck
t['战斗AI_获取随机卡组'] = function(i_battle_ai_AI)
    local o_battle_ai_AI = G.QueryName(i_battle_ai_AI)
    if o_battle_ai_AI == nil or o_battle_ai_AI.AI卡组 == nil or #o_battle_ai_AI.AI卡组 == 0 then 
        G.call('提示_添加提示', 'AI没有可用卡组 ' .. tostring(i_battle_ai_AI))
        return nil
    end
    local int_随机数 = math.random(1, #o_battle_ai_AI.AI卡组)
    return o_battle_ai_AI.AI卡组[int_随机数]
end

--ret=boolean
t['战斗AI_是否是AI'] = function(estr_player_相对身份)
    local o_room_player_玩家 = G.call('房间_相对身份获取玩家信息', estr_player_相对身份)
    if o_room_player_玩家 ~= nil and o_room_player_玩家.AI ~= nil then 
        return true
    end
    return false
end
