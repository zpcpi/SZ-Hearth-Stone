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
t =
{
    {'table',1}
},
lua = function ()
	local G = require "gf"
	local t = G.api
	return {{1}}
end
,
},
			},
		},
	},
}}
return t