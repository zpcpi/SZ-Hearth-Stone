--[[0

]]
local G = require "gf"
local t = G.api
local L = {}
--type=系统
--hide=false
--private=false
t['初始化'] = function()
-->	G.log("欢迎使用梦江湖编辑器")
-->	G.addUI("v_helloworld")
	G.start_program("作弊系统_初始化作弊系统")
	G.start_program("地图系统_初始化地图系统")
	G.call("地图系统_进入地图",G.QueryName(0x10060002))
	-- G.call("剧情演示")
end
--type=
--hide=false
--private=false
t['剧情演示'] = function()
	local int_选项 = 0
-->	G.log("以下为剧情接口的使用演示")
	G.call("对话系统_显示对话","无名女子",0x56010002,"现在将演示基础的剧情对话功能",G.QueryName(0x10010003))
	G.call("对话系统_显示对话","无名女子",0x56010002,"接下来将会有一个选择",G.QueryName(0x10010002))
	while int_选项 == 0 do 
		int_选项 = G.call("对话系统_显示对话选择","无名女子",0x56010002,"点击选项按钮做出你的选择",{"我选择 1", "我选择 2", "我选择 3", "下一页"},G.QueryName(0x10010001))
		if int_选项 == 1 then 
			G.call("对话系统_显示对话","无名女子",0x56010002,"你选择的是 1",G.QueryName(0x10010005))
		elseif int_选项 == 2 then 
			G.call("对话系统_显示对话","无名女子",0x56010002,"你选择的是 2",G.QueryName(0x10010005))
		elseif int_选项 == 3 then 
			G.call("对话系统_显示对话","无名女子",0x56010002,"你选择的是 3",G.QueryName(0x10010005))
		elseif int_选项 == 4 then 
			int_选项 = G.call("对话系统_显示对话选择","无名女子",0x56010002,"点击选项按钮做出你的选择",{"我选择 4", "我选择 5", "我选择 6", "下一页"},G.QueryName(0x10010001))
			if int_选项 == 1 then 
				G.call("对话系统_显示对话","无名女子",0x56010002,"你选择的是 4",G.QueryName(0x10010005))
			elseif int_选项 == 2 then 
				G.call("对话系统_显示对话","无名女子",0x56010002,"你选择的是 5",G.QueryName(0x10010005))
			elseif int_选项 == 3 then 
				G.call("对话系统_显示对话","无名女子",0x56010002,"你选择的是 6",G.QueryName(0x10010005))
			elseif int_选项 == 4 then 
				int_选项 = 0
			else 
			end
		else 
		end
	end
	G.call("对话系统_显示对话","无名女子",0x56010002,"演示结束",G.QueryName(0x10010006))
end
--type=系统
--hide=true
--private=false
t['修改横幅字体'] = function(string_文本)
	local ui_obj
	ui_obj = G.getUI('v_helloworld')
	if ui_obj then 
		ui_obj.getChildByName('标题').text = string_文本 or ""
	end
end
