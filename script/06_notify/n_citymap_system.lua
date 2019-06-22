local G = require "gf"
local noti = G.notify

function noti.地图系统_进入地图UI(o_citymap_system_map_地图)
    local ui_obj

    if not o_citymap_system_map_地图 then
        return
    end

    G.addUI('v_citymap_system_map')
    ui_obj = G.getUI('v_citymap_system_map')
    if not ui_obj then
        return
    end

    if ui_obj.c_citymap_system_map then
        ui_obj.c_citymap_system_map:setData(o_citymap_system_map_地图)
    end
end

function noti.地图系统_离开地图UI()
    G.removeUI('v_citymap_system_map')
end