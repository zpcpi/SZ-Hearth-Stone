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
		['name']='逻辑_技能效果_最大水晶变化',
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
		['name']='逻辑_技能效果_当前生命变化',
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
		['name']='逻辑_技能效果_创建手牌',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_召唤单位',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_牌库抽牌',
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
		['name']='逻辑_随从召唤',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_武器装备',
		['arg']={
			[1]={
				['id']='Weapon',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_武器摧毁',
		['arg']={
			[1]={
				['id']='Weapon',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_卡牌上场',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_随从上场',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_武器上场',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_随从战吼',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_武器战吼',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
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
		['name']='逻辑_随从牌打出',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑关键词_亡语',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑关键词_战吼',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑关键词_复生',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能删除',
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
		['name']='逻辑_英雄技能使用',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_卡牌死亡',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
		},
	},
	{
		['name']='逻辑_卡牌属性设置',
		['postfix']='临时属性将不再删除',
		['arg']={
			[1]={
				['id']='Target',
				['type']='o_card',
			},
			[2]={
				['id']='属性',
				['type']='estr_cardattr_enum',
			},
		},
	},
	{
		['name']='逻辑_卡牌特性设置',
		['arg']={
			[1]={
				['id']='Target',
				['type']='o_card',
			},
			[2]={
				['id']='添加属性',
				['type']='string',
			},
		},
	},
	{
		['name']='逻辑_卡牌特性删除',
		['arg']={
			[1]={
				['id']='Target',
				['type']='o_card',
			},
			[2]={
				['id']='删除属性',
				['type']='string',
			},
		},
	},
	{
		['name']='逻辑_卡牌造成伤害',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
			[2]={
				['id']='Target',
				['type']='o_card',
			},
			[3]={
				['id']='伤害值',
				['type']='int',
			},		},
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
		['name']='逻辑_卡牌使用',
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
		['name']='逻辑_技能效果_英雄技能伤害',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_法术治疗',
		['arg']={
			[1]={
				['id']='效果信息',
				['type']='o_skill_info',
			},
		},
	},
	{
		['name']='逻辑_技能效果_直接治疗',
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
		['name']='流程_回合结束',
		['arg']={
			[1]={
				['id']='Player',
				['type']='estr_absolute_id_type',
			},
		},
	},
	{
		['name']='流程_回合开始',
		['arg']={
			[1]={
				['id']='Player',
				['type']='estr_absolute_id_type',
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
		['name']='UI_抓取卡牌_选择界面',
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
		['name']='UI_抓取卡牌_英雄技能',
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
		['name']='UI_发现选择完毕',
		['arg']={
			[1]={
				['id']='Order',
				['type']='o_order_info',
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
		['name']='逻辑_卡牌属性更新',
		['arg']={
			[1]={
				['id']='Caster',
				['type']='o_card',
			},
			[2]={
				['id']='Attr',
				['type']='estr_cardattr_enum',
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
				['type']='o_card_卡牌',
			},
		},
	},
}}
return t