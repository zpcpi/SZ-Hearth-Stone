--[[1f01

]]
local t = {
'o_typedef',
{
	{
		['name']='o_dialogue_system_tap',
		['define']={
			[1]={
				['name']='动画',
				['type']='fargo_dialogue_system_action',
			},
			[2]={
				['name']='延迟时间',
				['type']='number',
			},
			[3]={
				['name']='并行播放',
				['type']='boolean',
			},
		},
	},
	{
		['name']='o_dialogue_system_action',
		['define']={
			[1]={
				['name']='name',
				['type']='int',
			},
		},
	},
	{
		['name']='o_dialogue_system_actionlist',
		['define']={
			[1]={
				['name']='动画',
				['type']='_o_dialogue_system_tap',
			},
		},
	},
	{
		['name']='o_typedef',
		['define']={
			[1]={
				['name']='name',
				['type']='string',
			},
			[2]={
				['name']='img',
				['type']='scriptview',
			},
			[3]={
				['name']='mod',
				['type']='string',
			},
			[4]={
				['name']='modetype',
				['type']='string',
			},
			[5]={
				['name']='base',
				['type']='_type',
			},
			[6]={
				['name']='define',
				['type']='_desc',
			},
		},
	},
	{
		['name']='o_animation',
		['define']={
			[1]={
				['name']='rate',
				['type']='int',
			},
			[2]={
				['name']='循环',
				['type']='int',
			},
			[3]={
				['name']='类别',
				['type']='string',
			},
			[4]={
				['name']='图像',
				['type']='_image',
			},
		},
	},
	{
		['name']='o_event',
		['define']={
			[1]={
				['name']='name',
				['type']='string',
			},
			[2]={
				['name']='arg',
				['type']='_o_var',
			},
		},
	},
	{
		['name']='o_font',
		['define']={
			[1]={
				['name']='fontname',
				['type']='sysfont',
			},
			[2]={
				['name']='ttf',
				['type']='boolean',
			},
		},
	},
	{
		['name']='o_fontstyle',
		['define']={
			[1]={
				['name']='color',
				['type']='color',
			},
		},
	},
	{
		['name']='o_image',
		['define']={
			[1]={
				['name']='grid',
				['type']='grid9',
			},
		},
	},
	{
		['name']='o_var',
		['define']={
			[1]={
				['name']='id',
				['type']='string',
			},
			[2]={
				['name']='type',
				['type']='type',
			},
		},
	},
	{
		['name']='o_vector',
		['define']={
			[1]={
				['name']='x',
				['type']='int',
			},
			[2]={
				['name']='y',
				['type']='int',
			},
		},
	},
	{
		['name']='o_misc',
		['define']={
			[1]={
				['name']='name',
				['type']='int',
			},
			[2]={
				['name']='当前地图',
				['type']='i_citymap_system_map',
			},
		},
	},
	{
		['name']='o_cheat_system_item',
		['define']={
			[1]={
				['name']='执行函数',
				['type']='funs',
			},
			[2]={
				['name']='默认参数',
				['type']='string',
			},
		},
	},
	{
		['name']='o_citymap_system_vcp',
		['define']={
			[1]={
				['name']='位置',
				['type']='o_vector',
			},
			[2]={
				['name']='城市',
				['type']='i_citymap_system_city',
			},
		},
	},
	{
		['name']='o_citymap_system_eventinfo',
		['define']={
			[1]={
				['name']='是否进入',
				['type']='boolean',
			},
		},
	},
	{
		['name']='o_citymap_system_city',
		['define']={
			[1]={
				['name']='名称',
				['type']='string',
			},
			[2]={
				['name']='图标',
				['type']='image',
			},
			[3]={
				['name']='锁定',
				['type']='boolean',
			},
			[4]={
				['name']='关联地图',
				['type']='i_citymap_system_map',
			},
		},
	},
	{
		['name']='o_excel',
		['showname']='excel数据对照表',
		['define']={
			[1]={
				['name']='文件名称',
				['type']='string',
			},
			[2]={
				['name']='sheet名称',
				['type']='string',
			},
			[3]={
				['name']='默认值文件名称',
				['type']='type',
			},
			[4]={
				['name']='默认值sheet名称',
				['type']='string',
			},
			[5]={
				['name']='o表名称',
				['type']='string',
			},
			[6]={
				['name']='是否转置',
				['type']='boolean',
			},
			[7]={
				['name']='是否全托',
				['type']='boolean',
			},
			[8]={
				['name']='导出前额外处理',
				['type']='funs@excel_fix',
			},
			[9]={
				['name']='导入后额外处理',
				['type']='funs@excel_fix',
			},
		},
	},
	{
		['name']='o_citymap_system_map',
		['img']='v_citymap_system_map',
		['mod']='citymapsystem',
		['modetype']='line',
		['define']={
			[1]={
				['name']='名称',
				['type']='string',
			},
			[2]={
				['name']='地图背景',
				['type']='image',
			},
			[3]={
				['name']='城市列表',
				['type']='_o_citymap_system_vcp',
			},
		},
	},
}}
return t