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

local function create_shaft_delta(t_obj, attr, dv, time, bezier)
    if t_obj then
        local obj, com = t_obj.obj, t_obj.com
        local v, target = nil, nil
        if obj then
            if type(com) == 'string' then
                v = obj[com][attr]
                target = v + dv
            else
                v = obj[attr]
                target = v + dv
            end

            -- 生成过渡函数
            local iter = function (nodeA, nodeB)
                if com then
                    obj[com][attr] = nodeA['target']
                    G.TweenCom(attr, nodeA['time'], obj[com], nodeB['target'])
                else
                    obj[attr] = nodeA['target']
                    G.TweenBezier(attr, nodeA['time'], obj, nodeB['target'], unpack_bezier(nodeA['bezier']))
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
    end

    return {}
end

local function create_shaft(t_obj, attr, target, time, bezier)
    if t_obj then
        local obj, com = t_obj.obj, t_obj.com
        local v = nil
        if obj then
            if type(com) == 'string' then
                v = obj[com][attr]
            else
                v = obj[attr]
            end

            -- 生成过渡函数
            local iter = function (nodeA, nodeB)
                if com then
                    G.TweenCom(attr, nodeA['time'], obj[com], nodeB['target'])
                else
                    G.TweenBezier(attr, nodeA['time'], obj, nodeB['target'], unpack_bezier(nodeA['bezier']))
                end
            end

            -- 生成最终结构
            return {
                ['funs'] = iter,
                ['nodelist'] = {
                    [1] = create_shaftnode(v, time, bezier, 2),
                    [2] = create_shaftnode(target, 0, nil, nil),
                },
            }
        end
    end

    return {}
end

local function get_animactor_obj(o_animactor, string_obj)
    local result = {}
    local set_obj = function(name)
        local t_obj = nil
        -- 先判断引用格式
        string.gsub(name, '^::([%w]+)$', function(w)
            t_obj = o_animactor:get_quote(w)
        end, 1)

        if t_obj then
            -- 引用已经找到了，因为是引用，所有只有一个控件
            result[1] = t_obj
            return
        end

        -- 再判断别名格式
        string.gsub(name, '^_([^%[]+)%[([%d]+)%]$', function(w,i)
            if i then
                -- 约定[]内只有数字索引
                result[1] = (o_animactor:get_alias(w) or {})[tonumber(i)]
            else
                -- 没有索引，那么别名中所有的控件都获取
                result = o_animactor:get_alias(w)
            end
        end)
    end
    local set_attr_obj = function(attr)
        local attr_table = {}
        local attr_split = function()
            string.gsub(dot, '([^%[]+)%[?', function (w)
                table.insert(attr_table, w)
            end, 1)
            string.gsub(dot, '%[([%d]+)%]', function (w)
                table.insert(attr_table, tonumber(w))
            end)
        end
        local iter = function(t_obj)
            local obj, com = t_obj['obj'], t_obj['com']
            for _,attr in ipairs(attr_table) do
                if type(attr) == 'string' then

                elseif type(attr) == 'number' then
                    if com and obj[com] then
                        
                    end
                end

            end
        end
        attr_split()
        G.show_table(attr_table)
        G.call('array_filtermap', result, iter)
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
            return
        end
    end
end

--hide=true
t['动画系统_获取名称指代'] = function(string_obj)
    local obj_list = get_animactor_obj(G.misc().当前演算体, string_obj)


end





--type=actor
--hide=true
--ret=_o_animquest_shaft
t['动画系统_平移'] = function(string_obj, int_dx, int_dy, o_animquest_bezier_曲线参数)
    local cur_actor = G.misc().当前演算体
    local cur_quest = G.misc().当前动画段
    local t_obj = cur_actor:get_quote(string_obj)
    local time = cur_quest['time']

    return {
        [1] = create_shaft_delta(t_obj, 'x', int_dx, time, o_animquest_bezier_曲线参数),
        [2] = create_shaft_delta(t_obj, 'y', int_dy, time, o_animquest_bezier_曲线参数),
    }
end

--type=actor
--hide=true
--ret=_o_animquest_shaft
t['动画系统_缩放'] = function(string_obj, number_scale, o_animquest_bezier_曲线参数)
    local cur_actor = G.misc().当前演算体
    local cur_quest = G.misc().当前动画段
    local t_obj = cur_actor:get_quote(string_obj)
    local time = cur_quest['time']

    return {
        [1] = create_shaft(t_obj, 'scaleX', number_scale, time, o_animquest_bezier_曲线参数),
        [2] = create_shaft(t_obj, 'scaleY', number_scale, time, o_animquest_bezier_曲线参数),
    }
end

--type=actor
--hide=true
--ret=_o_animquest_shaft
t['动画系统_更改费用'] = function(string_obj, int_cost, o_animquest_bezier_曲线参数)
    local cur_actor = G.misc().当前演算体
    local cur_quest = G.misc().当前动画段
    local t_obj = cur_actor:get_quote(string_obj)
    local time = cur_quest['time']

    t_obj = {
        ['obj'] = t_obj['obj'].getChildByName('卡牌框'),
        ['com'] = 'c_card_weapon',
    }
    return {
        [1] = create_shaft(t_obj, 'cost', int_cost, time, o_animquest_bezier_曲线参数),
    }
end

--hide=true
--ret=o_animquest
t['动画系统_创建quest'] = function(o_animactor_演算体, o_animquest_动画段模板)
    local result = {}
    result['is_mono'] = o_animquest_动画段模板['is_mono']
    result['time'] = o_animquest_动画段模板['time']
    result['iter'] = o_animquest_动画段模板['iter']
    return result
end

--hide=true
--ret=o_animquest
t['动画系统_创建quest_自定义'] = function(o_animactor_演算体, boolean_ismono, int_time, farg_生成函数)
    local result = {}
    result['is_mono'] = boolean_ismono
    result['time'] = int_time
    result['iter'] = farg_生成函数
    return result
end
