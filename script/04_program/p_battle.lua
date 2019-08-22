--[[4009

]]
local G = require "gf"
local L = {}
local t = G.api

t['对决_初始化战场'] = function(estr_battle_type_对决类型)
    if estr_battle_type_对决类型 == '1v1' then 
        G.misc().对决类型 = estr_battle_type_对决类型
        G.addUI('v_battle_1v1')
    elseif estr_battle_type_对决类型 == '2v2' then 
    end
end

--ret=estr_battle_type
t['对决_获取对决类型'] = function()
    return G.misc().对决类型
end

t['对决_获取对决玩家信息列表'] = function()
    return G.misc().对决玩家信息列表
end

t['对决_增加对决玩家信息'] = function(o_battle_player_对决玩家, boolean_是主机)
    local o_misc = G.misc()
    if o_misc.对决玩家信息列表 == nil then 
        o_misc.对决玩家信息列表 = {}
    end
    table.insert(o_misc.对决玩家信息列表, o_battle_player_对决玩家)
    o_battle_player_对决玩家.是主机 = boolean_是主机
end

t['对决_清空对决玩家信息'] = function()
    local o_misc = G.misc()
    o_misc.对决玩家信息列表 = {}
end

t['对决_开始'] = function()
    if not G.call('对决_人数满足条件') then 
        G.call('系统_输出信息', '人数不足， 无法开始游戏！')
        return 
    end
    if not G.call('对决_所有玩家准备就绪') then 
        G.call('系统_输出信息', '有玩家没有准备就绪， 无法开始游戏！')
        return 
    end
    -- TODO: 根据游戏模式初始化数据
    if G.call('主机_是主机') then 
        G.call('网络通用_广播消息', '对决_开始')
    end
    G.call('对决_初始化战场')
end

t['对决_人数满足条件'] = function()
    local o_misc = G.misc()

    if type(o_misc.对决玩家信息列表) ~= 'table' then 
        return false
    end
    return #o_misc.对决玩家信息列表 >= 2
end

t['对决_所有玩家准备就绪'] = function()
    local o_misc = G.misc()

    if type(o_misc.对决玩家信息列表) ~= 'table' then 
        return false
    end
    for _, any_玩家信息 in ipairs(o_misc.对决玩家信息列表) do 
        if any_玩家信息.准备就绪 ~= true and any_玩家信息.是主机 ~= true then 
            return false
        end
    end
    return true
end

t['对决_更新玩家准备状态'] = function(any_玩家信息, boolean_需要广播)
    local o_misc = G.misc()
    if type(o_misc.对决玩家信息列表) ~= 'table' then 
        return 
    end

    if not any_玩家信息 then 
        return 
    end
    for _, any_本地玩家信息 in ipairs(o_misc.对决玩家信息列表) do 
        if any_本地玩家信息.玩家IP == any_玩家信息.玩家IP and any_本地玩家信息.玩家名称 == any_玩家信息.玩家名称 then 
            any_本地玩家信息.准备就绪 = not any_本地玩家信息.准备就绪
        end
    end
    if boolean_需要广播 then 
        G.call('网络通用_广播消息', '对决_更新玩家准备状态', any_玩家信息, false)
    end
end