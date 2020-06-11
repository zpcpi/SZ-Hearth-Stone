--[[1003

]]
local t = {
'o_excel',
{
	{
		['name']=0x10030001,
		['showname']='excel关联表',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='excel关联表.xlsx',
		['sheet名称']='excel关联表',
		['默认值文件名称']='excel关联表.xlsx',
		['默认值sheet名称']='excel关联表_辅助',
		['o表名称']='o_excel',
		['是否转置']=false,
		['是否全托']=true,
	},
	{
		['name']=0x10030002,
		['showname']='作弊指令表',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='作弊指令表.xlsx',
		['sheet名称']='作弊指令表',
		['o表名称']='o_cheat_system_item',
		['是否转置']=false,
		['是否全托']=true,
	},
	{
		['name']=0x10030003,
		['showname']='基础卡',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='基础卡',
		['o表名称']='o_card',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x10030004,
		['showname']='英雄卡',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='英雄卡',
		['o表名称']='o_card',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x10030005,
		['showname']='经典卡',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='经典卡',
		['o表名称']='o_card_expert',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x10030006,
		['showname']='荣誉室',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='荣誉室',
		['o表名称']='o_card_honours',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x10030007,
		['showname']='纳克萨玛斯',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='纳克萨玛斯',
		['o表名称']='o_card_naxx',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x10030008,
		['showname']='地精大战侏儒',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='地精大战侏儒',
		['o表名称']='o_card_gvg',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x10030009,
		['showname']='黑石山的火焰',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='黑石山',
		['o表名称']='o_card_brm',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x1003000a,
		['showname']='冠军的试炼',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='冠军的试炼',
		['o表名称']='o_card_tgt',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x1003000b,
		['showname']='探险者协会',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='探险者协会',
		['o表名称']='o_card_loe',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x1003000c,
		['showname']='上古之神的低语',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='上古之神',
		['o表名称']='o_card_wog',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x1003000d,
		['showname']='卡拉赞之夜',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='卡拉赞',
		['o表名称']='o_card_kar',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x1003000e,
		['showname']='龙争虎斗加基森',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='加基森',
		['o表名称']='o_card_cfm',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x1003000f,
		['showname']='勇闯安戈洛',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='安戈洛',
		['o表名称']='o_card_ung',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x10030010,
		['showname']='冰封王座的骑士',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='冰封王座',
		['o表名称']='o_card_icc',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x10030011,
		['showname']='狗头人与地下世界',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='狗头人',
		['o表名称']='o_card_loot',
		['是否转置']=false,
		['是否全托']=false,
	},
	{
		['name']=0x10030012,
		['showname']='女巫森林',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='女巫森林',
		['o表名称']='o_card_gil',
		['是否转置']=false,
		['是否全托']=false,
	},
}}
return t