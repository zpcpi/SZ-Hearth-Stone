--[[3001

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.选项原型 = self.obj.getChildByName('选项原型')
    self.选项原型.visible = false
    self.选项 = self.obj.getChildByName('选项').getChildByName('content')
end

function t:setData(_select)
    self.obj.visible = true
    self.obj.parent.addChild(self.obj)
    self:update_select(_select)
end

function t:update_select(_select)
    local ui_select
    self.选项.removeAllChildren()
    if not(type(_select) == 'table' and #_select > 0) then
        G.trig_event('选择结束', 0)
    else
        for i = 1, #_select do
            ui_select = G.Clone(self.选项原型)
            ui_select.visible = true
            self.选项.addChild(ui_select)
            ui_select.c_button.text = _select[i]
            ui_select.data = i
            ui_select.mouseEnabled = true
        end
    end
end

function t:click(tar)
    if type(tar.data) == 'number' and tar.data > 0 then
        G.trig_event('选择结束', tar.data)
    end
end

return t