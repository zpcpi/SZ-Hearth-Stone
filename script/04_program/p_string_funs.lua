--[[4002

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
--ret=_string
t['string_split'] = function(string_str, string_reps)
    local _string_list = {}
    string.gsub(string_str, '([^' .. string_reps .. ']*)',function (w)
        table.insert(_string_list, w)
    end)
    return _string_list
end



