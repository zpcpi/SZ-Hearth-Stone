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
				['name']='水晶信息',
				['type']='any',
			},
			[12]={
				['name']='对决类型',
				['type']='any',
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
				['name']='卡牌实例表',
				['type']='string',
			},
			[19]={
				['name']='当前效果堆栈',
				['type']='any',
			},
			[20]={
				['name']='我方牌库',
				['type']='_o_randomlib',
			},
			[21]={
				['name']='实例化卡牌列表',
				['type']='_o_card',
			},
			[22]={
				['name']='别人实例化卡牌反查表',
				['type']='_boolean',
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
				['name']='目标条件',
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
				['name']='uid',
				['type']='string',
			},
			[2]={
				['name']='扩展包',
				['type']='i_category',
			},
			[3]={
				['name']='可收集',
				['type']='boolean',
			},
			[4]={
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
				['name']='当前注册事件',
				['type']='any',
			},
			[2]={
				['name']='浮动属性',
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
				['type']='bool',
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
				['name']='职业',
				['type']='_i_profession',
			},
			[4]={
				['name']='英雄',
				['type']='i_card',
			},
			[5]={
				['name']='英雄技能',
				['type']='i_card',
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
				['name']='光环筛选',
				['type']='fargboolean',
			},
			[3]={
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
				['name']='Stack',
				['type']='any',
			},
			[6]={
				['name']='费用',
				['type']='int',
			},
			[7]={
				['name']='过载费用',
				['type']='int',
			},
			[8]={
				['name']='是否使用成功',
				['type']='boolean',
			},
			[9]={
				['name']='原始伤害数值',
				['type']='int',
			},
			[10]={
				['name']='中间伤害数值',
				['type']='int',
			},
			[11]={
				['name']='逐个伤害数值',
				['type']='int',
			},
			[12]={
				['name']='逐个伤害目标',
				['type']='o_card',
			},
			[13]={
				['name']='伤害类型',
				['type']='estr_damage_type',
			},
			[14]={
				['name']='伤害数值',
				['type']='_int',
			},
			[15]={
				['name']='最终伤害目标',
				['type']='_o_card',
			},
			[16]={
				['name']='当前水晶变化',
				['type']='int',
			},
			[17]={
				['name']='当前攻击变化',
				['type']='int',
			},
			[18]={
				['name']='当前护甲变化',
				['type']='int',
			},
			[19]={
				['name']='当前添加buff',
				['type']='i_skill',
			},
			[20]={
				['name']='当前生命变化',
				['type']='int',
			},
			[21]={
				['name']='当前添加特性',
				['type']='_string',
			},
			[22]={
				['name']='当前移除特性',
				['type']='_string',
			},			
			[23]={
				['name']='原始治疗数值',
				['type']='int',
			},
			[24]={
				['name']='中间治疗数值',
				['type']='int',
			},
			[25]={
				['name']='逐个治疗数值',
				['type']='int',
			},
			[26]={
				['name']='逐个治疗目标',
				['type']='o_card',
			},
			[27]={
				['name']='治疗类型',
				['type']='estr_heal_type',
			},
			[28]={
				['name']='最终治疗目标',
				['type']='_o_card',
			},
			[29]={
				['name']='治疗数值',
				['type']='_int',
			},
			[30]={
				['name']='最大水晶变化',
				['type']='int',
			},
		},
	},
}}
return t