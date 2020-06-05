--[[3001

]]

local G = require "gf"
local t = G.com()

t.prop = 
{
	{name = 'hp', type = 'int', ctrl = 'dragint'},
}

function t:init()
    self.原画组合 = self.obj.getChildByName('原画组合')
    self.原画 = self.原画组合.getChildByName('原画')

    self.职业边框 = self.obj.getChildByName('背景')
    self.职业图标1 = self.obj.getChildByName('职业图标1')
    self.职业图标2 = self.obj.getChildByName('职业图标2')
    self.职业图标3 = self.obj.getChildByName('职业图标3')

    self.名称板 = self.obj.getChildByName('名称板')
    self.名称字符 = self.名称板.getChildByName('名称字符')

    self.属性值组合 = self.obj.getChildByName('属性值组合')
    self.生命值 = self.属性值组合.getChildByName('生命值')
    self.生命值数值 = self.生命值.getChildByName('生命值数值')

    self.set_hp = G.api['CardCom_SetAttr']('hp', '生命值数值', 'text')
end

function t:setData(...)
    G.call('CardCom_SetData', self, ...)
end
return t