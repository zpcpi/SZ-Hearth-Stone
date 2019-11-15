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
		['name']='UI_鼠标切换站位',
		['arg']={
			[1]={
				['id']='Index',
				['type']='int',
			},
		},
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