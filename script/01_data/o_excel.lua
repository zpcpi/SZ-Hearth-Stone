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
		['showname']='卡牌信息',
		['class']={n=0,[1] = 'excel_读取数据',
		},
		['文件名称']='卡牌信息表.xlsx',
		['sheet名称']='卡牌表',
		['o表名称']='o_card',
		['是否转置']=false,
		['是否全托']=false,
		['导入后额外处理']='o_card_卡牌信息选择导入',
	},
}}
return t