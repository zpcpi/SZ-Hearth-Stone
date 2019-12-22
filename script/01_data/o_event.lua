--[[1f04

]]
local t = {
'o_event',
{
	{
		['name']='作弊指令',
		['arg']={
			[1]={
				['id']='指令',
				['type']='string',
			},
		},
	},
	{
		['name']='逻辑_卡牌使用_消耗法力前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前水晶变化前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前攻击变化前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前护甲变化前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前特性变化前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前特性变化',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前生命变化前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前生命变化',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_添加Buff前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_添加Buff',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前护甲变化',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前攻击变化',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_当前水晶变化',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_卡牌初始化',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_卡牌上手前',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_卡牌上手',
		['postfix']='抽到',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_卡牌上场前',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_卡牌上场',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_技能添加前',
		['arg']={
			[1]={
				['id']='Target',
				['type']='o_card',
			},
			[2]={
				['id']='Skill',
				['type']='o_skill',
			},
		},
	},
	{
		['name']='逻辑_技能添加',
		['postfix']='加buff',
		['arg']={
			[1]={
				['id']='Target',
				['type']='o_card',
			},
			[2]={
				['id']='Skill',
				['type']='o_skill',
			},
		},
	},
	{
		['name']='逻辑_法术牌打出',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_卡牌使用_消耗法力',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_卡牌使用前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_卡牌使用',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_卡牌生效前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_Buff生效前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_Buff生效',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_卡牌生效',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_法伤伤害前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_攻击伤害前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_反击伤害前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_反击伤害',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_攻击伤害',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_卡牌攻击前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_卡牌攻击',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_法伤伤害',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_直接伤害前',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_直接伤害',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='UI_抓取卡牌',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
			[2]={
				['id']='CasterObj',
				['type']='any',
			},
		},
	},
	{
		['name']='UI_抓取卡牌_战场',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
			[2]={
				['id']='CasterObj',
				['type']='any',
			},
		},
	},
	{
		['name']='UI_卡牌选择目标',
		['arg']={
			[1]={
				['id']='Target',
				['type']='o_card',
			},
			[2]={
				['id']='TargetObj',
				['type']='any',
			},
		},
	},
	{
		['name']='UI_发现选择卡牌',
		['arg']={
			[1]={
				['id']='Select',
				['type']='o_card',
			},
		},
	},
	{
		['name']='UI_卡牌确认使用',
		['arg']={
			[1]={
				['id']='Side',
				['type']='estr_side',
			},
		},
	},
	{
		['name']='UI_取消操作',
	},
	{
		['name']='UI_鼠标覆盖卡牌',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='UI_鼠标离开卡牌',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='UI_鼠标进入功能区',
	},
	{
		['name']='UI_鼠标进入手牌区',
	},
	{
		['name']='UI_卡牌属性更新',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
			[2]={
				['id']='Attr',
				['type']='estr_cardattr_enum',
			},
			[3]={
				['id']='Value',
				['type']='int',
			},
		},
	},
	{
		['name']='UI_鼠标切换站位',
		['arg']={
			[1]={
				['id']='Index',
				['type']='int',
			},
		},
	},
	{
		['name']='UI_牌库更新',
	},
	{
		['name']='卡牌实例_信息更新',
		['arg']={
			[1]={
				['id']='卡牌id',
				['type']='i_card_卡牌',
			},
		},
	},
}}
return t