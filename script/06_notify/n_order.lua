local G = require "gf"
local noti = G.notify

function noti.卡牌注册指令_发现(_o_card_显示卡牌列表, i_order_当前指令)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_发现界面 = script_战场.choose

    script_发现界面:setData(_o_card_显示卡牌列表, i_order_当前指令)
    script_发现界面.obj.visible = true
end
