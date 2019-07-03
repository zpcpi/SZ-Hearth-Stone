--[[4003

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
--type=array
t['array_map'] = function (arr, iter)
    local new_arr = {}
    for _,v in ipairs(arr) do
        table.insert(new_arr, iter(v))
    end
    return new_arr
end

--hide=true
--type=array
t['array_filter'] = function (arr, filter)
    local new_arr = {}
    for _,v in ipairs(arr) do
        if filter(v) then
            table.insert(new_arr, v)
        end
    end
    return new_arr
end

--hide=true
--type=array
t['array_find'] = function (arr, attr, val)
    local filter = function(t)
        return t[attr] == val
    end
    return G.call('array_filter', arr, filter)
end

--hide=true
--type=array
t['array_find_enum'] = function (arr, attr, _val)
    if #_val == 0 then
        return G.call('array_find', arr, attr, nil)
    end

    local map = {}
    local filter = function(t)
        local val = t[attr]
        return (val ~= nil) and (map[val] == true)
    end

    for _,v in ipairs(_val) do
        map[v] = true
    end
    return G.call('array_filter', arr, filter)
end

--hide=true
--type=array
t['array_find_range'] = function (arr, attr, val_min, val_max, iter_gt)
    local filter = function(t)
        local val = t[attr]
        return not (iter_gt(val_min, val) or iter_gt(val, val_max))
    end

    if not iter_gt(val_min, val_max) then
        return G.call('array_filter', arr, filter)
    else
        return {}
    end
end

--hide=true
--type=array
t['array_find_index'] = function (arr, attr, val)
    local result = {}
    local index = 0
    local filter = function(t)
        index = index + 1
        if t[attr] == val then
            table.insert(result, index)
            return true
        end
    end
    G.call('array_filter', arr, filter)
    return result
end
