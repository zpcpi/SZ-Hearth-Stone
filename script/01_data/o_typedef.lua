--[[1f01

]]
local t = {
'o_typedef',
{
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
			[2]={
				['name']='outlineThick',
				['type']='number',
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
		['name']='o_misc',
		['define']={
			[1]={
				['name']='作弊指令列表',
				['type']='_string',
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
		['name']='o_animquest',
		['define']={
			[1]={
				['name']='is_mono',
				['type']='boolean',
			},
			[2]={
				['name']='time',
				['type']='int',
			},
			[3]={
				['name']='iter',
				['type']='farg@actor',
			},
			[4]={
				['name']='shaft',
				['type']='_o_animquest_shaft',
			},
			[5]={
				['name']='next_quest',
				['type']='_o_animquest',
			},
		},
	},
	{
		['name']='o_animquest_shaft',
		['define']={
			[1]={
				['name']='iter',
				['type']='funs',
			},
			[2]={
				['name']='nodelist',
				['type']='_o_animquest_shaft_node',
			},
		},
	},
	{
		['name']='o_animquest_shaft_node',
		['define']={
			[1]={
				['name']='target',
				['type']='number',
			},
			[2]={
				['name']='time',
				['type']='int',
			},
			[3]={
				['name']='cubic_bezier',
				['type']='o_animquest_bezier',
			},
			[4]={
				['name']='next',
				['type']='int',
			},
		},
	},
	{
		['name']='o_animquest_bezier',
		['define']={
			[1]={
				['name']='x1',
				['type']='number',
			},
			[2]={
				['name']='y1',
				['type']='number',
			},
			[3]={
				['name']='x2',
				['type']='number',
			},
			[4]={
				['name']='y2',
				['type']='number',
			},
		},
	},
	{
		['name']='o_animactor',
		['define']={
			[1]={
				['name']='questlist',
				['type']='__o_animquest',
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
}}
return t