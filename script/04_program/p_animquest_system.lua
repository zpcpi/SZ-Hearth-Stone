--[[0

]]
local G = require "gf"
local t = G.api
local L = {}

local cur_actor = nil
local cur_quest = nil

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
                ['iter'] = iter,
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

            print('1', v, target)

            -- 生成最终结构
            return {
                ['iter'] = iter,
                ['nodelist'] = {
                    [1] = create_shaftnode(v, time, bezier, 2),
                    [2] = create_shaftnode(target, 0, nil, nil),
                },
            }
        end
    end

    return {}
end

--type=actor
--hide=true
--ret=_o_animquest_shaft
t['动画系统_平移'] = function(string_obj, int_dx, int_dy, o_animquest_bezier_曲线参数)
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

    cur_actor = o_animactor_演算体
    cur_quest = o_animquest_动画段模板
    result['shaft'] = G.call(o_animquest_动画段模板['iter'])

    return result
end

--hide=true
--ret=o_animquest
t['动画系统_创建quest_自定义'] = function(o_animactor_演算体, boolean_ismono, int_time, farg@actor_生成函数)
    local result = {}

    result['is_mono'] = boolean_ismono
    result['time'] = int_time

    cur_actor = o_animactor_演算体
    cur_quest = o_animquest_动画段模板
    result['shaft'] = G.call(farg@actor_生成函数)

    return result
end
