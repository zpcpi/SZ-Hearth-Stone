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
    self.can_show = true
end

function t:start()
    self.主战场 = G.misc().主战场系统
    self.CurCard = nil
end

function t:setData(o_card_卡片数据)
    if not o_card_卡片数据 then 
        return 
    end
    local i_cardtype_卡片类型 = CARD_GET_ATTR(o_card_卡片数据, '逻辑数据', '类型')
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
    local get_attr = CARD_GET_ATTR

    local o_node_界面
    if string_卡片类型名称 == '英雄' then
        o_node_界面 = self.英雄
        self.cur_card_list['英雄'] = o_card_卡片数据

        -- 随从的攻击指令
        G.call('卡牌注册指令', o_card_卡片数据, get_attr(o_card_卡片数据, '逻辑数据', '战场卡牌指令') or 0x10040008)
    elseif string_卡片类型名称 == '英雄技能' then
        o_node_界面 = self.英雄技能
        self.cur_card_list['英雄技能'] = o_card_卡片数据

        -- 英雄技能战场指令
        local i_order_当前指令 = get_attr(o_card_卡片数据, '逻辑数据', '战场卡牌指令')
        if i_order_当前指令 then
            G.call('卡牌注册指令', o_card_卡片数据, i_order_当前指令)
        end
    elseif string_卡片类型名称 == '武器卡' then
        o_node_界面 = self.武器
        self.cur_card_list['武器'] = o_card_卡片数据
    end
    o_node_界面.c_card_manager:setData(o_card_卡片数据, true)
    o_node_界面.visible = true
end

function t:getData()
    return self.cur_card_list['英雄'], self.cur_card_list['英雄技能'], self.cur_card_list['武器']
end

function t:delData(boolean_英雄, boolean_英雄技能, boolean_武器)
    local o_node_界面

    if boolean_英雄 then
        o_node_界面 = self.英雄
        o_node_界面.c_card_manager:setData(nil)
        o_node_界面.visible = false
        self.cur_card_list['英雄'] = nil
    end
    if boolean_英雄技能 then
        o_node_界面 = self.英雄技能
        o_node_界面.c_card_manager:setData(nil)
        o_node_界面.visible = false
        self.cur_card_list['英雄技能'] = nil
    end
    if boolean_武器 then
        o_node_界面 = self.武器
        o_node_界面.c_card_manager:setData(nil)
        o_node_界面.visible = false
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

function t:getClickData_pick(tar)
    if tar == self.英雄 then
        return self.cur_card_list['英雄'], self.英雄
    elseif tar == self.英雄技能 then
        return self.cur_card_list['英雄技能'], self.英雄技能
    elseif tar == self.武器 then
        return self.cur_card_list['英雄'], self.英雄
    end
end

function t:rollOver(tar)
    if self.can_show then
        local o_card_picked = self:getClickData(tar)

        if o_card_picked then
            self.CurCard = tar

            if tar == self.英雄技能 then
                G.trig_event('UI_鼠标覆盖卡牌', o_card_picked)
            end

            local posx, posy = tar.localToGlobal(0, 0)
            self.主战场:showtips(o_card_picked, posx + 200, posy + 15)
        end
    end
end

function t:rollOut(tar)
    if self.can_show then
        local o_card_picked = self:getClickData(tar)

        if o_card_picked then
            if tar == self.英雄技能 then
                G.trig_event('UI_鼠标离开卡牌', o_card_picked)
            end

            self.CurCard = nil
            self.主战场:hidetips()
        end
    end
end

function t:mouseDown(tar)
    local o_card_picked
    if self.can_pick then
        o_card_picked, tar = self:getClickData_pick(tar)

        if o_card_picked then
            G.trig_event('UI_抓取卡牌_战场', o_card_picked, tar)
        end
    end
end

function t:mouseUp(tar)
    local o_card_picked

    if self.can_pick then
    else
        o_card_picked = self:getClickData(tar)
        G.trig_event('UI_卡牌选择目标', o_card_picked, tar)
    end
end

function t:can_pick_state(state)
    self.can_pick = state
end

function t:can_show_state(state)
    self.can_show = state
    if state then
    else
        self.主战场:hidetips()
    end
end

return t