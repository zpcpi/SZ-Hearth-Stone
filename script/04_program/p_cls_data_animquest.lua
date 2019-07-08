--[[4005

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
--ret=o_animquest
t['手牌复位动画生成'] = function(o_animquest_当前数据, _i_animquest_复位动画列表)
    local d = require "_data"

    local time = 300
    local maxCount = 10
    local Radius = 550
    local maxRotation = math.atan(Radius * 0.84, Radius)
    local minRotation = maxRotation / 4
    local bezier = {x1 = 0, y1 = 0.5, x2 = 0.5, y2 = 1}

    local function getPositions(count)
        local list = {}
        local minr = minRotation
        if (count - 1) * minr > maxRotation then
            minr = maxRotation / (count - 1)
        end

        local begr = -(count - 0.3) * 0.5 * minr
        if count == 1 then
            begr = 0
        end

        for k = 1, count, 1 do
            local r = begr + minr * (k - 1)
            list[k] = {
                [1] = Radius * math.sin(r), -- x
                [2] = Radius * (math.cos(r) - 1), -- y
                [3] = r * 180 / math.pi, -- rotation
            }
        end

        return list
    end

    for cur_count = 1, maxCount, 1 do
        local anim = d.query_inst(_i_animquest_复位动画列表[cur_count])
        if anim then
            anim['is_mono'] = false
            anim['time'] = time
            anim['iter'] = {}

            local list = getPositions(cur_count)
            for k = 1, cur_count, 1 do
                anim['iter'][k] = {
                    [1] = '动画系统_多属性设置',
                    [2] = '::HandCards.c_battle_handcards_self.handCards[' .. k .. ']',
                    [3] = {'x', 'y', 'rotation'},
                    [4] = list[k],
                    [5] = bezier,
                }
            end
        end
    end

    return o_animquest_当前数据
end





