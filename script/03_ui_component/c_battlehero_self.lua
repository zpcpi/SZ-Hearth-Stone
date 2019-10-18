--[[300c

]]

local G = require "gf"
local t = G.com()
function t:init()
    self.功能区 = self.obj.getChildByName('功能区')

    self.英雄 = self.功能区.getChildByName('英雄')
    self.英雄技能 = self.功能区.getChildByName('英雄技能')
    self.武器 = self.功能区.getChildByName('武器')

    self.cur_card_list = {}

    self.can_pick = true
end

function t:setData(o_card_卡片数据)
    if not o_card_卡片数据 then 
        return 
    end
    local i_cardtype_卡片类型 = o_card_卡片数据.类型
    if not i_cardtype_卡片类型 then 
        return 
    end

    local query_iter
    if G.is_editor then 
        local d = require '_data'
        query_iter = d.query_inst
    else
        query_iter = G.QueryName
    end
    local o_cardtype_卡片类型 = query_iter(i_cardtype_卡片类型)
    local string_卡片类型名称 = o_cardtype_卡片类型['showname']

    local o_node_界面
    if string_卡片类型名称 == '英雄' then
        o_node_界面 = self.英雄
        self.cur_card_list['英雄'] = o_card_卡片数据
    elseif string_卡片类型名称 == '英雄技能' then
        o_node_界面 = self.英雄技能
        self.cur_card_list['英雄技能'] = o_card_卡片数据
    elseif string_卡片类型名称 == '武器卡' then
        o_node_界面 = self.武器
        self.cur_card_list['武器'] = o_card_卡片数据
    end
    local script_界面组件 = 'c_' .. string.sub(o_cardtype_卡片类型.战斗界面控件, 3)
    
    if o_node_界面 then
        local o_node_卡牌框 = o_node_界面.getChildByName('卡牌框')
        if o_node_卡牌框 and o_node_卡牌框[script_界面组件] and o_node_卡牌框[script_界面组件].setData then
            o_node_卡牌框[script_界面组件]:setData(o_card_卡片数据)
            o_node_界面.visible = true
        end
    end
end

function t:getData()
    return self.cur_card_list['英雄'], self.cur_card_list['英雄技能'], self.cur_card_list['武器']
end

function t:delData(boolean_英雄, boolean_英雄技能, boolean_武器)
    local o_node_界面
    local script_界面组件

    local iter = function ()
        if o_node_界面 and o_node_界面[script_界面组件] and o_node_界面[script_界面组件].setData then
            o_node_界面[script_界面组件]:setData(nil)
            o_node_界面.visible = true
        end
    end

    if boolean_英雄 then
        o_node_界面 = self.英雄
        script_界面组件 = 'c_battle_hero'
        self.cur_card_list['英雄'] = nil
    end
    if boolean_英雄技能 then
        o_node_界面 = self.英雄技能
        script_界面组件 = 'c_battle_herospell'
        self.cur_card_list['英雄技能'] = nil
    end
    if boolean_武器 then
        o_node_界面 = self.武器
        script_界面组件 = 'c_battle_weapon'
        self.cur_card_list['武器'] = nil
    end
end

function t:getClickData(tar)
    if tar == self.英雄 then
        return self.cur_card_list['英雄']
    elseif tar == self.英雄技能 then
        return self.cur_card_list['英雄技能']
    elseif tar == self.武器 then
        return self.cur_card_list['武器']
    end
end

function t:mouseDown(tar)
    local o_card_picked = self:getClickData(tar)

    if o_card_picked then
        if self.can_pick then
            G.trig_event('UI_抓取卡牌', o_card_picked, tar)
        else
            G.trig_event('UI_卡牌选择目标', o_card_picked, tar)
        end
    end
end

function t:pickcard_state(picking)
    if picking then
        self.can_pick = false
    else
        self.can_pick = true
    end
end



return t