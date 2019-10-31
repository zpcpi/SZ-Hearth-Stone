--[[4011

]]
local G = require "gf"
local L = {}
local t = G.api

t['com_set_value'] = function (com, attr, value)
    com[attr] = value
end

t['zpc_test'] = function ()
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local minion = script_战场.selfBattleminion.c_battleminion_self

    minion:addMinion(G.QueryName(0x10060061))

end