--[[4019

]]
local G = require "gf"
local L = {}
local t = G.api

--type=excel_fix
t['o_card_卡牌信息选择导入'] = function(_o_card_卡牌列表)
    for k,v in ipairs(_o_card_卡牌列表) do
        local 类型 = (v['逻辑数据'] or {})['类型']
        if v.类型 == 0x10090005 then
            -- 法术卡
            v['原画缩放X'] = v['原画缩放X'] or 0.85
            v['原画缩放Y'] = v['原画缩放Y'] or 0.85
            v['原画偏移Y'] = v['原画偏移Y'] or -14
        elseif v.类型 == 0x10090004 then
            -- 随从卡
            v['原画缩放X'] = v['原画缩放X'] or 0.9
            v['原画缩放Y'] = v['原画缩放Y'] or 0.9
            v['原画偏移X'] = v['原画偏移X'] or 10
        elseif v.类型 == 0x10090006 then
            -- 武器卡
            v['原画缩放X'] = v['原画缩放X'] or 0.8
            v['原画缩放Y'] = v['原画缩放Y'] or 0.8
            v['原画偏移X'] = v['原画偏移X'] or 2
            v['原画偏移Y'] = v['原画偏移Y'] or -2
        elseif v.类型 == 0x10090003 then
            -- 武器卡
            v['原画缩放X'] = v['原画缩放X'] or 1.1
            v['原画缩放Y'] = v['原画缩放Y'] or 1.1
            v['原画偏移Y'] = v['原画偏移Y'] or -12
        elseif v.类型 == 0x10090001 then
            -- 英雄
            v['原画缩放X'] = v['原画缩放X'] or 1.1
            v['原画缩放Y'] = v['原画缩放Y'] or 1.1
            v['原画偏移Y'] = v['原画偏移Y'] or 14
        end
    end

    return _o_card_卡牌列表
end


