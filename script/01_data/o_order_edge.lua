--[[1005

]]
local t = {
'o_order_edge',
{
	{
		['name']=0x10050001,
		['showname']='法力消耗预览',
		['功能描述']='鼠标覆盖时，水晶消耗的表现',
	},
	{
		['name']=0x10050012,
		['showname']='法力消耗预览取消',
		['功能描述']='鼠标离开时，水晶消耗的表现取消',
	},
	{
		['name']=0x10050014,
		['showname']='选择卡牌',
		['功能描述']='左键点击，或拖拽卡牌，卡牌开始跟随鼠标',
		['事件'] = function (o_order_info_当前指令信息)
			local Caster = o_order_info_当前指令信息['Caster']
			return {'UI_手牌_选择卡牌', Caster}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 11')
		end,
	},
	{
		['name']=0x10050015,
		['showname']='选择随从',
		['功能描述']='左键点击，或拖拽了随从',
	},
	{
		['name']=0x10050005,
		['showname']='卡牌进入功能区',
		['功能描述']='卡牌随鼠标进入功能区',
		['事件'] = function (o_order_info_当前指令信息)
			return {'22'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 22')
		end,
	},
	{
		['name']=0x10050006,
		['showname']='卡牌返回手牌区',
		['功能描述']='卡牌随鼠标返回手牌区，象征了取消',
	},
	{
		['name']=0x1005000a,
		['showname']='卡牌选择目标',
		['功能描述']='连线跟随鼠标效果',
	},
	{
		['name']=0x1005000b,
		['showname']='卡牌抉择',
		['功能描述']='显示抉择选项',
	},
	{
		['name']=0x1005000d,
		['showname']='卡牌取消指令',
		['功能描述']='右键抬起触发',
	},
	{
		['name']=0x10050007,
		['showname']='随从切换站位',
		['功能描述']='随从切换预站位',
	},
	{
		['name']=0x10050008,
		['showname']='卡牌确认使用',
		['功能描述']='左键抬起触发',
	},
}}
return t