--[[3017

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.伤害信息 = self.obj.getChildByName('伤害信息')
    self.伤害底图 = self.伤害信息.getChildByName('底图')
    self.伤害数值 = self.伤害底图.getChildByName('信息数值')

    self.治疗信息 = self.obj.getChildByName('治疗信息')
    self.治疗底图 = self.治疗信息.getChildByName('底图')
    self.治疗数值 = self.治疗底图.getChildByName('信息数值')

    self.动画控件 = self.obj.getChildByName('动画控件')
end

function t:start()
    self.主战场 = G.misc().主战场系统
    self.actor = self.动画控件.c_animactor
end

function t:show_init()
    self.伤害信息.visible = false
    self.治疗信息.visible = false
end

function t:show_伤害信息(int_数值)
    self:show_init()

    -- 文本修改
    self.伤害数值.text = '-' .. int_数值

    -- 执行动画
    self:runanim(self.伤害信息)
end

function t:show_治疗信息(int_数值)
    self:show_init()

    -- 文本修改
    self.治疗数值.text = '+' .. int_数值

    -- 执行动画
    self:runanim(self.治疗信息)
end

function t:runanim(obj)
    -- 控件设置
    obj.x = 0
    obj.y = 0
    obj.visible = true
    obj.scaleX = 0.01
    obj.scaleY = 0.01

    self.actor:clear_animquest()
    self.actor:pop_quote('::Pic')
    self.actor:push_quote('::Pic', obj)

    self.actor:add_animquest(
        G.call('动画系统_创建quest_自定义', self.actor, true, 500, {
                {'动画系统_多属性设置', '::Pic', {'scaleX', 'scaleY'}, {1.0, 1.0}, {
					['x1']=0,
					['y1']=2,
					['x2']=0,
					['y2']=1,
				}},
            },
            {
                [1] = G.call('动画系统_创建quest_自定义', self.actor, true, 1000)
            })
        )
    self.actor:add_animquest(
        G.call('动画系统_创建quest_自定义', self.actor, false, 30, {
                {self.show_init, self},
            })
        )
end

return t