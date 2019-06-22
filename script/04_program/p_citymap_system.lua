--[[4002

]]
local G = require "gf"
local L = {}
local t = G.api

--type=地图系统
--private=true
--hide=true
t['地图系统_初始化地图系统'] = function()
    local o_citymap_system_city_城市
    local o_citymap_system_eventinfo_事件信息
    local o_citymap_system_map_地图
    while true do
		G.wait1("点击城市事件")
        o_citymap_system_city_城市,o_citymap_system_eventinfo_事件信息 = G.event_info()

        if o_citymap_system_city_城市 and o_citymap_system_eventinfo_事件信息.是否进入 then
            if o_citymap_system_city_城市.关联地图 and not o_citymap_system_city_城市.锁定 then
                o_citymap_system_map_地图 = G.QueryName(o_citymap_system_city_城市.关联地图)
                if o_citymap_system_map_地图 then
                    G.call('地图系统_进入地图', o_citymap_system_map_地图)
                end
            end
        end
    end
end

--type=地图系统
--private=true
--hide=true
t['地图系统_进入地图'] = function(o_citymap_system_map_地图)
    G.trig_event('进入地图事件', o_citymap_system_map_地图)
    G.misc().当前地图 = o_citymap_system_map_地图.name
    G.call('地图系统_进入地图UI', o_citymap_system_map_地图)
end

--type=地图系统
--private=true
--hide=true
t['地图系统_离开地图'] = function()
    if G.misc().当前地图 then
        G.trig_event('离开地图事件', G.QueryName(G.misc().当前地图))
        G.misc().当前地图 = nil
    else
        G.trig_event('离开地图事件', nil)
    end
    G.call('地图系统_离开地图UI')
end