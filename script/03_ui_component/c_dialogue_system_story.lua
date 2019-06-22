--[[3001

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.角色 = self.obj.getChildByName('角色')
    self.文字 = self.obj.getChildByName('对话框').getChildByName('文字')
    self.角色名称 = self.obj.getChildByName('角色名称')

    self.文字.dlgspeed = 50
    self.角色x = self.角色.x
    self.角色y = self.角色.y
    self.角色scaleX = self.角色.scaleX
    self.角色scaleY = self.角色.scaleY
    self.角色color = self.角色.color
    self.角色alpha = self.角色.alpha
end

function t:setData(name, image, dialogue, o_dialogue_system_actionlist)
    self:recover_role_ui()
    self.obj.visible = true
    self.obj.parent.addChild(self.obj)
    self:update_role(name, image)
    self:update_dialogue(dialogue)
    self.动画action = G.RunAction('动画通用_播放动画序列', o_dialogue_system_actionlist, self.角色)
end

function t:update_dialogue(dialogue)
    self.文字.text = tostring(dialogue)
end

function t:update_role(name, image)
    if image then
        self.角色.visible = true
        self.角色.img = image
    else
        self.角色.visible = false
    end

    self:update_role_name(name)
end

function t:update_role_name(name)
    if name and name ~= "" then
        self.角色名称.visible = true
        self.角色名称.getChildByName('姓名').text = name
    else
        self.角色名称.visible = false
        self.角色名称.getChildByName('姓名').text = ""
    end
end

function t:click(tar)
    if G.getUI('v_dialogue_system_select') and G.getUI('v_dialogue_system_select').visible then
        return
    end
    if self.文字.dlgword == 0 then
        G.trig_event('对话结束')
	else
		self.文字.dlgword = 0
	end
end

function t:recover_role_ui()
    if self.动画action then
        G.RemoveAction(self.动画action)
    end
    self.角色.x = self.角色x
    self.角色.y = self.角色y
    self.角色.scaleX = self.角色scaleX
    self.角色.scaleY = self.角色scaleY
    self.角色.color = self.角色color
    self.角色.alpha = self.角色alpha
end

return t