local G = require "gf"
local noti = G.notify

function noti.提示_显示弹框提示(string_提示内容, farg_确认回调)
    LuaPanda.BP()
    local o_node_弹窗 = G.addUI('v_common_popup')
    if o_node_弹窗 ~= nil then
        o_node_弹窗.c_common_popup:setData(string_提示内容, farg_确认回调)
    end
end
