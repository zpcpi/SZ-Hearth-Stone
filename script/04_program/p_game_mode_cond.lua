--[[401b

]]
local G = require "gf"
local L = {}
local t = G.api

--ret=boolean
t['模式条件_1v1开始条件'] = function()
    local o_misc = G.misc()

    local o_deck_卡组 = G.call('对决_获取当前玩家对决卡组')
    if not G.call('收藏_卡组是否有效', o_deck_卡组) then 
        G.show_table(o_deck_卡组)
        G.call('系统_输出信息', '需要选择一副有效卡组')
        return false
    end
    return true
end

--ret=boolean
t['模式条件_2v2开始条件'] = function()
    local o_misc = G.misc()

    local o_deck_卡组 = G.call('对决_获取当前玩家对决卡组')
    if not G.call('收藏_卡组是否有效', o_deck_卡组) then 
        G.call('系统_输出信息', '需要选择一副有效卡组')
        return false
    end
    return true
end

--ret=boolean
t['模式条件_挑战酒馆老板开始条件'] = function()
    local o_misc = G.misc()

    local o_deck_卡组 = G.call('对决_获取当前玩家对决卡组')
    if not G.call('收藏_卡组是否有效', o_deck_卡组) then 
        G.call('系统_输出信息', '需要选择一副有效卡组')
        return false
    end
    return true
end
