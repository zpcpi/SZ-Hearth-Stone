--[[4018

]]
local G = require "gf"
local L = {}
local t = G.api

t['卡牌随机库_生成'] = function(i_randomiter_数据id)
    local o_randomiter_数据 = G.QueryName(i_randomiter_数据id)
    local data_mapping = {}
    if o_randomiter_数据['默认数据'] then
        for _,data in ipairs(o_randomiter_数据['默认数据']) do
            local key = data['卡牌']
            local weight = data['权重']
            local condi = data['条件']
            data_mapping[key] = {weight, condi}
        end
    end

    if o_randomiter_数据['生成函数'] then
        local new_data = G.call(o_randomiter_数据['生成函数']) or {}
        for _,data in ipairs(new_data) do
            local key = data['卡牌']
            local weight = data['权重']
            local condi = data['条件']
            if data_mapping[key] then
            else
                data_mapping[key] = {weight, condi}
            end
        end
    end

    local rlib = G.call('Create_Randomlib', G.QueryName(o_randomiter_数据['随机库类型']))
    for key,info in pairs(data_mapping) do
        rlib:添加数据({key, info[1], info[2]})
    end
    rlib:初始化(true, true)

    o_randomiter_数据['是否初始化'] = true
    o_randomiter_数据['随机库'] = rlib

    return rlib
end

t['卡牌随机库_获取'] = function(i_randomiter_数据id)
    local o_randomiter_数据 = G.QueryName(i_randomiter_数据id)
    if o_randomiter_数据 then
        if o_randomiter_数据['是否初始化'] then
            return o_randomiter_数据['随机库']
        else
            return G.call('卡牌随机库_生成', i_randomiter_数据id)
        end
    end
end

t['卡牌随机库_获取ID'] = function(i_randomiter_数据id, boolean_是否重置)
    local rlib
    if boolean_是否重置 then
        rlib = G.call('卡牌随机库_生成', i_randomiter_数据id)
    else
        rlib = G.call('卡牌随机库_获取', i_randomiter_数据id)
    end

    return rlib(1)[1]
end
