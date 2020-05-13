--[[3008

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.卡背框 = self.obj.getChildByName('卡背框')
    self.卡片实例 = self.obj.getChildByName('卡片实例')
    self.卡牌控件 = nil
    self.卡牌组件 = nil

    self.cur_card = nil
    self.cur_obj = nil
end

function t:setData(o_card_卡片数据, boolean_isbattle)
    -- TODO，这里有泄露，card里面的事件没有清除
    self.卡片实例.removeAllChildren()
    self.卡背框.visible = true
    self.cur_card = o_card_卡片数据
    if (not o_card_卡片数据) then 
        self:delete()
        return 
    end

    -- 注册卡牌更新监听
    do
        local update_data = function ()
            self:setData(self.cur_card, boolean_isbattle)
        end
    
        local key = 'c_card_manager|' .. tostring(self)
        G.removeListener(key, '卡牌实例_信息更新')
        G.api[key] = update_data
        G.addListener(key, {'卡牌实例_信息更新', o_card_卡片数据.name})
    end

    -- 如果是未知的，那么只显示卡背
    if G.call('卡牌条件_卡牌特性判断', o_card_卡片数据, {'未知'}) then 
        self:delete()
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
    local string_uipath
    if boolean_isbattle then
        string_uipath = o_cardtype_卡片类型.战斗界面控件 or o_cardtype_卡片类型.界面控件
    else
        string_uipath = o_cardtype_卡片类型.界面控件
    end
    local o_node_界面 = G.loadUI(string_uipath)
    if o_node_界面 then 
        self.卡背框.visible = false
        self.卡片实例.addChild(o_node_界面)
        self.cur_obj = o_node_界面
        local script_界面组件 = 'c_' .. string.sub(string_uipath, 3)
        local o_node_卡牌框 = o_node_界面.getChildByName('卡牌框')
        if o_node_卡牌框 and o_node_卡牌框[script_界面组件] and o_node_卡牌框[script_界面组件].setData then 
            o_node_卡牌框[script_界面组件]:setData(o_card_卡片数据, self)

            self.卡牌控件 = o_node_界面
            self.卡牌组件 = o_node_卡牌框[script_界面组件]
        end
    end
end

function t:getData()
    return self.cur_card
end

-- 控件删除
function t:delete()
    local key = 'c_card_manager|' .. tostring(self)
    G.removeListener(key, '卡牌实例_信息更新')
    G.api[key] = nil

    key = 'card_flagchange|' .. tostring(self)
    G.removeListener(key, 'UI_卡牌状态更新')
    G.api[key] = nil

    key = 'card_attrchange|' .. tostring(self)
    G.removeListener(key, 'UI_卡牌属性更新')
    G.api[key] = nil

    key = 'card_showinfo|' .. tostring(self)
    G.removeListener(key, 'UI_卡牌战斗信息')
    G.api[key] = nil
end

return t