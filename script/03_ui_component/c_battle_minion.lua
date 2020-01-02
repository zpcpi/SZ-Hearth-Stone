--[[300a

]]

local G = require "gf"
local t = G.com()

t.prop = 
{
	{name = 'cost', type = 'int', ctrl = 'dragint'},
	{name = 'atk', type = 'int', ctrl = 'dragint'},
	{name = 'hp', type = 'int', ctrl = 'dragint'},
	{name = 'ap', type = 'int', ctrl = 'dragint'},
}

function t:init()
    self.原画组合 = self.obj.getChildByName('原画组合')
    self.原画 = self.原画组合.getChildByName('原画')

    self.嘲讽框 = self.obj.getChildByName('嘲讽框')
    self.精英板 = self.obj.getChildByName('精英板')

    self.属性值组合 = self.obj.getChildByName('属性值组合')
    self.攻击力 = self.属性值组合.getChildByName('攻击力')
    self.攻击力数值 = self.攻击力.getChildByName('攻击力数值')
    self.生命值 = self.属性值组合.getChildByName('生命值')
    self.生命值数值 = self.生命值.getChildByName('生命值数值')
    self.护甲值 = self.属性值组合.getChildByName('护甲值')
    self.护甲值数值 = self.护甲值.getChildByName('护甲值数值')

    self.状态栏 = self.obj.getChildByName('状态栏')
    self.剧毒框 = self.状态栏.getChildByName('剧毒')
    self.吸血框 = self.状态栏.getChildByName('吸血')
    self.超杀框 = self.状态栏.getChildByName('超杀')

    self.被动框 = self.状态栏.getChildByName('被动')
    self.亡语框 = self.状态栏.getChildByName('亡语')
    self.光环框 = self.状态栏.getChildByName('光环')

    self.圣盾框 = self.状态栏.getChildByName('圣盾')
    self.复生框 = self.状态栏.getChildByName('复生')
    self.免疫框 = self.状态栏.getChildByName('免疫')

    self.冻结框 = self.状态栏.getChildByName('冻结')
    self.攻击框 = self.状态栏.getChildByName('攻击')

    self.setData = function (self, o_card)
        self.cur_card = o_card
        G.api['CardCom_SetData'](self, o_card)
    end
    self.set_atk = G.api['CardCom_SetAttr']('atk', '攻击力数值', 'text')
    self.set_hp = G.api['CardCom_SetAttr']('hp', '生命值数值', 'text')
    self.set_ap = G.api['CardCom_SetAttr_hide']('ap', '护甲值数值', 'text', '护甲值')
end

function t:getData()
    return self.cur_card
end

return t