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
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_法伤伤害',1},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法伤伤害",1)
end
,
},
			},
		},
	},
}}
return t