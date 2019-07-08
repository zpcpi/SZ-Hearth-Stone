--[[1002

]]
local t = {
'o_cheat_system_item',
{
	{
		['name']=0x10020001,
		['showname']='剧情演示',
		['执行函数']='剧情演示',
	},
	{
		['name']=0x10020002,
		['showname']='修改横幅',
		['执行函数']='修改横幅字体 %s',
		['默认参数']='Hi，你好！',
	},
	{
		['name']=0x10020003,
		['showname']='添加手牌',
		['执行函数']='addcard',
	},
	{
		['name']=0x10020004,
		['showname']='删除手牌',
		['执行函数']='removecard',
	},
}}
return t