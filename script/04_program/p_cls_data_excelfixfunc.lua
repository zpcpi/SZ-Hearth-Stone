--[[4019

]]
local G = require "gf"
local L = {}
local t = G.api

--type=excel_fix
t['o_card_卡牌信息选择导入'] = function(_o_card_卡牌列表)
    for k,v in ipairs(_o_card_卡牌列表) do
        if v.类型 == 0x10090005 then
            -- 法术卡
            v['原画缩放'] = v['原画缩放'] or 0.9
            v['原画偏移Y'] = v['原画偏移Y'] or -14
        elseif v.类型 == 0x10090004 then
            -- 随从卡
            v['原画偏移Y'] = v['原画偏移Y'] or -6
        end
    end

    return _o_card_卡牌列表
end


