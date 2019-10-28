--[[3001

]]

local G = require "gf"
local t = G.com()

t.prop = 
{
	{name = 'cost', type = 'int', ctrl = 'dragint'},
}

function t:init()
    self.原画组合 = self.obj.getChildByName('原画组合')
    self.原画 = self.原画组合.getChildByName('原画')

    self.职业边框 = self.obj.getChildByName('背景')

    self.名称字符 = self.obj.getChildByName('名称字符')
    self.描述字符 = self.obj.getChildByName('描述字符')

    self.属性值组合 = self.obj.getChildByName('属性值组合')
    self.费用 = self.属性值组合.getChildByName('费用')
    self.费用数值 = self.费用.getChildByName('费用数值')

    self.setData = G.api['CardCom_SetData']
    self.set_cost = G.api['CardCom_SetAttr']('cost', '费用数值', 'text')
end
return t