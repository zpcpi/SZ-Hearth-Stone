--[[1008

]]
local t = {
'o_profession',
{
	{
		['name']=0x10080002,
		['showname']='德鲁伊',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x56040004,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x56060008,
		['法术卡边框']=0x56090008,
		['武器卡边框']=0x560a0007,
		['奥秘卡边框']=0x56080002,
		['职业图标']=0x560d0008,
	},
	{
		['name']=0x10080003,
		['showname']='猎人',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x5604000a,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x5606000e,
		['法术卡边框']=0x5609000e,
		['武器卡边框']=0x560a000e,
		['奥秘卡边框']=0x56080005,
		['职业图标']=0x560d0009,
	},
	{
		['name']=0x10080004,
		['showname']='法师',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x56040007,
		['英雄技能边框']=0x5605000e,
		['随从卡边框']=0x5606000b,
		['法术卡边框']=0x5609000b,
		['武器卡边框']=0x560a000b,
		['奥秘卡边框']=0x56080003,
		['职业图标']=0x560d0001,
	},
	{
		['name']=0x10080005,
		['showname']='圣骑士',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x56040003,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x56060007,
		['法术卡边框']=0x56090007,
		['武器卡边框']=0x560a0006,
		['奥秘卡边框']=0x56080001,
		['职业图标']=0x560d0002,
	},
	{
		['name']=0x10080006,
		['showname']='牧师',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x56040009,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x5606000d,
		['法术卡边框']=0x5609000d,
		['武器卡边框']=0x560a000d,
		['奥秘卡边框']=0x56080002,
		['职业图标']=0x560d0003,
	},
	{
		['name']=0x10080007,
		['showname']='潜行者',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x56040008,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x5606000c,
		['法术卡边框']=0x5609000c,
		['武器卡边框']=0x560a000c,
		['奥秘卡边框']=0x56080004,
		['职业图标']=0x560d0004,
	},
	{
		['name']=0x10080008,
		['showname']='萨满祭司',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x5604000c,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x56060010,
		['法术卡边框']=0x56090010,
		['武器卡边框']=0x560a0010,
		['奥秘卡边框']=0x56080002,
		['职业图标']=0x560d0005,
	},
	{
		['name']=0x10080009,
		['showname']='术士',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x56040006,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x56060005,
		['法术卡边框']=0x5609000a,
		['武器卡边框']=0x560a0009,
		['奥秘卡边框']=0x56080002,
		['职业图标']=0x560d0006,
	},
	{
		['name']=0x1008000a,
		['showname']='战士',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x56040005,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x56060009,
		['法术卡边框']=0x56090009,
		['武器卡边框']=0x560a0008,
		['奥秘卡边框']=0x56080002,
		['职业图标']=0x560d0007,
	},
	{
		['name']=0x1008000b,
		['showname']='死亡骑士',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x5604000f,
		['英雄技能边框']=0x5605000e,
		['随从卡边框']=0x5606000a,
		['法术卡边框']=0x56090004,
		['武器卡边框']=0x560a000a,
		['奥秘卡边框']=0x56080002,
		['是否可选']=false,
	},
	{
		['name']=0x1008000c,
		['showname']='玉莲帮',
		['postfix']='德鲁伊、潜行者、萨满祭司',
		['子职业']={
			[1]=0x10080002,
			[2]=0x10080007,
			[3]=0x10080008,
		},
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x5604000e,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x56060001,
		['法术卡边框']=0x56090001,
		['武器卡边框']=0x560a0002,
		['奥秘卡边框']=0x56080002,
		['阵营边框']=0x56070009,
		['是否可选']=false,
	},
	{
		['name']=0x1008000d,
		['showname']='污手党',
		['postfix']='猎人、圣骑士、战士',
		['子职业']={
			[1]=0x10080003,
			[2]=0x10080005,
			[3]=0x1008000a,
		},
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x5604000e,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x56060001,
		['法术卡边框']=0x56090001,
		['武器卡边框']=0x560a0002,
		['奥秘卡边框']=0x56080002,
		['阵营边框']=0x56070007,
		['职业图标']=0x560d000a,
		['是否可选']=false,
	},
	{
		['name']=0x1008000e,
		['showname']='暗金教',
		['postfix']='法师、牧师、术士',
		['子职业']={
			[1]=0x10080004,
			[2]=0x10080006,
			[3]=0x10080009,
		},
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x5604000e,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x56060001,
		['法术卡边框']=0x56090001,
		['武器卡边框']=0x560a0002,
		['奥秘卡边框']=0x56080002,
		['阵营边框']=0x56070006,
		['是否可选']=false,
	},
	{
		['name']=0x10080001,
		['showname']='中立',
		['英雄边框']=0x560c000b,
		['英雄卡边框']=0x5604000e,
		['英雄技能边框']=0x56050003,
		['随从卡边框']=0x56060001,
		['法术卡边框']=0x56090001,
		['武器卡边框']=0x560a0002,
		['奥秘卡边框']=0x56080002,
		['职业图标']=0x560d000a,
	},
	{
		['name']=0x10080020,
		['showname']='梦境',
	},
	{
		['name']=0x10080021,
		['showname']='威兹班',
	},
}}
return t