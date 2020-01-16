--[[1013

]]
local t = {
'o_skill',
{
	{
		['name']=0x1013000e,
		['showname']='奥术射击-伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_法术伤害',2},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法术伤害",2)
end
,
},
			},
		},
	},
	{
		['name']=0x10130038,
		['showname']='神圣惩击-伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_法术伤害',2},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法术伤害",2)
end
,
},
			},
		},
	},
	{
		['name']=0x1013003f,
		['showname']='背刺-伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_法术伤害',2},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法术伤害",2)
end
,
},
			},
		},
	},
	{
		['name']=0x1013004d,
		['showname']='先祖治疗-回满血',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{
    'map',
    {
        'function',
        {'tar'},
        {
            {
                'hp',
                {'卡牌属性_获取','tar','$生命','$最大值'}
            }
        },
        {
            '技能效果_效果树_执行子效果',
            {
                ['Player'] = 'info.Player',
                ['Target'] = {'table','tar'}
            },
            {
                'function',
                {},
                {},
                {'技能效果_法术治疗','hp'}
            }
        }
    },
    'info.Target'
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return t["tLua_MAP"]((function(tar_49)
		local hp_97 = G.call("卡牌属性_获取",tar_49,"生命","最大值")
		return G.call("技能效果_效果树_执行子效果",{["Player"] = info.Player,["Target"] = {tar_49}},(function()
			return G.call("技能效果_法术治疗",hp_97)
		end))
	end),info.Target)
end
,
},
			},
		},
	},
	{
		['name']=0x1013004e,
		['showname']='图腾之力-添加buff',
		['目标筛选']={n=8,[1] = '卡牌条件_目标通用过滤器',
			[3]='我方',
			[4]={
				[1]=0x10090004,
			},
			[5]={
				[1]='战场',
			},
			[6]={
				[1]=0x100a0008,
			},
		},
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {
        '技能目标_选取随从',
        '$我方',
        {'卡牌数据_制作过滤器','self','card'}
    },
    {'技能效果_添加BUFF',0x1013004f}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","我方",G.call("卡牌数据_制作过滤器",self,card))
		_ = G.call("技能效果_添加BUFF",269680719)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130042,
		['showname']='影袭-伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取英雄','$敌方1'},
    {'技能效果_法术伤害',3}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取英雄","敌方1")
		_ = G.call("技能效果_法术伤害",3)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130039,
		['showname']='暗言术：痛-消灭目标',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_消灭目标'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_消灭目标")
end
,
},
			},
		},
	},
	{
		['name']=0x1013003e,
		['showname']='精神控制-控制随从',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_牧师精控'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_牧师精控")
end
,
},
			},
		},
	},
	{
		['name']=0x1013003a,
		['showname']='暗言术：灭-消灭目标',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_消灭目标'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_消灭目标")
end
,
},
			},
		},
	},
	{
		['name']=0x10130049,
		['showname']='刺杀-消灭目标',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_消灭目标'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_消灭目标")
end
,
},
			},
		},
	},
	{
		['name']=0x1013003b,
		['showname']='神圣新星-群体伤害,群体治疗',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {
        '技能效果_效果树_执行子效果',
        {
            ['Caster'] = 'info.Caster',
            ['Player'] = 'info.Player'
        },
        {
            'function',
            {},
            {},
            {
                'block',
                {'技能目标_选取英雄','$敌方1'},
                {'技能目标_选取随从','$敌方1'},
                {'技能效果_法术伤害',2}
            }
        }
    },
    {
        '技能效果_效果树_执行子效果',
        {
            ['Caster'] = 'info.Caster',
            ['Player'] = 'info.Player'
        },
        {
            'function',
            {},
            {},
            {
                'block',
                {'技能目标_选取英雄','$我方'},
                {'技能目标_选取随从','$我方'},
                {'技能效果_法术治疗',2}
            }
        }
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_效果树_执行子效果",{["Caster"] = info.Caster,["Player"] = info.Player},(function()
			return (function()
				local _ = nil
				_ = G.call("技能目标_选取英雄","敌方1")
				_ = G.call("技能目标_选取随从","敌方1")
				_ = G.call("技能效果_法术伤害",2)
				return _
			end)()
		end))
		_ = G.call("技能效果_效果树_执行子效果",{["Caster"] = info.Caster,["Player"] = info.Player},(function()
			return (function()
				local _ = nil
				_ = G.call("技能目标_选取英雄","我方")
				_ = G.call("技能目标_选取随从","我方")
				_ = G.call("技能效果_法术治疗",2)
				return _
			end)()
		end))
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013002f,
		['showname']='愤怒之锤-伤害,抽牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能效果_法术伤害',3},
    {'技能效果_抽牌'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_法术伤害",3)
		_ = G.call("技能效果_抽牌")
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130045,
		['showname']='毒刃-伤害,抽牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能效果_法术伤害',1},
    {'技能效果_抽牌'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_法术伤害",1)
		_ = G.call("技能效果_抽牌")
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013004b,
		['showname']='闷棍-战场回手',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_潜行者闷棍'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_潜行者闷棍")
end
,
},
			},
		},
	},
	{
		['name']=0x10130046,
		['showname']='刀扇-群体伤害,抽牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取随从','$敌方1'},
    {'技能效果_法术伤害',1},
    {'技能效果_抽牌'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","敌方1")
		_ = G.call("技能效果_法术伤害",1)
		_ = G.call("技能效果_抽牌")
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013004a,
		['showname']='疾跑-抽四牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能效果_抽牌'},
    {'技能效果_抽牌'},
    {'技能效果_抽牌'},
    {'技能效果_抽牌'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_抽牌")
		_ = G.call("技能效果_抽牌")
		_ = G.call("技能效果_抽牌")
		_ = G.call("技能效果_抽牌")
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013001e,
		['showname']='寒冰箭-伤害,冻结',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能效果_法术伤害',3},
    {
        '技能效果_特性',
        {'$冻结'}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_法术伤害",3)
		_ = G.call("技能效果_特性",{"冻结"})
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130050,
		['showname']='冰霜震击-伤害,冻结',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能效果_法术伤害',1},
    {
        '技能效果_特性',
        {'$冻结'}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_法术伤害",1)
		_ = G.call("技能效果_特性",{"冻结"})
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130052,
		['showname']='风怒-添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130053},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680723)
end
,
},
			},
		},
	},
	{
		['name']=0x1013001c,
		['showname']='奥术飞弹-随机打三个',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_奥数飞弹',
    3,
    1,
    {
        'function',
        {},
        {},
        {
            'block',
            {'技能目标_选取英雄','$敌方1'},
            {'技能目标_选取随从','$敌方1'},
            {'技能目标_随机选择',1}
        }
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_奥数飞弹",3,1,(function()
		return (function()
			local _ = nil
			_ = G.call("技能目标_选取英雄","敌方1")
			_ = G.call("技能目标_选取随从","敌方1")
			_ = G.call("技能目标_随机选择",1)
			return _
		end)()
	end))
end
,
},
			},
		},
	},
	{
		['name']=0x1013001d,
		['showname']='镜像-召唤',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_召唤',
    {
        {'$我方','$末尾',0x10060029},
        {'$我方','$末尾',0x10060029}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_召唤",{{"我方","末尾",268828713},{"我方","末尾",268828713}})
end
,
},
			},
		},
	},
	{
		['name']=0x1013001b,
		['showname']='稳固射击-伤害',
		['postfix']='英雄技能',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_英雄技能使用','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_英雄技能使用",card}
end
,
},
				['触发逻辑']={
t =
{
    'block',
    {
        'if',
        {
            '==',
            {'卡牌数据_获取目标数量'},
            0
        },
        {'技能目标_选取英雄','$敌方1'}
    },
    {'技能效果_英雄技能伤害',2}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = (function ()
			if(t["tLua_EQUAL"](G.call("卡牌数据_获取目标数量"),0))then
				return G.call("技能目标_选取英雄","敌方1")
			end
		end)()
		_ = G.call("技能效果_英雄技能伤害",2)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013002a,
		['showname']='火焰冲击-伤害',
		['postfix']='英雄技能',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_英雄技能使用','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_英雄技能使用",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_英雄技能伤害',1},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_英雄技能伤害",1)
end
,
},
			},
		},
	},
	{
		['name']=0x1013003c,
		['showname']='次级治疗术-治疗',
		['postfix']='英雄技能',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_英雄技能使用','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_英雄技能使用",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_英雄技能治疗',2},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_英雄技能治疗",2)
end
,
},
			},
		},
	},
	{
		['name']=0x10130010,
		['showname']='追踪术-牌库3选1',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_追踪术',3},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_追踪术",3)
end
,
},
			},
		},
	},
	{
		['name']=0x10130011,
		['showname']='猎人印记-添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130016},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680662)
end
,
},
			},
		},
	},
	{
		['name']=0x10130017,
		['showname']='驯兽师-战吼添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='战吼',
				['触发时机']={
t =
{'$逻辑_随从战吼','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从战吼",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130018},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680664)
end
,
},
			},
		},
	},
	{
		['name']=0x10130055,
		['showname']='风语者-战吼加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='战吼',
				['触发时机']={
t =
{'$逻辑_随从战吼','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从战吼",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130056},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680726)
end
,
},
			},
		},
	},
	{
		['name']=0x10130058,
		['showname']='火元素-战吼伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='战吼',
				['触发时机']={
t =
{'$逻辑_随从战吼','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从战吼",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_随从伤害',3},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_随从伤害",3)
end
,
},
			},
		},
	},
	{
		['name']=0x10130047,
		['showname']='瘟疫使者-战吼添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='战吼',
				['触发时机']={
t =
{'$逻辑_随从战吼','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从战吼",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130048},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680712)
end
,
},
			},
		},
	},
	{
		['name']=0x10130033,
		['showname']='列王守卫-战吼回血',
		['逻辑功能']={
			[1]={
				['注册时机']='战吼',
				['触发时机']={
t =
{'$逻辑_随从战吼','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从战吼",card}
end
,
},
				['触发逻辑']={
t =
{
    {
        'function',
        {'player'},
        {
            {
                'hero',
                {'角色_战场_获取英雄','player'}
            }
        },
        {
            'block',
            {
                '技能目标_添加目标',
                {'table','hero'}
            },
            {'技能效果_随从治疗',6}
        }
    },
    'info.Player'
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function(player_38)
		local hero_89 = G.call("角色_战场_获取英雄",player_38)
		return (function()
			local _ = nil
			_ = G.call("技能目标_添加目标",{hero_89})
			_ = G.call("技能效果_随从治疗",6)
			return _
		end)()
	end)(info.Player)
end
,
},
			},
		},
	},
	{
		['name']=0x10130026,
		['showname']='保护之手-添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130027},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680679)
end
,
},
			},
		},
	},
	{
		['name']=0x10130040,
		['showname']='神圣之灵-添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130041},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680705)
end
,
},
			},
		},
	},
	{
		['name']=0x10130043,
		['showname']='致命药膏-添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取武器','$我方'},
    {'技能效果_添加BUFF',0x10130044}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取武器","我方")
		_ = G.call("技能效果_添加BUFF",269680708)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130028,
		['showname']='力量祝福-添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130029},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680681)
end
,
},
			},
		},
	},
	{
		['name']=0x10130030,
		['showname']='王者祝福-添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130031},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680689)
end
,
},
			},
		},
	},
	{
		['name']=0x1013002b,
		['showname']='谦逊-添加buff',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x1013002c},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_添加BUFF",269680684)
end
,
},
			},
		},
	},
	{
		['name']=0x10130012,
		['showname']='动物伙伴-招1',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_召唤',
    {
        {
            '$我方',
            '$末尾',
            {'卡牌随机库_获取ID',0x10140001,true}
        }
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_召唤",{{"我方","末尾",G.call("卡牌随机库_获取ID",269746177,true)}})
end
,
},
			},
		},
	},
	{
		['name']=0x10130034,
		['showname']='援军-召唤',
		['postfix']='英雄技能',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_英雄技能使用','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_英雄技能使用",card}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_召唤',
    {
        {'$我方','$末尾',0x10060035}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_召唤",{{"我方","末尾",268828725}})
end
,
},
			},
		},
	},
	{
		['name']=0x1013004c,
		['showname']='匕首精通-装备武器',
		['postfix']='英雄技能',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_英雄技能使用','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_英雄技能使用",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_装备武器',0x1006004c},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_装备武器",268828748)
end
,
},
			},
		},
	},
	{
		['name']=0x10130059,
		['showname']='图腾召唤-召唤随从',
		['postfix']='英雄技能',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_英雄技能使用','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_英雄技能使用",card}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_召唤',
    {
        {
            '$我方',
            '$末尾',
            {'卡牌随机库_获取ID',0x10140002,true}
        }
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_召唤",{{"我方","末尾",G.call("卡牌随机库_获取ID",269746178,true)}})
end
,
},
			},
		},
	},
	{
		['name']=0x10130014,
		['showname']='杀戮命令-伤害',
		['目标筛选']={n=8,[1] = '卡牌条件_目标通用过滤器',
			[3]='我方',
			[4]={
				[1]=0x10090004,
			},
			[5]={
				[1]='战场',
			},
			[6]={
				[1]=0x100a0006,
			},
		},
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{
    'if',
    {
        '>',
        {'卡牌数据_获取过滤后数量','self','card'},
        0
    },
    {'技能效果_法术伤害',5},
    {'技能效果_法术伤害',3}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function ()
		if(t["tLua_GT"](G.call("卡牌数据_获取过滤后数量",self,card),0))then
			return G.call("技能效果_法术伤害",5)
		else
			return G.call("技能效果_法术伤害",3)
		end
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130015,
		['showname']='多重射击-俩目标伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取随从','$敌方1'},
    {'技能目标_随机选择',2,0x100c0002},
    {'技能效果_法术伤害',3}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","敌方1")
		_ = G.call("技能目标_随机选择",2,269221890)
		_ = G.call("技能效果_法术伤害",3)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013000f,
		['showname']='森林狼-光环',
		['技能类型']={
			[1]='光环',
		},
		['目标筛选']={n=8,[1] = '卡牌条件_目标通用过滤器',
			[3]='我方',
			[4]={
				[1]=0x10090004,
			},
			[5]={
				[1]='战场',
			},
			[6]={
				[1]=0x100a0006,
			},
			[9]=true,
		},
		['逻辑功能']={
			[1]={
				['注册时机']='上场',
				['触发时机']={
t =
{'$逻辑_随从上场','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从上场",card}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_战场光环',
    'self',
    'card',
    {
        'function',
        {},
        {},
        {'技能效果_攻击',1}
    },
    {
        'function',
        {},
        {},
        {'技能效果_攻击',-1}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_战场光环",self,card,(function()
		return G.call("技能效果_攻击",1)
	end),(function()
		return G.call("技能效果_攻击",-1)
	end))
end
,
},
			},
		},
	},
	{
		['name']=0x10130013,
		['showname']='雷欧克-光环',
		['技能类型']={
			[1]='光环',
		},
		['目标筛选']={n=8,[1] = '卡牌条件_目标通用过滤器',
			[3]='我方',
			[4]={
				[1]=0x10090004,
			},
			[5]={
				[1]='战场',
			},
			[9]=true,
		},
		['逻辑功能']={
			[1]={
				['注册时机']='上场',
				['触发时机']={
t =
{'$逻辑_随从上场','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从上场",card}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_战场光环',
    'self',
    'card',
    {
        'function',
        {},
        {},
        {'技能效果_攻击',1}
    },
    {
        'function',
        {},
        {},
        {'技能效果_攻击',-1}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_战场光环",self,card,(function()
		return G.call("技能效果_攻击",1)
	end),(function()
		return G.call("技能效果_攻击",-1)
	end))
end
,
},
			},
		},
	},
	{
		['name']=0x1013000d,
		['showname']='变形-护甲、本回合攻击',
		['postfix']='英雄技能',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_英雄技能使用','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_英雄技能使用",card}
end
,
},
				['触发逻辑']={
t =
{
    'block',
    {'技能目标_选取英雄','$我方'},
    {'技能效果_护甲',1},
    {'技能效果_本回合攻击',1}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取英雄","我方")
		_ = G.call("技能效果_护甲",1)
		_ = G.call("技能效果_本回合攻击",1)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013000c,
		['showname']='法力过剩-抽牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_抽牌'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_抽牌")
end
,
},
			},
		},
	},
	{
		['name']=0x10130021,
		['showname']='奥术智慧-抽2牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能效果_抽牌'},
    {'技能效果_抽牌'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_抽牌")
		_ = G.call("技能效果_抽牌")
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130022,
		['showname']='变形术-变形',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_变形',0x10060073,false},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_变形",268828787,false)
end
,
},
			},
		},
	},
	{
		['name']=0x10130054,
		['showname']='妖术-变形',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_变形',0x10060054,false},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_变形",268828756,false)
end
,
},
			},
		},
	},
	{
		['name']=0x1013000b,
		['showname']='幸运币-本回合水晶',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_本回合当前水晶',1},
lua = function (self, card, info, data)
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
		['name']=0x10130001,
		['showname']='月火术-伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_法术伤害',1},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法术伤害",1)
end
,
},
			},
		},
	},
	{
		['name']=0x1013005a,
		['showname']='牺牲契约-消灭恶魔,回血',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{
    'map',
    {
        'function',
        {'tar'},
        {},
        {
            'block',
            {
                '技能效果_效果树_执行子效果',
                {
                    ['Player'] = 'info.Player',
                    ['Target'] = {'table','tar'}
                },
                {
                    'function',
                    {},
                    {},
                    {'技能效果_消灭目标'}
                }
            },
            {
                '技能效果_效果树_执行子效果',
                {
                    ['Player'] = 'info.Player'
                },
                {
                    'function',
                    {},
                    {},
                    {
                        'block',
                        {'技能目标_选取英雄','$我方'},
                        {'技能效果_法术治疗',5}
                    }
                }
            }
        }
    },
    'info.Target'
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return t["tLua_MAP"]((function(tar_49)
		return (function()
			local _ = nil
			_ = G.call("技能效果_效果树_执行子效果",{["Player"] = info.Player,["Target"] = {tar_49}},(function()
				return G.call("技能效果_消灭目标")
			end))
			_ = G.call("技能效果_效果树_执行子效果",{["Player"] = info.Player},(function()
				return (function()
					local _ = nil
					_ = G.call("技能目标_选取英雄","我方")
					_ = G.call("技能效果_法术治疗",5)
					return _
				end)()
			end))
			return _
		end)()
	end),info.Target)
end
,
},
			},
		},
	},
	{
		['name']=0x1013005c,
		['showname']='死亡缠绕-伤害,击杀抽牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{
    'map',
    {
        'function',
        {'tar'},
        {},
        {
            '技能效果_效果树_执行子效果',
            {
                ['Caster'] = 'card',
                ['Player'] = 'info.Player',
                ['Target'] = {'table','tar'}
            },
            {
                'function',
                {},
                {},
                {
                    'block',
                    {'技能效果_法术伤害',1},
                    {
                        'if',
                        true,
                        {'技能效果_抽牌'}
                    }
                }
            }
        }
    },
    'info.Target'
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return t["tLua_MAP"]((function(tar_49)
		return G.call("技能效果_效果树_执行子效果",{["Caster"] = card,["Player"] = info.Player,["Target"] = {tar_49}},(function()
			return (function()
				local _ = nil
				_ = G.call("技能效果_法术伤害",1)
				_ = (function ()
					if(true)then
						return G.call("技能效果_抽牌")
					end
				end)()
				return _
			end)()
		end))
	end),info.Target)
end
,
},
			},
		},
	},
	{
		['name']=0x10130023,
		['showname']='火球术-伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_法术伤害',6},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法术伤害",6)
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
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_本回合当前水晶',1},
lua = function (self, card, info, data)
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
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130005},
lua = function (self, card, info, data)
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
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_法术治疗',8},
lua = function (self, card, info, data)
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
		['name']=0x1013002d,
		['showname']='圣光术-治疗',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_法术治疗',6},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法术治疗",6)
end
,
},
			},
		},
	},
	{
		['name']=0x10130032,
		['showname']='真银圣剑-攻击回血',
		['技能类型']={
			[1]='被动',
		},
		['逻辑功能']={
			[1]={
				['注册时机']='上场',
				['是否重复触发']=true,
				['触发时机']={
t =
{'$逻辑_卡牌攻击前'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_卡牌攻击前"}
end
,
},
				['触发条件']={
t =
{
    {
        'function',
        {'player','caster'},
        {
            {
                'hero',
                {'角色_战场_获取英雄','player'}
            }
        },
        {'==','caster','hero'}
    },
    'info.Player',
    'info.Caster'
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function(player_38,caster_47)
		local hero_98 = G.call("角色_战场_获取英雄",player_38)
		return t["tLua_EQUAL"](caster_47,hero_98)
	end)(info.Player,info.Caster)
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_效果树_执行子效果',
    {
        ['Caster'] = 'card',
        ['Player'] = 'info.Player',
        ['Target'] = {'table','info.Caster'}
    },
    {
        'function',
        {},
        {},
        {'技能效果_武器治疗',2}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_效果树_执行子效果",{["Caster"] = card,["Player"] = info.Player,["Target"] = {info.Caster}},(function()
		return G.call("技能效果_武器治疗",2)
	end))
end
,
},
			},
		},
	},
	{
		['name']=0x10130008,
		['showname']='野性成长-最大水晶',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{
    {
        'function',
        {},
        {
            {
                'max_mana',
                {'角色_获取水晶数据','$我方','$最大值'}
            }
        },
        {
            'if',
            {'<','max_mana',10},
            {'技能效果_最大水晶',1},
            {'技能效果_创建手牌',0x1006000d,true}
        }
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local max_mana_81 = G.call("角色_获取水晶数据","我方","最大值")
		return (function ()
			if(t["tLua_LT"](max_mana_81,10))then
				return G.call("技能效果_最大水晶",1)
			else
				return G.call("技能效果_创建手牌",268828685,true)
			end
		end)()
	end)()
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
lua = function (self, card, info, data)
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
    {'技能目标_选取随从','$我方'},
    {'技能目标_选取英雄','$我方'},
    {'技能效果_本回合攻击',2}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","我方")
		_ = G.call("技能目标_选取英雄","我方")
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
		['name']=0x10130057,
		['showname']='嗜血-本回合攻击',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取随从','$我方'},
    {'技能效果_本回合攻击',3}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","我方")
		_ = G.call("技能效果_本回合攻击",3)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130051,
		['showname']='石化武器-本回合攻击',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_本回合攻击',3},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_本回合攻击",3)
end
,
},
			},
		},
	},
	{
		['name']=0x10130009,
		['showname']='横扫-主副伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能效果_法术伤害',4},
    {
        '技能效果_效果树_执行子效果',
        {
            ['Caster'] = 'info.Caster',
            ['Player'] = 'info.Player'
        },
        {
            'function',
            {},
            {},
            {
                'block',
                {'技能目标_选取英雄','$敌方1'},
                {'技能目标_选取随从','$敌方1'},
                {'技能目标_剔除目标','info.Target'},
                {'技能效果_法术伤害',1}
            }
        }
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_法术伤害",4)
		_ = G.call("技能效果_效果树_执行子效果",{["Caster"] = info.Caster,["Player"] = info.Player},(function()
			return (function()
				local _ = nil
				_ = G.call("技能目标_选取英雄","敌方1")
				_ = G.call("技能目标_选取随从","敌方1")
				_ = G.call("技能目标_剔除目标",info.Target)
				_ = G.call("技能效果_法术伤害",1)
				return _
			end)()
		end))
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013001f,
		['showname']='魔爆术-群体伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取随从','$敌方1'},
    {'技能效果_法术伤害',1}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","敌方1")
		_ = G.call("技能效果_法术伤害",1)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013002e,
		['showname']='奉献-群体伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取英雄','$敌方1'},
    {'技能目标_选取随从','$敌方1'},
    {'技能效果_法术伤害',2}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取英雄","敌方1")
		_ = G.call("技能目标_选取随从","敌方1")
		_ = G.call("技能效果_法术伤害",2)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130024,
		['showname']='烈焰风暴-群体伤害',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取随从','$敌方1'},
    {'技能效果_法术伤害',4}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","敌方1")
		_ = G.call("技能效果_法术伤害",4)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130020,
		['showname']='冰霜新星-群体冻结',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取随从','$敌方1'},
    {
        '技能效果_特性',
        {'$冻结'}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","敌方1")
		_ = G.call("技能效果_特性",{"冻结"})
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013000a,
		['showname']='星火术-伤害、抽牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能效果_法术伤害',5},
    {'技能效果_抽牌'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_法术伤害",5)
		_ = G.call("技能效果_抽牌")
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
		['postfix']='+2/+2，嘲讽',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
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
    {'技能效果_生命上限',2},
    {'技能效果_攻击',2},
    {
        '技能效果_特性',
        {'$嘲讽'}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_生命上限",2)
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
		['name']=0x10130016,
		['showname']='猎人印记-buff',
		['postfix']='生命上限变1',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{'技能效果_设置生命上限',1},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_设置生命上限",1)
end
,
},
			},
		},
	},
	{
		['name']=0x10130018,
		['showname']='驯兽师-buff',
		['postfix']='+2/+2，嘲讽',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
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
    {'技能效果_生命上限',2},
    {'技能效果_攻击',2},
    {
        '技能效果_特性',
        {'$嘲讽'}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_生命上限",2)
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
		['name']=0x10130027,
		['showname']='保护之手-buff',
		['postfix']='圣盾',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_特性',
    {'$圣盾'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_特性",{"圣盾"})
end
,
},
			},
		},
	},
	{
		['name']=0x10130041,
		['showname']='神圣之灵-buff',
		['postfix']='生命翻倍',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{
    'map',
    {
        'function',
        {'tar'},
        {
            {
                'hp',
                {'卡牌属性_获取','tar','$生命','$当前值'}
            }
        },
        {
            '技能效果_效果树_执行子效果',
            {
                ['Player'] = 'info.Player',
                ['Target'] = {'table','tar'}
            },
            {
                'function',
                {},
                {},
                {'技能效果_生命上限','hp'}
            }
        }
    },
    'info.Target'
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return t["tLua_MAP"]((function(tar_49)
		local hp_97 = G.call("卡牌属性_获取",tar_49,"生命","当前值")
		return G.call("技能效果_效果树_执行子效果",{["Player"] = info.Player,["Target"] = {tar_49}},(function()
			return G.call("技能效果_生命上限",hp_97)
		end))
	end),info.Target)
end
,
},
			},
		},
	},
	{
		['name']=0x10130044,
		['showname']='致命药膏-buff',
		['postfix']='攻击+2',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{'技能效果_攻击',2},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_攻击",2)
end
,
},
			},
		},
	},
	{
		['name']=0x10130048,
		['showname']='瘟疫使者-buff',
		['postfix']='剧毒',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_特性',
    {'$剧毒'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_特性",{"剧毒"})
end
,
},
			},
		},
	},
	{
		['name']=0x1013004f,
		['showname']='图腾之力-buff',
		['postfix']='生命+2',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{'技能效果_生命上限',2},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_生命上限",2)
end
,
},
			},
		},
	},
	{
		['name']=0x10130053,
		['showname']='风怒-buff',
		['postfix']='风怒',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_特性',
    {'$风怒'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_特性",{"风怒"})
end
,
},
			},
		},
	},
	{
		['name']=0x10130056,
		['showname']='风语者-buff',
		['postfix']='风怒',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_特性',
    {'$风怒'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_特性",{"风怒"})
end
,
},
			},
		},
	},
	{
		['name']=0x10130029,
		['showname']='力量祝福-buff',
		['postfix']='攻击+3',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{'技能效果_攻击',3},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_攻击",3)
end
,
},
			},
		},
	},
	{
		['name']=0x10130031,
		['showname']='王者祝福-buff',
		['postfix']='+4/+4',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
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
    {'技能效果_生命上限',4},
    {'技能效果_攻击',4}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_生命上限",4)
		_ = G.call("技能效果_攻击",4)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013002c,
		['showname']='谦逊-buff',
		['postfix']='攻击变1',
		['逻辑功能']={
			[1]={
				['注册时机']='添加',
				['触发时机']={
t =
{'$逻辑_技能添加','nil','self'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{'技能效果_设置攻击力',1},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_设置攻击力",1)
end
,
},
			},
		},
	},
	{
		['name']=0x10130019,
		['showname']='苔原犀牛-冲锋光环',
		['技能类型']={
			[1]='光环',
		},
		['目标筛选']={n=8,[1] = '卡牌条件_目标通用过滤器',
			[3]='我方',
			[4]={
				[1]=0x10090004,
			},
			[5]={
				[1]='战场',
			},
			[6]={
				[1]=0x100a0006,
			},
		},
		['逻辑功能']={
			[1]={
				['注册时机']='上场',
				['触发时机']={
t =
{'$逻辑_随从上场','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从上场",card}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_战场光环',
    'self',
    'card',
    {
        'function',
        {},
        {},
        {
            '技能效果_特性',
            {'$冲锋'}
        }
    },
    {
        'function',
        {},
        {},
        {
            '技能效果_特性',
            'nil',
            'nil',
            {'$冲锋'}
        }
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_战场光环",self,card,(function()
		return G.call("技能效果_特性",{"冲锋"})
	end),(function()
		return G.call("技能效果_特性",nil,nil,{"冲锋"})
	end))
end
,
},
			},
		},
	},
	{
		['name']=0x1013005b,
		['showname']='火舌图腾-相邻攻击',
		['postfix']='+2攻击',
		['技能类型']={
			[1]='光环',
		},
		['目标筛选']={n=8,[1] = '卡牌条件_目标通用过滤器',
			[3]='我方',
			[4]={
				[1]=0x10090004,
			},
			[5]={
				[1]='相邻',
			},
			[9]=true,
		},
		['逻辑功能']={
			[1]={
				['注册时机']='上场',
				['触发时机']={
t =
{'$逻辑_随从上场','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从上场",card}
end
,
},
				['触发逻辑']={
t =
{
    '技能效果_战场光环',
    'self',
    'card',
    {
        'function',
        {},
        {},
        {'技能效果_攻击',2}
    },
    {
        'function',
        {},
        {},
        {'技能效果_攻击',-2}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_战场光环",self,card,(function()
		return G.call("技能效果_攻击",2)
	end),(function()
		return G.call("技能效果_攻击",-2)
	end))
end
,
},
			},
		},
	},
	{
		['name']=0x1013001a,
		['showname']='饥饿的秃鹫-招野兽抽牌',
		['技能类型']={
			[1]='被动',
		},
		['目标筛选']={n=8,[1] = '卡牌条件_目标通用过滤器',
			[3]='我方',
			[4]={
				[1]=0x10090004,
			},
			[5]={
				[1]='战场',
			},
			[6]={
				[1]=0x100a0006,
			},
			[9]=true,
		},
		['逻辑功能']={
			[1]={
				['注册时机']='上场',
				['是否重复触发']=true,
				['触发时机']={
t =
{'$逻辑_随从召唤'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从召唤"}
end
,
},
				['触发逻辑']={
t =
{
    'if',
    {
        'apply',
        {'卡牌数据_制作过滤器','self','card'},
        'info.Caster'
    },
    {'技能效果_抽牌'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function ()
		if(G.call(G.call("卡牌数据_制作过滤器",self,card),info.Caster))then
			return G.call("技能效果_抽牌")
		end
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130035,
		['showname']='北郡牧师-治疗抽牌',
		['技能类型']={
			[1]='被动',
		},
		['目标筛选']={n=8,[1] = '卡牌条件_目标通用过滤器',
			[3]='我方',
			[4]={
				[1]=0x10090004,
			},
			[5]={
				[1]='战场',
			},
		},
		['逻辑功能']={
			[1]={
				['注册时机']='上场',
				['是否重复触发']=true,
				['触发时机']={
t =
{'$逻辑_卡牌造成治疗'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_卡牌造成治疗"}
end
,
},
				['触发逻辑']={
t =
{
    'if',
    {
        'apply',
        {'卡牌数据_制作过滤器','self','card'},
        'info.逐个治疗目标'
    },
    {'技能效果_抽牌'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function ()
		if(G.call(G.call("卡牌数据_制作过滤器",self,card),info.逐个治疗目标))then
			return G.call("技能效果_抽牌")
		end
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x10130025,
		['showname']='冻结-随从攻击',
		['技能类型']={
			[1]='被动',
		},
		['逻辑功能']={
			[1]={
				['注册时机']='上场',
				['是否重复触发']=true,
				['触发时机']={
t =
{'$逻辑_卡牌造成伤害','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_卡牌造成伤害",card}
end
,
},
				['触发逻辑']={
t =
{
    'block',
    {'技能目标_添加目标','info.逐个伤害目标'},
    {
        '技能效果_特性',
        {'$冻结'}
    }
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_添加目标",info.逐个伤害目标)
		_ = G.call("技能效果_特性",{"冻结"})
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
lua = function (self, card, info, data)
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
    {'技能目标_选取英雄','$我方'},
    {'技能效果_护甲',2},
    {'技能效果_本回合攻击',2}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取英雄","我方")
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
	{
		['name']=0x10130036,
		['showname']='圣光闪耀-治疗英雄',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能目标_选取英雄','$我方'},
    {'技能效果_法术治疗',5}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取英雄","我方")
		_ = G.call("技能效果_法术治疗",5)
		return _
	end)()
end
,
},
			},
		},
	},
	{
		['name']=0x1013003d,
		['showname']='心灵视界-脏牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_牧师脏牌',1,'$手牌'},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_牧师脏牌",1,"手牌")
end
,
},
			},
		},
	},
	{
		['name']=0x10130037,
		['showname']='真言术：盾-加血,抽牌',
		['逻辑功能']={
			[1]={
				['注册时机']='生效',
				['触发时机']={
t =
{'$逻辑_法术牌打出','card'},
lua = function (self, card, info, data)
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
    {'技能效果_生命上限',2},
    {'技能效果_抽牌'}
},
lua = function (self, card, info, data)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_生命上限",2)
		_ = G.call("技能效果_抽牌")
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