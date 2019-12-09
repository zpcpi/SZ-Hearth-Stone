--[[1013

]]
local t = {
'o_skill',
{
	{
		['name']=0x10130001,
		['showname']='月火术-伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='使用',
				['触发逻辑']={
t =
{'技能效果_法伤伤害',1},
lua = function ()
	local G = require "gf"
	local t = G.api
	return t["技能效果_法伤伤害"](1)
end
,
},
			},
		},
	},
}}
return t