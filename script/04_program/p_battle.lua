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
    G.call('对决_初始化战场')
end
