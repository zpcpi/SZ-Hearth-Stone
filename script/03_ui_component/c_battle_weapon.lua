--[[300b

]]

local G = require "gf"
local t = G.com()

t.prop = 
{
	{name = 'atk', type = 'int', ctrl = 'dragint'},
	{name = 'hp', type = 'int', ctrl = 'dragint'},
    {name = 'used', type = 'boolean'},
}

function t:init()
    self.原画组合 = self.obj.getChildByName('原画组合')
    self.原画 = self.原画组合.getChildByName('原画')

    self.精英板 = self.obj.getChildByName('精英板')
    self.遮挡板 = self.obj.getChildByName('遮挡板')

    self.属性值组合 = self.obj.getChildByName('属性值组合')
    self.攻击力 = self.属性值组合.getChildByName('攻击力')
    self.攻击力数值 = self.攻击力.getChildByName('攻击力数值')
    self.生命值 = self.属性值组合.getChildByName('生命值')
    self.生命值数值 = self.生命值.getChildByName('生命值数值')

    self.setData = G.api['CardCom_SetData']
    self.set_atk = G.api['CardCom_SetAttr_hide']('atk', '攻击力数值', 'text', '攻击力')
    self.set_hp = G.api['CardCom_SetAttr']('hp', '生命值数值', 'text')
    self.set_used = G.api['CardCom_SetAttr_hide']('used', nil, nil, '遮挡板')
end
return t