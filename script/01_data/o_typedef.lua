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
				['type']='_o_event_arg',
			},
		},
	},
	{
		['name']='o_event_arg',
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
			[2]={
				['name']='当前演算体',
				['type']='o_animactor',
			},
			[3]={
				['name']='当前动画段',
				['type']='o_animquest',
			},
			[4]={
				['name']='手牌数量',
				['type']='any',
			},
			[5]={
				['name']='手牌信息',
				['type']='any',
			},
			[6]={
				['name']='随从数量',
				['type']='any',
			},
			[7]={
				['name']='随从信息',
				['type']='any',
			},
			[8]={
				['name']='英雄信息',
				['type']='any',
			},
			[9]={
				['name']='英雄技能信息',
				['type']='any',
			},
			[10]={
				['name']='武器信息',
				['type']='any',
			},
			[11]={
				['name']='对决类型',
				['type']='any',
			},
			[12]={
				['name']='玩家信息',
				['type']='o_room_player',
			},
			[13]={
				['name']='房间玩家列表',
				['type']='_o_room_player',
			},
			[14]={
				['name']='主动画系统',
				['type']='any',
			},
			[15]={
				['name']='主战场系统',
				['type']='any',
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
				['type']='_farg@actor',
			},
			[4]={
				['name']='shaft',
				['type']='_o_animquest_shaft',
			},
			[5]={
				['name']='child_quests',
				['type']='_o_animquest',
			},
		},
	},
	{
		['name']='o_animquest_shaft',
		['define']={
			[1]={
				['name']='funs',
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
				['name']='bezier',
				['type']='o_animquest_bezier',
			},
			[4]={
				['name']='next_index',
				['type']='int',
			},
		},
	},
	{
		['name']='o_order',
		['showname']='指令',
		['define']={
			[1]={
				['name']='状态列表',
				['type']='_o_order_state',
			},
		},
	},
	{
		['name']='o_order_state',
		['showname']='指令状态',
		['define']={
			[1]={
				['name']='监测列表',
				['type']='_o_order_edge',
			},
			[2]={
				['name']='跳转节点',
				['type']='_int',
			},
			[3]={
				['name']='分支跳转节点',
				['type']='_int',
			},
		},
	},
	{
		['name']='o_order_edge',
		['showname']='指令监测',
		['define']={
			[1]={
				['name']='功能描述',
				['type']='string',
			},
			[2]={
				['name']='事件',
				['type']='earg',
			},
			[3]={
				['name']='条件',
				['type']='fargboolean',
			},
			[4]={
				['name']='开启动画',
				['type']='farg',
			},
			[5]={
				['name']='结束动画',
				['type']='farg',
			},
			[6]={
				['name']='修改数据',
				['type']='farg',
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
		['name']='o_card',
		['showname']='卡牌',
		['img']='v_card_manager',
		['mod']='showview',
		['modetype']='line',
		['define']={
			[1]={
				['name']='类型',
				['type']='i_cardtype',
			},
			[2]={
				['name']='费用',
				['type']='int',
			},
			[3]={
				['name']='攻击',
				['type']='int',
			},
			[4]={
				['name']='生命',
				['type']='int',
			},
			[5]={
				['name']='护甲',
				['type']='int',
			},
			[6]={
				['name']='职业',
				['type']='i_profession',
			},
			[7]={
				['name']='品质',
				['type']='i_rank',
			},
			[8]={
				['name']='种族',
				['type']='i_race',
			},
			[9]={
				['name']='是精英',
				['type']='boolean',
			},
			[10]={
				['name']='描述',
				['type']='string',
			},
			[11]={
				['name']='描述字号',
				['type']='int',
			},
			[12]={
				['name']='原画',
				['type']='image',
			},
			[13]={
				['name']='原画缩放X',
				['type']='number',
			},
			[14]={
				['name']='原画缩放Y',
				['type']='number',
			},
			[15]={
				['name']='画家',
				['type']='string',
			},
			[16]={
				['name']='趣味描述',
				['type']='string',
			},
			[17]={
				['name']='扩展包',
				['type']='i_category',
			},
			[18]={
				['name']='可收集',
				['type']='boolean',
			},
			[19]={
				['name']='延伸卡',
				['type']='_i_card',
			},
			[20]={
				['name']='原画偏移X',
				['type']='dragint',
			},
			[21]={
				['name']='原画偏移Y',
				['type']='dragint',
			},
			[22]={
				['name']='原画旋转',
				['type']='dragnumber',
			},
			[23]={
				['name']='提示标签',
				['type']='_string',
			},
			[24]={
				['name']='局内描述',
				['type']='string',
			},
			[25]={
				['name']='卡牌指令',
				['type']='i_order',
			},
			[26]={
				['name']='卡牌特性',
				['type']='_int',
			},
			[27]={
				['name']='卡牌效果',
				['type']='_int',
			},
			[28]={
				['name']='可使用条件',
				['type']='fargboolean',
			},
			[29]={
				['name']='高亮条件',
				['type']='fargboolean',
			},
			[30]={
				['name']='目标条件',
				['type']='_fargboolean',
			},
			[31]={
				['name']='目标指向文本',
				['type']='_string',
			},
			[32]={
				['name']='抉择卡',
				['type']='_i_card',
			},
		},
	},
	{
		['name']='o_order_info',
		['showname']='指令信息',
		['define']={
			[1]={
				['name']='Caster',
				['type']='o_card',
			},
			[2]={
				['name']='Target',
				['type']='_o_card',
			},
			[3]={
				['name']='Select',
				['type']='_o_card',
			},
			[4]={
				['name']='CasterObj',
				['type']='any',
			},
		},
	},
	{
		['name']='o_category',
		['showname']='扩展包',
		['define']={
			[1]={
				['name']='简称',
				['type']='string',
				['show_index']=true,
			},
			[2]={
				['name']='年代',
				['type']='string',
				['show_index']=true,
			},
			[3]={
				['name']='描述',
				['type']='string',
			},
		},
	},
	{
		['name']='o_race',
		['showname']='种族',
		['define']={
			[1]={
				['name']='子种族',
				['type']='_i_race',
			},
		},
	},
	{
		['name']='o_cardtype',
		['showname']='卡牌类型',
		['define']={
			[1]={
				['name']='描述',
				['type']='string',
			},
			[2]={
				['name']='界面控件',
				['type']='scriptview',
			},
			[3]={
				['name']='战斗界面控件',
				['type']='scriptview',
			},
			[4]={
				['name']='职业边框',
				['type']='string',
			},
			[5]={
				['name']='默认原画配置',
				['type']='i_card',
			},
		},
	},
	{
		['name']='o_profession',
		['showname']='职业',
		['define']={
			[1]={
				['name']='子职业',
				['type']='_i_profession',
			},
			[2]={
				['name']='英雄边框',
				['type']='image',
			},
			[3]={
				['name']='英雄卡边框',
				['type']='image',
			},
			[4]={
				['name']='英雄技能边框',
				['type']='image',
			},
			[5]={
				['name']='随从卡边框',
				['type']='image',
			},
			[6]={
				['name']='法术卡边框',
				['type']='image',
			},
			[7]={
				['name']='武器卡边框',
				['type']='image',
			},
			[8]={
				['name']='奥秘卡边框',
				['type']='image',
			},
			[9]={
				['name']='阵营边框',
				['type']='image',
			},
			[10]={
				['name']='职业图标',
				['type']='image',
			},
		},
	},
	{
		['name']='o_rank',
		['showname']='品质',
		['define']={
			[1]={
				['name']='宝石图片',
				['type']='image',
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
		['name']='o_room_player',
		['define']={
			[1]={
				['name']='玩家名称',
				['type']='string',
			},
			[2]={
				['name']='玩家IP',
				['type']='string',
			},
			[3]={
				['name']='是主机',
				['type']='boolean',
			},
			[4]={
				['name']='准备就绪',
				['type']='boolean',
			},
			[5]={
				['name']='绝对身份',
				['type']='estr_absolute_id_type',
			},
		},
	},
	{
		['name']='o_ui_topmost',
		['define']={
			[1]={
				['name']='界面名称',
				['type']='string',
			},
			[2]={
				['name']='优先级',
				['type']='int',
			},
			[3]={
				['name']='界面类型',
				['type']='estr_ui_layer_type',
			},
		},
	},
	{
		['name']='o_randomlib_type',
		['define']={
			[1]={
				['name']='添加数据功能',
				['type']='funs',
			},
			[2]={
				['name']='修改数据功能',
				['type']='funs',
			},
			[3]={
				['name']='删除数据功能',
				['type']='funs',
			},
			[4]={
				['name']='初始化功能',
				['type']='funs',
			},
			[5]={
				['name']='求值功能',
				['type']='funs',
			},
		},
	},
}}
return t