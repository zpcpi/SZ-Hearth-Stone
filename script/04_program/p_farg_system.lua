--[[4004

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
--type=farg
t['farg_block'] = function(_farg_actions)
    local result = nil
    for _,v in ipairs(_farg_actions) do
        result = G.call(v)
    end
    return result
end

--hide=true
--type=farg
t['farg_if'] = function(fargboolean_condition, _farg_ifaction, _farg_elseaction)
    if G.call(fargboolean_condition) then
        return G.call('farg_block', _farg_ifaction)
    else
        return G.call('farg_block', _farg_elseaction)
    end
end

--hide=true
--type=farg
t['farg_while'] = function(fargboolean_condition, _farg_actions)
    local result = nil
    while G.call(fargboolean_condition) do
        result = G.call('farg_block', _farg_actions)
    end
    return result
end




