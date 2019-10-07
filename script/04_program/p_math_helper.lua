--[[400e

]]
local G = require "gf"
local L = {}
local t = G.api

-- 组合数值计算
local Combination_Number_list = {}
--hide=true
--type=math
t['Combination_Number'] = function (count, max)
    if (max >= 0) and (count <= max) and (count >= 0) then
        local line_m = Combination_Number_list[max]

        if line_m then
        else
            line_m = {}
            line_m[0] = 1
            line_m[max] = 1
            Combination_Number_list[max] = line_m
        end

        if line_m[count] then
            return line_m[count]
        else
            local result = G.call('Combination_Number', count - 1, max - 1) + G.call('Combination_Number', count, max - 1)
            line_m[count] = result
            return result
        end
    else
        return 0
    end
end

-- 贝赛尔曲线相关
t['Bezier_curve'] = function (posxs, posys, dots)
    local pointxs, pointys = {}, {}

    if posxs and posys and dots and (#posxs > 1) and (#posxs == #posys) then
        local point_count = #posxs
        local arga = G.call('array_map', 
                            G.call('create_arithmetic_progression', 0, 1, point_count),
                            function(n)
                                return G.call('Combination_Number', n, point_count - 1)
                            end)
        local argt = G.call('array_map',
                            dots,
                            function(n)
                                return G.call('create_geometric_progression', 1, n, point_count)
                            end)
        local argtplus = G.call('array_map',
                            dots,
                            function(n)
                                return G.call('create_geometric_progression', 1, 1 - n, point_count)
                            end)

        for i = 1, #dots, 1 do
            local t_queue = argt[i]
            local plust_queue = argtplus[i]

            local x, y = 0, 0
            for k = 1, point_count, 1 do
                local temp = arga[k] * t_queue[k] * plust_queue[point_count - k + 1]
                x = x + posxs[k] * temp
                y = y + posys[k] * temp
            end
            table.insert(pointxs, x)
            table.insert(pointys, y)
        end

        return pointxs, pointys
    end
end

t['Bezier_curve_bycount'] = function (posxs, posys, count, dotpro)
    if posxs and posys and (#posxs > 1) and (#posxs == #posys) and (count > 1) and (dotpro <= 1) and (dotpro >= 0) then
        local k = 1 / (count - 1)
        local dots = G.call('create_arithmetic_progression', dotpro * k, k, count - dotpro)
        return G.call('Bezier_curve', posxs, posys, dots)
    end
end

-- 随机库功能
t['Create_Randomlib'] = function (estr_randomlib_type_随机库类型)
    local rlib = {}

    -- 数据
    rlib.datas = {}
    -- {value, weight, cur_weight, condition}
    
    -- 属性
    rlib.boolean_是否已初始化 = false
    rlib.int_概率基底 = 1
    rlib.boolean_是否循环 = false
    rlib.max_count = 0

    -- 添加数据 {数值, 权重, 条件} 编号
    -- 修改数据 类型 编号
    -- 删除数据 编号
    -- 设置概率基底 数值
    -- 设置循环 数值

    -- 查看数据 类型
    
    -- 初始化 (是否计算条件, 是否重置权重)

    -- 求值 次数


    rlib['添加数据'] = function (data, index)
        table.insert(rlib.datas, data, index)

        rlib.boolean_是否已初始化 = false
    end

    rlib['修改数据'] = function (data_type, index, value)
        local data = rlib.datas[index]
        if data and (type(data) == 'table') then
            data[data_type] = value

            rlib.boolean_是否已初始化 = false
        end
    end

    rlib['删除数据'] = function (index)
        table.remove(rlib.datas, index)

        rlib.boolean_是否已初始化 = false
    end

    rlib['设置概率基底'] = function (base)
        if base > 0 then
            rlib.int_概率基底 = base
        end
    end

    rlib['设置循环'] = function (loop)
        rlib.boolean_是否循环 = loop
    end

    rlib['查看数据库数据'] = function (data_type)

    end

    -- 求值用元表

end






