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
    {'/',100,3,5},
    {'//',100,3,5},
    {'%',100,30,7}
},
lua = function ()
	local G = require "gf"
	local t = G.api
	return {t["tLua_DIV"](100,3,5),t["tLua_EXACT_DIV"](100,3,5),t["tLua_MOD"](100,30,7)}
end
,
},
			},
		},
	},
}}
return t