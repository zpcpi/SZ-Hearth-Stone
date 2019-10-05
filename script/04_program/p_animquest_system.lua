--[[0

]]
local G = require "gf"
local t = G.api
local L = {}

local function unpack_bezier(bezier)
    if bezier then
        return bezier.x1, bezier.y1, bezier.x2, bezier.y2
    else
        return 0, 0, 1, 1
    end
end

local function create_shaftnode(target, time, bezier, next_index)
    return {
        ['target'] = target,
        ['time'] = time,
        ['bezier'] = bezier,
        ['next_index'] = next_index,
    }
end

local function create_shaft(obj, attr, target, time, bezier)
    if obj and (type(obj) == 'userdata' or type(obj) == 'table') then
        local v = obj[attr]

        -- 生成过渡函数
        local iter = function (nodeA, nodeB)
            if type(obj) == 'userdata' then
                -- 约定是控件
                obj[attr] = nodeA['target']
                G.TweenBezier(attr, nodeA['time'], obj, nodeB['target'], unpack_bezier(nodeA['bezier']))
            elseif type(obj) == 'table' then
                obj[attr] = nodeA['target']
                G.TweenCom(attr, nodeA['time'], obj, nodeB['target'])
            end
        end

        -- 生成最终结构
        return {
            ['funs'] = iter,
            ['nodelist'] = {
                [1] = create_shaftnode(v, time, bezier, 2),
                [2] = create_shaftnode(target, 0, nil, nil),
            }
        }
    end

    return {}
end

local function create_shaft_delta(obj, attr, dv, time, bezier)
    if obj and (type(obj) == 'userdata' or type(obj) == 'table') then
        local v = obj[attr]
        local target = v + dv

        return create_shaft(obj, attr, target, time, bezier)
    end

    return {}
end

local function get_animactor_obj(o_animactor, string_obj)
    local result = {}
    local set_obj = function(name)
        local obj = nil
        -- 先判断引用格式
        string.gsub(name, '^::([%w_]+)$', function(w)
            obj = o_animactor:get_quote('::' .. w)
        end, 1)

        if obj then
            -- 引用已经找到了，因为是引用，所有只有一个控件
            result[1] = obj
            return
        end

        -- 再判断别名格式
        string.gsub(name, '^_([^%[]+)%[([%d]+)%]$', function(w,i)
            if i then
                -- 约定[]内只有数字索引
                result[1] = (o_animactor:get_alias('_' .. w) or {})[tonumber(i)]
            else
                -- 没有索引，那么别名中所有的控件都获取
                -- 需要复制一份table
                for _,v in ipairs(o_animactor:get_alias(w)) do
                    table.insert(result, v)
                end
            end
        end)
    end
    local set_attr_obj = function(attr)
        local attr_table = {}
        local attr_split = function()
            string.gsub(attr, '([^%[]+)%[?', function (w)
                table.insert(attr_table, w)
            end, 1)
            string.gsub(attr, '%[([%d]+)%]', function (w)
                table.insert(attr_table, tonumber(w))
            end)
        end
        local iter = function(obj)
            for _,attr in ipairs(attr_table) do
                local new = nil
                if type(attr) == 'string' then
                    if type(obj.getChildByName) == 'function' then
                        new = obj.getChildByName(attr)
                    end
                    if new then
                    else
                        new = obj[attr]
                    end
                elseif type(attr) == 'number' then
                    new = obj[tonumber(attr)]
                end

                if new then
                    obj = new
                else
                    return
                end
            end
            return obj
        end
        attr_split()
        result = G.call('array_filtermap', result, iter)
    end

    for index,dot in ipairs(G.call('string_split', string_obj, '.')) do
        if index == 1 then
            -- 这里约定获得的是指定或者别名
            set_obj(dot)
        else
            -- 这里约定获得的是子控件，或组件，或属性
            set_attr_obj(dot)
        end

        -- 判断下获取情况，一旦为空就终止
        if result and #result > 0 then
        else
            return {}
        end
    end
    return result
end

--hide=true
t['动画系统_获取名称指代'] = function(string_obj)
    return get_animactor_obj(G.misc().当前演算体, string_obj)
end

local function create_shaftlist(string_obj, _string_attr, _number_val, o_animquest_bezier_曲线参数, iter)
    local cur_actor = G.misc().当前演算体
    local cur_quest = G.misc().当前动画段
    local obj_list = G.call('动画系统_获取名称指代', string_obj)
    local time = cur_quest['time']

    local shaft_list = {}
    for _,obj in ipairs(obj_list) do
        for i = 1, #_string_attr, 1 do
            table.insert(shaft_list, iter(obj, _string_attr[i], _number_val[i], time, o_animquest_bezier_曲线参数))
        end
    end
    return shaft_list
end

local function create_shaftlist_positions_byglobal(string_obj, _string_attr, _number_val, o_animquest_bezier_曲线参数, iter)
    local cur_actor = G.misc().当前演算体
    local cur_quest = G.misc().当前动画段
    local obj_list = G.call('动画系统_获取名称指代', string_obj)
    local time = cur_quest['time']

    local shaft_list = {}
    -- 有效性检查
    if _string_attr and _number_val and (#_string_attr == #_number_val) and (#_string_attr % 2 == 0) then
        for _,obj in ipairs(obj_list) do
            for i = 1, #_string_attr, 2 do
                local posx, posy
                if obj.parent then
                    posx, posy = obj.parent.globalToLocal(_number_val[i], _number_val[i+1])
                elseif obj.obj and obj.obj.parent then
                    posx, posy = obj.obj.parent.globalToLocal(_number_val[i], _number_val[i+1])
                end
                table.insert(shaft_list, iter(obj, _string_attr[i], posx, time, o_animquest_bezier_曲线参数))
                table.insert(shaft_list, iter(obj, _string_attr[i+1], posy, time, o_animquest_bezier_曲线参数))
            end
        end
    end
    return shaft_list
end

--type=actor
--hide=true
--ret=_o_animquest_shaft
t['动画系统_属性设置'] = function(string_obj, string_attr, number_目标值, o_animquest_bezier_曲线参数)
    return create_shaftlist(string_obj, {string_attr}, {number_目标值}, o_animquest_bezier_曲线参数, create_shaft)
end

--type=actor
--hide=true
--ret=_o_animquest_shaft
t['动画系统_多属性设置'] = function(string_obj, _string_attr, _number_目标值, o_animquest_bezier_曲线参数)
    return create_shaftlist(string_obj, _string_attr, _number_目标值, o_animquest_bezier_曲线参数, create_shaft)
end

t['动画系统_设置全局位置'] = function(string_obj, _string_attr, _number_目标值, o_animquest_bezier_曲线参数)
    return create_shaftlist_positions_byglobal(string_obj, _string_attr, _number_目标值, o_animquest_bezier_曲线参数, create_shaft)
end

--type=actor
--hide=true
--ret=_o_animquest_shaft
t['动画系统_跟随鼠标'] = function(string_obj, _string_attr, o_animquest_bezier_曲线参数)
    if _string_attr and (#_string_attr == 2) then
        return create_shaftlist_positions_byglobal(string_obj, _string_attr, {G.MousePos()}, o_animquest_bezier_曲线参数, create_shaft)
    end
    return {}
end

--type=actor
--hide=true
--ret=_o_animquest_shaft
t['动画系统_连线两端跟随'] = function(string_obj, _string_attr, string_startobj, o_animquest_bezier_曲线参数)
    if _string_attr and (#_string_attr == 6) then
        local startobj_list = G.call('动画系统_获取名称指代', string_startobj)
        if startobj_list and (#startobj_list == 1) then
            local startx, starty
            local midx, midy
            local endx, endy = G.MousePos()
            local obj = startobj_list[1]
            if obj.parent then
                startx, starty = obj.localToGlobal(0, 0)
            elseif obj.obj and obj.obj.parent then
                startx, starty = obj.obj.localToGlobal(0, 0)
            end

            if startx and starty and endx and endy then
                midx = (endx - startx) * 0.1 + startx
                midy = (endy - starty) * 0.8 + starty
                return create_shaftlist_positions_byglobal(string_obj, _string_attr, {startx, starty, midx, midy, endx, endy}, o_animquest_bezier_曲线参数, create_shaft)
            end
        end
    end
    return {}
end


--type=actor
--hide=true
--ret=_o_animquest_shaft
t['动画系统_属性累加'] = function(string_obj, string_attr, number_累加值, o_animquest_bezier_曲线参数)
    return create_shaftlist(string_obj, {string_attr}, {number_累加值}, o_animquest_bezier_曲线参数, create_shaft_delta)
end

t['动画系统_汇总动画轴'] = function(_farg_动画轴生成函数)
    local result = {}
    for _,farg in ipairs(_farg_动画轴生成函数) do
        G.call('array_union', result, G.call(farg))
    end
    return result
end

--hide=true
--ret=o_animquest
t['动画系统_创建quest'] = function(o_animactor_演算体, o_animquest_动画段模板)
    local result = {}
    
    G.deepCopyInst(o_animquest_动画段模板, result)
    return result
end

--hide=true
--ret=o_animquest
t['动画系统_创建quest_自定义'] = function(o_animactor_演算体, boolean_ismono, int_time, _farg_生成函数, _o_animquest_子动画)
    local result = {}
    result['is_mono'] = boolean_ismono
    result['time'] = int_time
    result['iter'] = _farg_生成函数
    result['child_quests'] = _o_animquest_子动画
    return result
end
