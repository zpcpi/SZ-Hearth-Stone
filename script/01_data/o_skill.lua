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
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_法伤伤害',2},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法伤伤害",2)
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
    {'技能效果_法伤伤害',3},
    {
        '技能效果_特性',
        {'$冻结'}
    }
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_法伤伤害",3)
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
		['name']=0x1013001c,
		['showname']='奥术飞弹-随机打三个',
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
lua = function (self, info, card)
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
    '技能效果_召唤',
    {
        {'$我方','$末尾',0x10060029},
        {'$我方','$末尾',0x10060029}
    }
},
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
		['name']=0x10130010,
		['showname']='追踪术-牌库3选1',
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
{'技能效果_追踪术',3},
lua = function (self, info, card)
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
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130016},
lua = function (self, info, card)
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
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return {"逻辑_随从战吼",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_添加BUFF',0x10130018},
lua = function (self, info, card)
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
		['name']=0x10130026,
		['showname']='保护之手-添加buff',
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
{'技能效果_添加BUFF',0x10130027},
lua = function (self, info, card)
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
		['name']=0x10130012,
		['showname']='动物伙伴-招1',
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
    '技能效果_召唤',
    {
        {
            '$我方',
            '$末尾',
            {'卡牌随机库_获取ID',0x10140001,true}
        }
    }
},
lua = function (self, info, card)
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
    'if',
    {
        '>',
        {'卡牌数据_获取过滤后数量','self','card'},
        0
    },
    {'技能效果_法伤伤害',5},
    {'技能效果_法伤伤害',3}
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function ()
		if(t["tLua_GT"](G.call("卡牌数据_获取过滤后数量",self,card),0))then
			return G.call("技能效果_法伤伤害",5)
		else
			return G.call("技能效果_法伤伤害",3)
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
    {'技能目标_选取随从','$敌方1'},
    {'技能目标_随机选择',2,0x100c0002},
    {'技能效果_法伤伤害',3}
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","敌方1")
		_ = G.call("技能目标_随机选择",2,269221890)
		_ = G.call("技能效果_法伤伤害",3)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_抽牌'},
lua = function (self, info, card)
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
    {'技能效果_抽牌'},
    {'技能效果_抽牌'}
},
lua = function (self, info, card)
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
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return {"逻辑_法术牌打出",card}
end
,
},
				['触发逻辑']={
t =
{'技能效果_变形',0x10060073,false},
lua = function (self, info, card)
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
		['name']=0x1013000b,
		['showname']='幸运币-本回合水晶',
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
		['name']=0x10130023,
		['showname']='火球术-伤害',
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
{'技能效果_法伤伤害',6},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return G.call("技能效果_法伤伤害",6)
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
		['name']=0x10130008,
		['showname']='野性成长-最大水晶',
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
lua = function (self, info, card)
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
    {'技能目标_选取随从','$我方'},
    {'技能目标_选取英雄','$我方'},
    {'技能效果_本回合攻击',2}
},
lua = function (self, info, card)
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
		['name']=0x10130009,
		['showname']='横扫-主副伤害',
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
    {'技能效果_法伤伤害',4},
    {
        '技能效果_效果树_执行子效果',
        {
            ['Caster'] = 'info.Caster',
            ['Player'] = 'info.Player',
            ['Stack'] = 'info.Stack'
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
                {'技能效果_法伤伤害',1}
            }
        }
    }
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_法伤伤害",4)
		_ = G.call("技能效果_效果树_执行子效果",{["Caster"] = info.Caster,["Player"] = info.Player,["Stack"] = info.Stack},(function()
			return (function()
				local _ = nil
				_ = G.call("技能目标_选取英雄","敌方1")
				_ = G.call("技能目标_选取随从","敌方1")
				_ = G.call("技能目标_剔除目标",info.Target)
				_ = G.call("技能效果_法伤伤害",1)
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
    {'技能目标_选取随从','$敌方1'},
    {'技能效果_法伤伤害',1}
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","敌方1")
		_ = G.call("技能效果_法伤伤害",1)
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
    {'技能目标_选取随从','$敌方1'},
    {'技能效果_法伤伤害',4}
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能目标_选取随从","敌方1")
		_ = G.call("技能效果_法伤伤害",4)
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
    {'技能目标_选取随从','$敌方1'},
    {
        '技能效果_特性',
        {'$冻结'}
    }
},
lua = function (self, info, card)
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
    {'技能效果_法伤伤害',5},
    {'技能效果_抽牌'}
},
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return (function()
		local _ = nil
		_ = G.call("技能效果_法伤伤害",5)
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
    {'技能效果_生命上限',2},
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
lua = function (self, info, card)
	local G = require "gf"
	local t = G.api
	return {"逻辑_技能添加",nil,self}
end
,
},
				['触发逻辑']={
t =
{'技能效果_设置生命上限',1},
lua = function (self, info, card)
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
    {'技能效果_生命上限',2},
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
    '技能效果_特性',
    {'$圣盾'}
},
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
lua = function (self, info, card)
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
    {'技能目标_选取英雄','$我方'},
    {'技能效果_护甲',2},
    {'技能效果_本回合攻击',2}
},
lua = function (self, info, card)
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
}}
return t