--[[1005

]]
local t = {
'o_order_edge',
{
	{
		['name']=0x10050001,
		['showname']='法力消耗预览',
		['功能描述']='鼠标覆盖时，水晶消耗的表现',
		['事件'] = function (o_order_info_当前指令信息)
			local Caster = o_order_info_当前指令信息['Caster']
			return {'UI_鼠标覆盖卡牌', Caster}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 法力消耗预览')
		end,
	},
	{
		['name']=0x10050012,
		['showname']='法力消耗预览取消',
		['功能描述']='鼠标离开时，水晶消耗的表现取消',
		['事件'] = function (o_order_info_当前指令信息)
			local Caster = o_order_info_当前指令信息['Caster']
			return {'UI_鼠标离开卡牌', Caster}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 法力消耗预览取消')
		end,
	},
	{
		['name']=0x10050014,
		['showname']='抓取卡牌',
		['功能描述']='左键点击，或拖拽卡牌，卡牌开始跟随鼠标',
		['事件'] = function (o_order_info_当前指令信息)
			local Caster = o_order_info_当前指令信息['Caster']
			return {'UI_抓取卡牌', Caster}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 抓取卡牌')
		end,
	},
	{
		['name']=0x10050005,
		['showname']='卡牌进入功能区',
		['功能描述']='卡牌随鼠标进入功能区',
		['事件'] = function (o_order_info_当前指令信息)
			return {'UI_鼠标进入功能区'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 卡牌进入功能区')
		end,
	},
	{
		['name']=0x10050006,
		['showname']='卡牌返回手牌区',
		['功能描述']='卡牌随鼠标返回手牌区，象征了取消',
		['事件'] = function (o_order_info_当前指令信息)
			return {'UI_鼠标进入手牌区'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 卡牌返回手牌区')
		end,
	},
	{
		['name']=0x1005000a,
		['showname']='卡牌选择目标',
		['功能描述']='连线跟随鼠标效果',
		['事件'] = function (o_order_info_当前指令信息)
			return {'UI_卡牌选择目标'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 卡牌选择目标')
		end,
	},
	{
		['name']=0x1005000b,
		['showname']='卡牌抉择',
		['功能描述']='显示抉择选项',
		['事件'] = function (o_order_info_当前指令信息)
			return {'UI_发现选择卡牌'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 卡牌抉择')
		end,
	},
	{
		['name']=0x1005000d,
		['showname']='卡牌取消指令',
		['功能描述']='右键抬起触发',
		['事件'] = function (o_order_info_当前指令信息)
			return {'UI_取消操作'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 卡牌取消指令')
		end,
	},
	{
		['name']=0x10050007,
		['showname']='随从切换站位',
		['功能描述']='随从切换预站位',
		['事件'] = function (o_order_info_当前指令信息)
			return {'UI_鼠标切换站位'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			print('trig 随从切换站位')
		end,
	},
	{
		['name']=0x10050008,
		['showname']='卡牌确认使用',
		['功能描述']='左键抬起触发',
		['事件'] = function (o_order_info_当前指令信息)
			return {'UI_卡牌确认使用'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			-- 分支判断
			-- 抉择
			-- 随从
			-- 完成使用
			print('trig 卡牌确认使用')
		end,
	},
}}
return t