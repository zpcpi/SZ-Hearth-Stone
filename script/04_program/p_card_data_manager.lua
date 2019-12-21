--[[401d

]]
local G = require "gf"
local L = {}
local t = G.api

local HERO_CARD_TYPE_ID = 0x10090001
local _i_card_英雄卡列表 = nil

--ret=_i_card
t['卡片数据_获取英雄卡ID列表'] = function(boolean_可收集)
    if _i_card_英雄卡列表 ~= nil then
        return _i_card_英雄卡列表
    end
    _i_card_英雄卡列表 = {}
    local _o_card_卡片列表 = G.DBTable('o_card')
    for _, o_card_卡片 in ipairs(_o_card_卡片列表) do 
        local o_card_logicinfo_逻辑数据 = o_card_卡片.逻辑数据
        if o_card_logicinfo_逻辑数据 ~= nil then 
            local i_cardtype_类型 = o_card_logicinfo_逻辑数据.类型
            if i_cardtype_类型 == HERO_CARD_TYPE_ID then 
                if boolean_可收集 ~= nil then 
                    local o_card_outerdata_局外数据 = o_card_卡片.局外数据
                    if o_card_outerdata_局外数据 and o_card_outerdata_局外数据.可收集 == boolean_可收集 then 
                        table.insert(_i_card_英雄卡列表, o_card_卡片.name)    
                    end
                else
                    table.insert(_i_card_英雄卡列表, o_card_卡片.name)
                end
            end
        end
    end
    return _i_card_英雄卡列表
end
