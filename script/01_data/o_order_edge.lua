--[[1005

]]
local G = require "gf"
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
		-- done
		['name']=0x10050014,
		['showname']='抓取卡牌',
		['功能描述']='左键点击，或拖拽卡牌，卡牌开始跟随鼠标',
		['事件'] = function (o_order_info_当前指令信息)
			local Caster = o_order_info_当前指令信息['Caster']
			return {'UI_抓取卡牌', Caster}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			-- local Caster = o_order_info_当前指令信息['Caster']
			-- print('UI_抓取卡牌', string.format('0x%x', Caster['name']), Caster['showname'])
			return G.call('卡牌抓取条件判断', o_order_info_当前指令信息)
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			local o_misc = G.misc()
			local script_动画系统 = o_misc.主动画系统
			local _, obj = G.event_info()

			o_order_info_当前指令信息['CasterObj'] = obj

			-- 控件父级设置
			local script_战场 = o_misc.主战场系统
			script_战场.跨界面操作框.addChild(obj)
			local posx, posy = obj.parent.globalToLocal(G.MousePos())
			obj.x = posx
			obj.y = posy

			-- 注册动画
			script_动画系统:push_quote('::CurPickCard', obj)
			script_动画系统:add_animquest(
				-- 朝向复位
				G.call('动画系统_创建quest', script_动画系统, G.QueryName(0x1001001b))
			)
			script_动画系统:add_animquest(
				-- 跟随鼠标
				G.call('动画系统_创建quest', script_动画系统, G.QueryName(0x1001001a))
			)

			-- 控件状态更改
			local script_战场 = o_misc.主战场系统
			script_战场.selfHandcard.c_handcards_self:pickcard_state(obj, true)
			script_战场.enemyHandcard.c_handcards_enemy:pickcard_state(true)
			script_战场.InFuncArea = false
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
			return G.call('卡牌进入功能区条件判断', o_order_info_当前指令信息)
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
		end,
	},
	{
		-- doing
		['name']=0x10050002,
		['showname']='卡牌进入功能区_单目标法术',
		['功能描述']='卡牌随鼠标进入功能区',
		['事件'] = function (o_order_info_当前指令信息)
			return {'UI_鼠标进入功能区'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			return G.call('卡牌进入功能区条件判断', o_order_info_当前指令信息)
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
			local o_misc = G.misc()
			local script_动画系统 = o_misc.主动画系统
			local obj = o_order_info_当前指令信息['CasterObj']

			-- 调出指示线
			
			
			-- 注册动画
			local posx, posy = obj.parent.globalToLocal(UI_SPELL_TARGET_POS['posx'], UI_SPELL_TARGET_POS['posy'])
			script_动画系统:clear_animquest()
			script_动画系统:add_animquest(
				-- 卡牌显示在左侧
				G.call('动画系统_创建quest_自定义', script_动画系统, false, 300, 
				{
					n = 4,
					[1] = '动画系统_多属性设置',
					[2] = '::CurPickCard',
					[3] = {
						[1] = 'x',
						[2] = 'y',
					},
					[4] = {
						[1] = posx,
						[2] = posy,
					},
					[5]={
						['x1']=0,
						['y1']=0.5,
						['x2']=0.5,
						['y2']=1,
					},
				})
			)






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
		-- done
		['name']=0x1005000d,
		['showname']='卡牌取消指令',
		['功能描述']='右键抬起触发',
		['事件'] = function (o_order_info_当前指令信息)
			return {'UI_取消操作'}
		end,
		['条件'] = function (o_order_info_当前指令信息)
			-- local Caster = o_order_info_当前指令信息['Caster']
			-- print('UI_取消操作', string.format('0x%x', Caster['name']), Caster['showname'])
			return true
		end,
		['修改数据'] = function (o_order_info_当前指令信息)
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