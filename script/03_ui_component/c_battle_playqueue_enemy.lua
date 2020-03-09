--[[3018

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.队列功能区 = self.obj.getChildByName('队列功能区')

    self.动画控件 = self.obj.getChildByName('动画控件')
end

function t:start()
    self.objlist = {}
    self.showlist = {}

    self.acotr = self.动画控件.c_animactor
    self.acotr:push_quote('::Self', self)
end

function t:queue_addobj(o_card_卡牌)
    local ui_card = G.loadUI('v_card_manager')
    self.队列功能区.addChild(ui_card)

    ui_card.mouseEnabled = false
    ui_card.alpha = 255
    ui_card.scaleX = 0.28
    ui_card.scaleY = 0.28
    ui_card.c_card_manager:setData(o_card_卡牌)

    table.insert(self.objlist, ui_card)

    return ui_card
end

function t:get_obj_bycard(card)
    for k,v in ipairs(self.objlist or {}) do
        if v.c_card_manager:getData() == card then
            return v
        end
    end
    for k,v in ipairs(self.showlist or {}) do
        if v.c_card_manager:getData() == card then
            return v
        end
    end
end

function t:queue_removeobj(ui_obj)
    for i = #self.objlist, 1, -1 do
        if self.objlist[i] == ui_obj then
            table.remove(self.objlist, i)

            ui_obj.visible = false
            ui_obj.parent:removeChild(ui_obj)
        end
    end
    for i = #self.showlist, 1, -1 do
        if self.showlist[i] == ui_obj then
            table.remove(self.showlist, i)

            ui_obj.visible = false
            ui_obj.parent:removeChild(ui_obj)
        end
    end
end

function t:queue_popobj(card)
    local index
    if (#self.objlist > 0) then
        for k, ui_obj in ipairs(self.objlist) do
            if ui_obj.c_card_manager:getData() == card then
                -- 合法，开始处理
                index = k
                goto next
            end
        end
        return 
    end

    ::next::
    local ui_obj = self.objlist[index]
    table.remove(self.objlist, index)
    table.insert(self.showlist, ui_obj)
    return ui_obj
end

function t:queue_posinit()
    self.acotr:clear_animquest()

    local px = 25
    local max = #self.objlist

    for i = max, 1, -1 do
        self.acotr:add_animquest(
            G.call('动画系统_创建quest_自定义', self.acotr, false, 300, 
            {
                [1] = {
                    n = 4,
                    [1] = '动画系统_多属性设置',
                    [2] = '::Self.objlist[' .. i .. ']',
                    [3] = {
                        [1] = 'x',
                        [2] = 'y',
                    },
                    [4] = {
                        [1] = 0 - (px * (max - i)),
                        [2] = 0,
                    },
                    [5]={
                        ['x1']=0,
                        ['y1']=0.5,
                        ['x2']=0.5,
                        ['y2']=1,
                    },
                },
            })
        )
    end
end



return t