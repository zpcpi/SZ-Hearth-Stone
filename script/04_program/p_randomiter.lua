--[[4018

]]
local G = require "gf"
local L = {}
local t = G.api

t['获取随机库'] = function(i_randomiter_数据id)
    local o_randomiter_数据 = G.QueryName(i_randomiter_数据id)
    if o_randomiter_数据 then
        if o_randomiter_数据['是否初始化'] then
            return o_randomiter_数据['随机库']
        end
    else
        return
    end

    local data_mapping = {}
    if o_randomiter_数据['默认数据'] then
        for _,data in ipairs(o_randomiter_数据['默认数据']) do
            local key = data['卡牌']
            local weight = data['权重']
            data_mapping[key] = weight
        end
    end

    if o_randomiter_数据['生成函数'] then
        local new_data = G.call(o_randomiter_数据['生成函数']) or {}
        for _,data in ipairs(new_data) do
            local key = data['卡牌']
            local weight = data['权重']
            if data_mapping[key] then
            else
                data_mapping[key] = weight
            end
        end
    end

    local rlib = G.call('Create_Randomlib', G.QueryName(o_randomiter_数据['随机库类型']))
    for key,weight in pairs(data_mapping) do
        rlib:添加数据({key, weight})
    end
    rlib:初始化(false, true)


end






