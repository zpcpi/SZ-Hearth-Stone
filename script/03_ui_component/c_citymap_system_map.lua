--[[3003

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.背景 = self.obj.getChildByName('背景')
    self.城市 = self.obj.getChildByName('城市')
    self.前景 = self.obj.getChildByName('前景')
    self.标题 = self.obj.getChildByName('标题')
end

function t:setData(map)
    self.背景.img = map.地图背景
    self.标题.text = map.名称
    self.城市.removeAllChildren()

    if map.城市列表 then
        for i = 1, #map.城市列表 do
            if map.城市列表[i].城市 and map.城市列表[i].位置 and map.城市列表[i].位置.x and map.城市列表[i].位置.y then
                local ui_city = G.loadUI("v_citymap_system_city")
                ui_city.name = tostring(i)
                ui_city.anchor = 0x0
                ui_city.x = map.城市列表[i].位置.x
                ui_city.y = map.城市列表[i].位置.y
                ui_city.c_citymap_system_city:setData(G.QueryName(map.城市列表[i].城市))

                self.城市.addChild(ui_city)
            end

        end

    end

end

function t:getCityObj(index)
    return self.城市.getChildByName(tostring(index))
end

return t