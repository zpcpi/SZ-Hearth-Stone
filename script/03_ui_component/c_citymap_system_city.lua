--[[3003

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.按钮 = self.obj.getChildByName('按钮')
    self.锁 = self.obj.getChildByName('锁')
    self.名称 = self.obj.getChildByName('名称')
end

function t:setData(city)
    self.名称.text = city.名称
    self.按钮.c_button.img_normal = city.图标

    if city.锁定 then
        self.锁.visible = true
        self.按钮.color = 0x707070
    else
        self.锁.visible = false
        self.按钮.color = 0xffffff
    end

    self.city = city
end

function t:click(tar)
    G.trig_event('点击城市事件', self.city, {['是否进入'] = true})
end

return t