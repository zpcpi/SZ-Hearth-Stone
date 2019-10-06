--[[3008

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.卡背框 = self.obj.getChildByName('卡背框')
    self.卡片实例 = self.obj.getChildByName('卡片实例')

    self.cur_card = nil
end

function t:setData(o_card_卡片数据)
    self.卡片实例.removeAllChildren()
    self.卡背框.visible = true
    self.cur_card = o_card_卡片数据
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
    local o_node_界面 = G.loadUI(o_cardtype_卡片类型.界面控件)
    if o_node_界面 then 
        self.卡背框.visible = false
        self.卡片实例.addChild(o_node_界面)
        local script_界面组件 = 'c_' .. string.sub(o_cardtype_卡片类型.界面控件, 3)
        local o_node_卡牌框 = o_node_界面.getChildByName('卡牌框')
        if o_node_卡牌框 and o_node_卡牌框[script_界面组件] and o_node_卡牌框[script_界面组件].setData then 
            o_node_卡牌框[script_界面组件]:setData(o_card_卡片数据)
        end
    end
end

function t:getData()
    return self.cur_card
end

return t