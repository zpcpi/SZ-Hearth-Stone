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
{'技能效果_本回合当前水晶',1},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_本回合当前水晶",1)
end
,
},
			},
		},
	},
	{
		['name']=0x10130004,
		['showname']='野性印记-添加buff',
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
{'技能效果_添加BUFF',0x10130005},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680645)
end
,
},
			},
		},
	},
	{
		['name']=0x10130006,
		['showname']='治疗之触-治疗',
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
{'技能效果_法术治疗',8},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法术治疗",8)
end
,
},
			},
		},
	},
	{
		['name']=0x10130007,
		['showname']='野蛮咆哮-本回合攻击',
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
    {'技能效果_选取随从','$我方'},
    {'技能效果_选取英雄','$我方'},
    {'技能效果_本回合攻击',2}
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_选取随从","我方")
		_ = G.call("技能效果_选取英雄","我方")
		_ = G.call("技能效果_本回合攻击",2)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130005,
		['showname']='野性印记-buff',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{
    'block',
    {'技能效果_生命',2},
    {'技能效果_攻击',2},
    {
        '技能效果_特性',
        {'$嘲讽'}
    }
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_生命",2)
		_ = G.call("技能效果_攻击",2)
		_ = G.call("技能效果_特性",{"嘲讽"})
		return _
	end)()
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
    {'技能效果_选取英雄','$我方'},
    {'技能效果_护甲',2},
    {'技能效果_本回合攻击',2}
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_选取英雄","我方")
		_ = G.call("技能效果_护甲",2)
		_ = G.call("技能效果_本回合攻击",2)
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