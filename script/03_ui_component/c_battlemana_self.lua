--[[300d

]]

local G = require "gf"
local t = G.com()

t.prop = 
{
	{name = '最大值', type = 'int', ctrl = 'dragint'},
	{name = '当前值', type = 'int', ctrl = 'dragint'},
	{name = '预览值', type = 'int', ctrl = 'dragint'},
	{name = '锁定值', type = 'int', ctrl = 'dragint'},
	{name = '预锁定值', type = 'int', ctrl = 'dragint'},
}

function t:init()
    self.布局点 = self.obj.getChildByName('布局点')
    self.水晶模板 = self.布局点.getChildByName('水晶模板')
    self.法力值数值 = self.obj.getChildByName('法力值数值')

    self.水晶list = {}
    self.水晶list_next = {}

    self.set_最大值 = function(com, old_value) com:show_change('最大值', old_value) end
    self.set_当前值 = function(com, old_value) com:show_change('当前值', old_value) end
    self.set_预览值 = function(com, old_value) com:show_change('预览值', old_value) end
    self.set_锁定值 = function(com, old_value) com:show_change('锁定值', old_value) end
    self.set_预锁定值 = function(com, old_value) com:show_change('预锁定值', old_value) end

    self.水晶_startx = self.水晶模板.x
    self.水晶_starty = self.水晶模板.y
    self.水晶_px = self.水晶模板.width * 0.075 + 4
    self.水晶_py = self.水晶模板.height * 0.075 + 8

    if G.is_editor then
    else
        self:水晶_init()
    end
end

function t:水晶_init()
    for i = 1, 10, 1 do
        local 水晶obj = G.Clone(self.水晶模板)
        -- 水晶obj.visible = true
        self.水晶list[i] = 水晶obj
        self.布局点.addChild(水晶obj)

        水晶obj.x = self.水晶_startx + (i - 1) * self.水晶_px

        -- 锁定水晶
        水晶obj = G.Clone(self.水晶模板)
        -- 水晶obj.visible = true
        self.水晶list_next[i] = 水晶obj
        self.布局点.addChild(水晶obj)
        水晶obj.img = 0x560b000a
        水晶obj.x = self.水晶_startx + (i - 1) * self.水晶_px
        水晶obj.y = self.水晶_starty - self.水晶_py
    end
end

function t:next_turn()
    -- 法力值增加
    -- 水晶锁移动
end

function t:show_change(attr, old_value)



end


return t