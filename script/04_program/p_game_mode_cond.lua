--[[401b

]]
local G = require "gf"
local L = {}
local t = G.api

--ret=boolean
t['模式条件_1v1开始条件'] = function()
    local o_misc = G.misc()

    if type(o_misc.房间玩家列表) ~= 'table' then 
        G.call('系统_输出信息', '人数不足， 无法开始游戏！')
        return false
    end
    local o_deck_卡组 = G.call('对决_获取对决卡组')
    if not G.call('收藏_卡组是否有效', o_deck_卡组) then 
        G.call('系统_输出信息', '需要选择一副有效卡组')
        return false
    end
    return #o_misc.房间玩家列表 == 2
end

--ret=boolean
t['模式条件_2v2开始条件'] = function()
    local o_misc = G.misc()

    if type(o_misc.房间玩家列表) ~= 'table' then 
        G.call('系统_输出信息', '人数不足， 无法开始游戏！')
        return false
    end
    local o_deck_卡组 = G.call('对决_获取对决卡组')
    if not G.call('收藏_卡组是否有效', o_deck_卡组) then 
        G.call('系统_输出信息', '需要选择一副有效卡组')
        return false
    end
    return #o_misc.房间玩家列表 == 4
end

--ret=boolean
t['模式条件_挑战酒馆老板开始条件'] = function()
    local o_misc = G.misc()

    if type(o_misc.房间玩家列表) ~= 'table' then 
        G.call('系统_输出信息', '人数不足， 无法开始游戏！')
        return false
    end
    local o_deck_卡组 = G.call('对决_获取对决卡组')
    if not G.call('收藏_卡组是否有效', o_deck_卡组) then 
        G.call('系统_输出信息', '需要选择一副有效卡组')
        return false
    end
    return #o_misc.房间玩家列表 == 1
end