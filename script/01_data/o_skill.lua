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
{'function', {'c', 'd'},{{'a',2}, {'b',3}}, {'+',1,2,3,4}} ]===],
lua = function ()
	local G = require "gf"
	local t = G.api
	return (function(c_15,d_20)
		local a_27 = 2
		local b_36 = 3
		return t["tLua_ADD"](1,2,3,4)
	end)
end
,
},
			},
		},
	},
}}
return t