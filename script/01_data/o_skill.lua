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
	{
		['name']=0x10130002,
		['showname']='激活-本回合水晶',
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
{'技能效果_本回合当前水晶','info.Player',1},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_本回合当前水晶",info.Player,1)
end
,
},
			},
		},
	},
	{
		['name']=0x10130003,
		['showname']='爪击-护甲、本回合攻击',
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
{
    'block',
    {'技能效果_英雄护甲','info.Player',2},
    {'技能效果_本回合英雄攻击','info.Player',2}
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_英雄护甲",info.Player,2)
		_ = G.call("技能效果_本回合英雄攻击",info.Player,2)
		return _
	end)()
end
,
},
			},
		},
	},
}}
return t