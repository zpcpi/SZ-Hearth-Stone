--[[4005

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
--ret=o_animquest
t['手牌复位动画生成'] = function(o_animquest_当前数据, _i_animquest_复位动画列表, boolean_是否下方)
    local d = require "_data"
    local scale = 0.8

    local time = 300                                            -- 复位时间
    local maxCount = 10                                         -- 最大手牌数
    local Radius = 550 * scale * 0.9                            -- 排列圆半径
    local maxRotation = math.atan(550 * scale, Radius)          -- 最大分布弧度
    local minRotation = maxRotation / 4                         -- 手牌最小夹角
    local bezier = {x1 = 0, y1 = 0.5, x2 = 0.5, y2 = 1}         -- 曲线参数

    local function getPositions(count)
        local list = {}
        local minr = minRotation
        if (count - 1) * minr > maxRotation then
            minr = maxRotation / (count - 1)
        end

        local begr = -(count - 0.25) * 0.5 * minr
        if count == 1 then
            begr = 0
        end

        if boolean_是否下方 == true then
            for k = 1, count, 1 do
                local r = begr + minr * (k - 1)
                list[k] = {
                    [1] = Radius * math.sin(r),                      -- 卡牌位置X
                    [2] = Radius * (math.cos(r) - 1) + 10,           -- 卡牌位置Y
                    [3] = r * 180 / math.pi,                         -- 卡牌角度
                    [4] = 0.35 * scale,                              -- 卡牌缩放X
                    [5] = 0.35 * scale,                              -- 卡牌缩放Y
                }
            end
        else
            for k = 1, count, 1 do
                local r = begr + minr * (k - 1)
                list[k] = {
                    [1] = Radius * math.sin(r),                      -- 卡牌位置X
                    [2] = -(Radius * (math.cos(r) - 1) + 10),        -- 卡牌位置Y
                    [3] = -(r * 180 / math.pi) - 180,                -- 卡牌角度
                    [4] = 0.35 * scale,                              -- 卡牌缩放X
                    [5] = 0.35 * scale,                              -- 卡牌缩放Y
                }
            end
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
            local script_quote
            if boolean_是否下方 == true then
                script_quote = '::HandCards_Self'
            else
                script_quote = '::HandCards_Enemy'
            end
            for k = 1, cur_count, 1 do
                anim['iter'][k] = {
                    [1] = '动画系统_多属性设置',
                    [2] = script_quote .. '.handCards[' .. k .. ']',
                    [3] = {'x', 'y', 'rotation', 'scaleX', 'scaleY'},
                    [4] = list[k],
                    [5] = bezier,
                }
            end
        end
    end

    return o_animquest_当前数据
end


t['asdasd'] = function()
    local o_misc = G.misc()
    local script_动画系统 = o_misc.主动画系统

    script_动画系统:add_animquest(
        G.call('动画系统_创建quest', script_动画系统, G.QueryName(0x10010019))
    )

end