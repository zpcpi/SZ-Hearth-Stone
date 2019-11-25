--[[1013

]]
local t = {
'o_skill',
{
	{
		['name']=0x10130001,
		['showname']='测试用任务',
		['id']=1,
		['class']={n=0,[1] = '测试用函数',
		},
		['逻辑功能']={
			[1]={
				['触发时机']='UI_卡牌确认使用',
				['触发逻辑']={
t = [===[
{'listener', {'asd', 1}, {'function', {'a'}, {{'b',1}}, {'block', {'function' , {'a'}, {{'b', 3}}, 'b'}, 'b'}}}]===],
lua = function ()
	local G = require "gf"
	local t = G.api
	return t["tLua_add_listener"](nil,{"asd",1},(function(a_40)
		local b_48 = 1
		return (function()
			local _ = nil
			_ = (function(a_82)
				local b_90 = 3
				return b_90
			end)
			_ = b_48
			return _
		end)()
	end))
end
,
},
			},
		},
	},
}}
return t