--[[3001

]]

local G = require "gf"
local t = G.com()

t.prop = 
{
	{name = 'autowidth', type = 'boolean', ctrl = 'boolean'},
	{name = 'cost', type = 'int', ctrl = 'dragint'},
}

function t:init()

    self.属性值组合 = self.obj.getChildByName('属性值组合')

    self.法力值 = self.属性值组合.getChildByName('费用').getChildByName('费用数值')

end

function t:set_cost(int_费用)
    if int_费用 then
        self.法力值.text = tostring(math.floor(self.cost))
    else
        self.法力值.text = nil
    end
end

function t:get_cost()
    return self.cost
end


return t