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
		['mod']='image',
		['define']={
			[1]={
				['name']='grid',
				['type']='grid9',
			},
		},
		['static']=true,
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
				['name']='水晶信息',
				['type']='any',
			},
			[12]={
				['name']='游戏模式',
				['type']='i_game_mode',
			},
			[13]={
				['name']='玩家信息',
				['type']='o_room_player',
			},
			[14]={
				['name']='房间玩家列表',
				['type']='_o_room_player',
			},
			[15]={
				['name']='主动画系统',
				['type']='any',
			},
			[16]={
				['name']='技能动画系统',
				['type']='any',
			},
			[17]={
				['name']='主战场系统',
				['type']='any',
			},
			[18]={
				['name']='当前效果堆栈',
				['type']='any',
			},
			[19]={
				['name']='我方牌库',
				['type']='_o_randomlib',
			},
			[20]={
				['name']='击杀者列表',
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
				['type']='funs',
			},
			[3]={
				['name']='条件',
				['type']='funs',
			},
			[4]={
				['name']='修改数据',
				['type']='funs',
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
				['name']='卡牌属性',
				['type']='o_card_attr',
				['needcopy']=true,
			},
			[2]={
				['name']='美术数据',
				['type']='o_card_artinfo',
			},
			[3]={
				['name']='逻辑数据',
				['type']='o_card_logicinfo',
				['needcopy']=true,
			},
			[4]={
				['name']='局外数据',
				['type']='o_card_outerdata',
			},
			[5]={
				['name']='动态数据',
				['type']='o_dynamic_data',
			},
			[6]={
				['name']='动态数据_事件',
				['type']='o_dynamic_eventdata',
			},
			[7]={
				['name']='查看权限玩家',
				['type']='_',
				['needcopy']=true,
			},
		},
	},
	{
		['name']='o_card_attr',
		['showname']='卡牌属性数据',
		['define']={
			[1]={
				['name']='费用',
				['type']='int',
			},
			[2]={
				['name']='过载费用',
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
				['name']='法术伤害',
				['type']='int',
			},
			[7]={
				['name']='英雄技能伤害',
				['type']='int',
			},
		},
	},
	{
		['name']='o_card_artinfo',
		['showname']='卡牌美术数据',
		['define']={
			[1]={
				['name']='原画',
				['type']='image',
			},
			[2]={
				['name']='原画偏移X',
				['type']='dragint',
			},
			[3]={
				['name']='原画偏移Y',
				['type']='dragint',
			},
			[4]={
				['name']='原画缩放X',
				['type']='number',
			},
			[5]={
				['name']='原画缩放Y',
				['type']='number',
			},
			[6]={
				['name']='原画旋转',
				['type']='dragnumber',
			},
			[7]={
				['name']='画家',
				['type']='string',
			},
			[8]={
				['name']='描述',
				['type']='string',
			},
			[9]={
				['name']='描述字号',
				['type']='int',
			},
			[10]={
				['name']='趣味描述',
				['type']='string',
			},
		},
	},
	{
		['name']='o_card_logicinfo',
		['showname']='卡牌逻辑数据',
		['define']={
			[1]={
				['name']='类型',
				['type']='i_cardtype',
			},
			[2]={
				['name']='职业',
				['type']='_i_profession',
			},
			[3]={
				['name']='品质',
				['type']='i_rank',
			},
			[4]={
				['name']='种族',
				['type']='i_race',
			},
			[5]={
				['name']='是精英',
				['type']='boolean',
			},
			[6]={
				['name']='卡牌指令',
				['type']='i_order',
			},
			[7]={
				['name']='战场卡牌指令',
				['type']='i_order',
			},
			[8]={
				['name']='卡牌特性',
				['type']='cardflag',
			},
			[9]={
				['name']='卡牌效果',
				['type']='_i_skill',
			},
			[10]={
				['name']='可使用条件',
				['type']='fargboolean',
			},
			[11]={
				['name']='高亮条件',
				['type']='fargboolean',
			},
			[12]={
				['name']='卡牌使用目标条件',
				['type']='_fargboolean',
			},
			[13]={
				['name']='目标指向文本',
				['type']='_string',
			},
			[14]={
				['name']='抉择卡',
				['type']='_i_card',
			},
			[15]={
				['name']='提示标签',
				['type']='_string',
			},
			[16]={
				['name']='局内描述',
				['type']='string',
			},
		},
	},
	{
		['name']='o_card_outerdata',
		['showname']='卡牌局外数据',
		['define']={
			[1]={
				['name']='dbfid',
				['type']='int',
			},
			[2]={
				['name']='uid',
				['type']='string',
			},
			[3]={
				['name']='扩展包',
				['type']='i_category',
			},
			[4]={
				['name']='可收集',
				['type']='boolean',
			},
			[5]={
				['name']='衍生卡',
				['type']='_i_card',
			},
		},
	},
	{
		['name']='o_dynamic_data',
		['showname']='卡牌动态数据',
		['define']={
			[1]={
				['name']='浮动属性',
				['type']='o_card_attr',
			},
			[2]={
				['name']='武器属性',
				['type']='o_card_attr',
			},
			[3]={
				['name']='光环属性',
				['type']='o_card_attr',
			},
			[4]={
				['name']='当前属性',
				['type']='o_card_attr',
			},
			[5]={
				['name']='卡牌位置',
				['type']='estr_cardpos_type',
			},
			[6]={
				['name']='所有者',
				['type']='estr_absolute_id_type',
			},
			[7]={
				['name']='特性层数',
				['type']='any',
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
			[5]={
				['name']='CasterObj_Clone',
				['type']='any',
			},
			[6]={
				['name']='MinionPos',
				['type']='int',
			},
			[7]={
				['name']='Player',
				['type']='estr_player',
			},
			[8]={
				['name']='Condition',
				['type']='_any',
			},
			[9]={
				['name']='OrderId',
				['type']='int',
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
			[11]={
				['name']='是否可选',
				['type']='boolean',
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
			[2]={
				['name']='品质颜色',
				['type']='color',
			},
		},
	},
	{
		['name']='o_dynamic_eventdata',
		['showname']='品质',
		['define']={
			[1]={
				['name']='当前注册事件',
				['type']='_o_card_eventinfo',
			},
		},
	},
	{
		['name']='o_card_eventinfo',
		['showname']='品质',
		['define']={
			[1]={
				['name']='事件名',
				['type']='even',
			},
			[2]={
				['name']='注册类型',
				['type']='estr_cardevent_inittype',
			},
			[3]={
				['name']='技能',
				['type']='i_skill',
			},
			[4]={
				['name']='技能名称',
				['type']='string',
			},
			[5]={
				['name']='逻辑编号',
				['type']='int',
			},
			[6]={
				['name']='技能动态数据',
				['type']='any',
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
			[6]={
				['name']='AI',
				['type']='i_battle_ai',
			},
			[7]={
				['name']='卡组',
				['type']='o_deck_template',
			},
			[8]={
				['name']='SteamID',
				['type']='int',
			},
		},
	},
	{
		['name']='o_randomiter',
		['showname']='随机库索引',
		['define']={
			[1]={
				['name']='生成函数',
				['type']='farg_o_random_carddata',
			},
			[2]={
				['name']='默认数据',
				['type']='_o_random_carddata',
			},
			[3]={
				['name']='随机库类型',
				['type']='i_randomlib_type',
			},
			[4]={
				['name']='是否初始化',
				['type']='boolean',
			},
			[5]={
				['name']='随机库',
				['type']='o_randomlib',
			},
		},
	},
	{
		['name']='o_random_carddata',
		['showname']='随机库索引',
		['define']={
			[1]={
				['name']='卡牌',
				['type']='i_card',
			},
			[2]={
				['name']='权重',
				['type']='int',
			},
			[3]={
				['name']='条件',
				['type']='fargboolean',
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
	{
		['name']='o_randomlib',
		['define']={
			[1]={
				['name']='datas',
				['type']='_o_randomlib_data',
			},
			[2]={
				['name']='tree',
				['type']='__o_randomlib_data',
			},
			[3]={
				['name']='int_当前数据量',
				['type']='int',
			},
			[4]={
				['name']='int_最大数据量',
				['type']='int',
			},
			[5]={
				['name']='int_最大有效数据索引',
				['type']='int',
			},
			[6]={
				['name']='int_最大深度',
				['type']='int',
			},
			[7]={
				['name']='int_概率基底',
				['type']='int',
			},
			[8]={
				['name']='boolean_是否循环',
				['type']='boolean',
			},
			[9]={
				['name']='boolean_是否已初始化',
				['type']='boolean',
			},
			[10]={
				['name']='boolean_是否已取空',
				['type']='boolean',
			},
			[11]={
				['name']='生成随机库功能',
				['type']='fargo_randomlib',
			},
			[12]={
				['name']='随机库类型',
				['type']='o_randomlib_type',
			},
		},
	},
	{
		['name']='o_randomlib_data',
		['define']={
			[1]={
				['name']='value',
				['type']='any',
			},
			[2]={
				['name']='weight',
				['type']='int',
			},
			[3]={
				['name']='condition',
				['type']='fargboolean',
			},
			[4]={
				['name']='cur_weight',
				['type']='int',
			},
			[5]={
				['name']='isvalid',
				['type']='int',
			},
			[6]={
				['name']='condivalue',
				['type']='boolean',
			},
		},
	},
	{
		['name']='o_deck_template',
		['define']={
			[1]={
				['name']='卡组名称',
				['type']='string',
			},
			[2]={
				['name']='卡牌列表',
				['type']='_i_card',
			},
			[3]={
				['name']='英雄',
				['type']='_i_card',
			},
			[4]={
				['name']='英雄技能',
				['type']='_i_card',
			},
			[5]={
				['name']='模式',
				['type']='estr_game_mode',
			},
		},
	},
	{
		['name']='o_deck',
		['define']={
			[1]={
				['name']='卡组名称',
				['type']='string',
			},
			[2]={
				['name']='卡牌列表',
				['type']='_o_card',
			},
			[3]={
				['name']='英雄',
				['type']='_i_card',
			},
			[4]={
				['name']='英雄技能',
				['type']='_i_card',
			},
			[5]={
				['name']='模式',
				['type']='estr_game_mode',
			},
		},
	},
	{
		['name']='o_skill',
		['define']={
			[1]={
				['name']='描述',
				['type']='string',
			},
			[2]={
				['name']='技能类型',
				['type']='_estr_skill_type',
			},
			[3]={
				['name']='目标筛选',
				['type']='fargboolean',
			},
			[4]={
				['name']='逻辑功能',
				['type']='_o_skill_trigger',
			},
		},
	},
	{
		['name']='o_skill_trigger',
		['define']={
			[1]={
				['name']='注册时机',
				['type']='estr_cardevent_inittype',
			},
			[2]={
				['name']='是否重复触发',
				['type']='boolean',
			},
			[3]={
				['name']='触发时机',
				['type']='tlua',
			},
			[4]={
				['name']='触发条件',
				['type']='tlua',
			},
			[5]={
				['name']='触发逻辑',
				['type']='tlua',
			},
			[6]={
				['name']='优先级',
				['type']='int',
			},
			[7]={
				['name']='分组',
				['type']='string',
			},
		},
	},
	{
		['name']='o_battle_role',
		['define']={
			[1]={
				['name']='职业',
				['type']='i_profession',
			},
			[2]={
				['name']='生命值',
				['type']='int',
			},
			[3]={
				['name']='护甲',
				['type']='int',
			},
			[4]={
				['name']='英雄卡片',
				['type']='i_card',
			},
		},
	},
	{
		['name']='o_game_mode',
		['define']={
			[1]={
				['name']='模式名称',
				['type']='string',
			},
			[2]={
				['name']='开始条件',
				['type']='funsboolean',
			},
			[3]={
				['name']='初始化函数名',
				['type']='funs',
			},
			[4]={
				['name']='可分配身份列表',
				['type']='_estr_absolute_id_type',
			},
			[5]={
				['name']='AI数要求',
				['type']='int',
			},
			[6]={
				['name']='玩家数要求',
				['type']='int',
			},
		},
	},
	{
		['name']='o_battle_ai',
		['define']={
			[1]={
				['name']='AI名称库',
				['type']='_string',
			},
			[2]={
				['name']='AI卡组',
				['type']='_i_deck',
			},
			[3]={
				['name']='AI行为树',
				['type']='i_behavior_tree',
			},
			[4]={
				['name']='支持游戏模式',
				['type']='_i_game_mode',
			},
			[5]={
				['name']='AI逻辑',
				['type']='_o_battle_ai_logic',
			},
		},
	},
	{
		['name']='o_battle_ai_logic',
		['define']={
			[1]={
				['name']='时机',
				['type']='even',
			},
			[2]={
				['name']='处理函数',
				['type']='funs@ailogic',
			},
		},
	},
	{
		['name']='o_behavior_tree',
		['define']={
			[1]={
				['name']='根节点',
				['type']='o_behavior_tree_node',
			},
		},
	},
	{
		['name']='o_behavior_tree_node',
		['define']={
			[1]={
				['name']='判断条件',
				['type']='funsboolean',
			},
			[2]={
				['name']='执行逻辑',
				['type']='farg',
			},
		},
	},
	{
		['name']='o_skill_info',
		['define']={
			[1]={
				['name']='Player',
				['type']='estr_player',
			},
			[2]={
				['name']='Caster',
				['type']='o_card',
			},
			[3]={
				['name']='Target',
				['type']='_o_card',
			},
			[4]={
				['name']='Parent',
				['type']='o_skill_info',
			},
			[5]={
				['name']='Children',
				['type']='_o_skill_info',
			},
			[6]={
				['name']='Stack',
				['type']='any',
			},
			[7]={
				['name']='费用',
				['type']='int',
			},
			[8]={
				['name']='过载费用',
				['type']='int',
			},
			[9]={
				['name']='是否使用成功',
				['type']='boolean',
			},
			[10]={
				['name']='原始伤害数值',
				['type']='int',
			},
			[11]={
				['name']='中间伤害数值',
				['type']='int',
			},
			[12]={
				['name']='逐个伤害数值',
				['type']='int',
			},
			[13]={
				['name']='逐个伤害目标',
				['type']='o_card',
			},
			[14]={
				['name']='伤害类型',
				['type']='estr_damage_type',
			},
			[15]={
				['name']='伤害数值',
				['type']='_int',
			},
			[16]={
				['name']='最终伤害目标',
				['type']='_o_card',
			},
			[17]={
				['name']='当前水晶变化',
				['type']='int',
			},
			[18]={
				['name']='当前攻击变化',
				['type']='int',
			},
			[19]={
				['name']='当前护甲变化',
				['type']='int',
			},
			[20]={
				['name']='当前添加buff',
				['type']='i_skill',
			},
			[21]={
				['name']='当前生命变化',
				['type']='int',
			},
			[22]={
				['name']='当前添加特性',
				['type']='_string',
			},
			[23]={
				['name']='当前移除特性',
				['type']='_string',
			},
			[24]={
				['name']='当前还原特性',
				['type']='_string',
			},
			[25]={
				['name']='原始治疗数值',
				['type']='int',
			},
			[26]={
				['name']='中间治疗数值',
				['type']='int',
			},
			[27]={
				['name']='逐个治疗数值',
				['type']='int',
			},
			[28]={
				['name']='逐个治疗目标',
				['type']='o_card',
			},
			[29]={
				['name']='治疗类型',
				['type']='estr_heal_type',
			},
			[30]={
				['name']='最终治疗目标',
				['type']='_o_card',
			},
			[31]={
				['name']='治疗数值',
				['type']='_int',
			},
			[32]={
				['name']='最大水晶变化',
				['type']='int',
			},
			[33]={
				['name']='弃牌编号',
				['type']='int',
			},
			[34]={
				['name']='卡牌来源',
				['type']='estr_cardsource_type',
			},
		},
	},
}}
return t