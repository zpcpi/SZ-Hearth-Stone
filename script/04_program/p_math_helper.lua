--[[400e

]]
local G = require "gf"
local L = {}
local t = G.api

local Combination_Number_list = {}
--hide=true
--type=math
t['Combination_Number'] = function (n, m)
    if (m >= 0) and (n <= m) and (n >= 0) then
        local line_m = Combination_Number_list[m]

        if line_m then
        else
            line_m = {}
            line_m[0] = 1
            line_m[m] = 1
            Combination_Number_list[m] = line_m
        end

        if line_m[n] then
            return line_m[n]
        else
            local result = G.call('Combination_Number', n - 1, m - 1) + G.call('Combination_Number', n, m - 1)
            line_m[n] = result
            return result
        end
    else
        return 0
    end
end

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
