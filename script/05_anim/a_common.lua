--[[5001

]]

local G = require "gf"
local t = G.act

--type=private
t['动画通用_播放动画序列'] = function(o_dialogue_system_actionlist_序列,o_node_主体)
    local o_dialogue_system_tap_动画
    local farg_动画函数
    if not(o_dialogue_system_actionlist_序列 and o_node_主体 and type(o_dialogue_system_actionlist_序列.动画) == 'table' and #o_dialogue_system_actionlist_序列.动画 > 0) then
        return
    end
    for i = 1, #o_dialogue_system_actionlist_序列.动画 do
        o_dialogue_system_tap_动画 = o_dialogue_system_actionlist_序列.动画[i]
        if o_dialogue_system_tap_动画.动画 then
            farg_动画函数 = {}
            G.deepcopy(o_dialogue_system_tap_动画.动画, farg_动画函数, {})
            -- 将 o_node_主体作为第一个参数传递
            table.insert(farg_动画函数, 2, o_node_主体)
            -- 延迟作为最后一个参数传递
            farg_动画函数[farg_动画函数.n + 3] = o_dialogue_system_tap_动画.延迟时间
            farg_动画函数.n = farg_动画函数.n + 2
            if o_dialogue_system_tap_动画.并行播放 then
                G.RunAction(farg_动画函数)
            else
                G.CallAction(farg_动画函数)
            end
        end
    end
end

t['提示动画_显示提示'] = function(o_node_提示)
    local int_渐显时间 = 100
    local int_显示时间 = 1000
    local int_渐隐时间 = 100

    o_node_提示.alpha = 0
    G.Tween("alpha", int_渐显时间, o_node_提示, 255)
    G.wait_time(int_渐显时间 + int_显示时间)
    G.Tween("alpha", int_渐隐时间, o_node_提示, 0)
    G.wait_time(int_渐隐时间)
    G.trig_event('TipEnd')
end