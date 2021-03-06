--[[4004

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
--type=farg
t['farg_block'] = function(_farg_actions)
    local result = nil
    for _,f in ipairs(_farg_actions) do
        result = G.call(f)
    end
    return result
end

--hide=true
--type=farg
t['farg_if'] = function(fargboolean_condition, _farg_ifactions, _farg_elseactions)
    if G.call(fargboolean_condition) then
        return G.call('farg_block', _farg_ifactions)
    else
        return G.call('farg_block', _farg_elseactions)
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

--hide=true
--type=farg
--ret=boolean
t['fargboolean_and'] = function(_fargboolean_conditions)
    for _,c in ipairs(_fargboolean_conditions) do
        if G.call(c) then
        else
            return false
        end
    end
    return true
end

--hide=true
--type=farg
--ret=boolean
t['fargboolean_compare'] = function(estr_comptype_比较符号, int_数值A, int_数值B)
    if estr_comptype_比较符号 == '==' then
        return int_数值A == int_数值B
    elseif estr_comptype_比较符号 == '~=' then
        return int_数值A ~= int_数值B
    elseif estr_comptype_比较符号 == '>=' then
        return int_数值A >= int_数值B
    elseif estr_comptype_比较符号 == '<=' then
        return int_数值A <= int_数值B
    elseif estr_comptype_比较符号 == '>' then
        return int_数值A > int_数值B
    elseif estr_comptype_比较符号 == '<' then
        return int_数值A < int_数值B
    end
    return false
end

--hide=true
--type=farg
--ret=boolean
t['fargboolean_or'] = function(_fargboolean_conditions)
    for _,c in ipairs(_fargboolean_conditions) do
        if G.call(c) then
            return true
        end
    end
    return false
end

--hide=true
--type=farg
--ret=boolean
t['fargboolean_not'] = function(fargboolean_condition)
    return not G.call(fargboolean_condition)
end

--hide=true
--type=farg
t['farg_run'] = function (farg)
    return G.call(farg)
end

--hide=true
--type=farg
t['farg_array_run'] = function (_farg)
    return G.call('array_map', _farg, G.call)
end
