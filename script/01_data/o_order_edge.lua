--[[1005

]]
local t = {
'o_order_edge',
{
	{
		['name']=0x10050001,
		['showname']='法力消耗预览',
		['功能描述']='鼠标覆盖时，水晶消耗的表现',
		['事件']='法力消耗预览_事件',
		['条件']='法力消耗预览_条件',
		['修改数据']='法力消耗预览_修改数据',
	},
	{
		['name']=0x10050012,
		['showname']='法力消耗预览取消',
		['功能描述']='鼠标离开时，水晶消耗的表现取消',
		['事件']='法力消耗预览取消_事件',
		['条件']='法力消耗预览取消_条件',
		['修改数据']='法力消耗预览取消_修改数据',
	},
	{
		['name']=0x10050014,
		['showname']='抓取卡牌',
		['功能描述']='左键点击，或拖拽卡牌，卡牌开始跟随鼠标',
		['事件']='抓取卡牌_事件',
		['条件']='抓取卡牌_条件',
		['修改数据']='抓取卡牌_修改数据',
	},
	{
		['name']=0x10050005,
		['showname']='卡牌进入功能区',
		['功能描述']='卡牌随鼠标进入功能区',
		['事件']='卡牌进入功能区_事件',
		['条件']='卡牌进入功能区_条件',
		['修改数据']='卡牌进入功能区_修改数据',
	},
	{
		['name']=0x10050015,
		['showname']='卡牌进入功能区_随从',
		['功能描述']='卡牌随鼠标进入功能区',
		['事件']='卡牌进入功能区_事件',
		['条件']='卡牌进入功能区_随从_条件',
		['修改数据']='卡牌进入功能区_随从_修改数据',
	},
	{
		['name']=0x10050002,
		['showname']='卡牌进入功能区_单目标法术',
		['功能描述']='卡牌随鼠标进入功能区',
		['事件']='卡牌进入功能区_事件',
		['条件']='卡牌进入功能区_条件',
		['修改数据']='卡牌进入功能区_单目标法术_修改数据',
	},
	{
		['name']=0x10050006,
		['showname']='卡牌返回手牌区',
		['功能描述']='卡牌随鼠标返回手牌区，象征了取消',
		['事件']='卡牌返回手牌区_事件',
		['条件']='卡牌返回手牌区_条件',
		['修改数据']='卡牌返回手牌区_修改数据',
	},
	{
		['name']=0x1005000a,
		['showname']='卡牌选择目标',
		['功能描述']='连线跟随鼠标效果，确认后删除',
		['事件']='卡牌选择目标_事件',
		['条件']='卡牌选择目标_条件',
		['修改数据']='卡牌选择目标_修改数据',
	},
	{
		['name']=0x1005000b,
		['showname']='卡牌抉择',
		['功能描述']='显示抉择选项',
		['事件']='卡牌抉择_事件',
		['条件']='卡牌抉择_条件',
		['修改数据']='卡牌抉择_修改数据',
	},
	{
		['name']=0x1005000d,
		['showname']='卡牌取消指令',
		['功能描述']='右键抬起触发',
		['事件']='卡牌取消指令_事件',
		['条件']='卡牌取消指令_条件',
		['修改数据']='卡牌取消指令_修改数据',
	},
	{
		['name']=0x10050007,
		['showname']='随从切换站位',
		['功能描述']='随从切换预站位',
		['事件']='随从切换站位_事件',
		['条件']='随从切换站位_条件',
		['修改数据']='随从切换站位_修改数据',
	},
	{
		['name']=0x10050008,
		['showname']='卡牌确认使用',
		['功能描述']='左键抬起触发',
		['事件']='卡牌确认使用_事件',
		['条件']='卡牌确认使用_条件',
		['修改数据']='卡牌确认使用_修改数据',
	},
	{
		['name']=0x10050016,
		['showname']='卡牌确认使用_随从中途',
		['功能描述']='左键抬起触发，但是还有后续动作',
		['事件']='卡牌确认使用_事件',
		['条件']='卡牌确认使用_随从中途_条件',
		['修改数据']='卡牌确认使用_随从中途_修改数据',
	},
}}
return t