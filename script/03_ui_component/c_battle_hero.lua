--[[3001

]]

local G = require "gf"
local t = G.com()

t.prop = 
{
	{name = 'atk', type = 'int', ctrl = 'dragint'},
	{name = 'hp', type = 'int', ctrl = 'dragint'},
	{name = 'ap', type = 'int', ctrl = 'dragint'},
}

function t:init()
    self.原画组合 = self.obj.getChildByName('原画组合')
    self.原画 = self.原画组合.getChildByName('原画')

    self.职业边框 = self.obj.getChildByName('背景')
    self.职业图标1 = self.obj.getChildByName('职业图标1')
    self.职业图标2 = self.obj.getChildByName('职业图标2')

    self.名称板 = self.obj.getChildByName('名称板')
    self.名称字符 = self.名称板.getChildByName('名称字符')

    self.属性值组合 = self.obj.getChildByName('属性值组合')
    self.攻击力 = self.属性值组合.getChildByName('攻击力')
    self.攻击力数值 = self.攻击力.getChildByName('攻击力数值')
    self.生命值 = self.属性值组合.getChildByName('生命值')
    self.生命值数值 = self.生命值.getChildByName('生命值数值')
    self.护甲值 = self.属性值组合.getChildByName('护甲值')
    self.护甲值数值 = self.护甲值.getChildByName('护甲值数值')

    self.setData = G.api['CardCom_SetData']
    self.set_atk = G.api['CardCom_SetAttr_hide']('atk', '攻击力数值', 'text', '攻击力')
    self.set_hp = G.api['CardCom_SetAttr']('hp', '生命值数值', 'text')
    self.set_ap = G.api['CardCom_SetAttr_hide']('ap', '护甲值数值', 'text', '护甲值')
end
return t