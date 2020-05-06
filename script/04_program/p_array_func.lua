--[[4003

]]
local G = require "gf"
local L = {}
local t = G.api

--================================================
--================================================
-- table相关接口
--================================================
--================================================







--================================================
--================================================
-- 队列生成相关接口
--================================================
--================================================

--hide=true
--type=array
t['create_arithmetic_progression'] = function (start, step, count)
    local queue = {}
    local temp = start

    for i = 1, count, 1 do
        table.insert(queue, temp)
        temp = temp + step
    end
    return queue
end

--hide=true
--type=array
t['create_geometric_progression'] = function (start, multiplier, count)
    local queue = {}
    local temp = start

    for i = 1, count, 1 do
        table.insert(queue, temp)
        temp = temp * multiplier
    end
    return queue
end















--================================================
--================================================
-- 数组相关接口
--================================================
--================================================

--hide=true
--type=array
t['array_map'] = function (arr, iter)
    local new_arr = {}
    for _,v in ipairs(arr or {}) do
        table.insert(new_arr, iter(v))
    end
    return new_arr
end

--hide=true
--type=array
t['array_filter'] = function (arr, filter)
    local new_arr = {}
    for _,v in ipairs(arr or {}) do
        if filter(v) then
            table.insert(new_arr, v)
        end
    end
    return new_arr
end

--hide=true
--type=array
t['array_filtermap'] = function (arr, iter)
    local new_arr = {}
    for _,v in ipairs(arr) do
        local r = iter(v)
        if r ~= nil then
            table.insert(new_arr, r)
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

--hide=true
--type=array
t['array_get_element_index'] = function (arr, element)
    for i,v in ipairs(arr) do
        if v == element then
            return i
        end
    end
end

--hide=true
--type=array
t['array_union'] = function (arrA, arrB)
    for _,v in ipairs(arrB or {}) do
        table.insert(arrA, v)
    end
    return arrA
end

--hide=true
--type=array
t['array_inverted'] = function (arr)
    local result = {}
    for i = #arr, 1, -1 do
        table.insert(result, arr[i])
    end
    return result
end

--================================================
--================================================
-- 集合相关接口
--================================================
--================================================





--================================================
--================================================
-- 堆栈相关接口
--================================================
--================================================

--hide=true
--type=array
t['stack_push'] = function (stack, val)
    if stack then
        stack.n = (stack.n or 0) + 1
        stack[stack.n] = val
    end
end

--hide=true
--type=array
t['stack_pop'] = function (stack)
    if stack and stack.n and (stack.n > 0) then
        local result = stack[stack.n]
        stack.n = stack.n - 1
        return result
    end
end

--hide=true
--type=array
t['stack_top'] = function (stack)
    if stack and stack.n and (stack.n > 0) then
        return stack[stack.n]
    end
end

--hide=true
--type=array
t['create_stack'] = function ()
    local iter = {}
    local stack = {}
    stack.n = 0
    
    iter.stack = stack
    iter.push = function(val)
        G.call('stack_push', stack, val)
    end
    iter.pop = function()
        return G.call('stack_pop', stack)
    end
    iter.top = function()
        return G.call('stack_top', stack)
    end

    return iter
end

