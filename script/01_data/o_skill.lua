--[[1013

]]
local t = {
'o_skill',
{
	{
		['name']=0x10130001,
		['showname']='测试用任务',
		['id']=1,
		['class']={n=0,[1] = '测试用函数',
		},
		['逻辑功能']={
			[1]={
				['触发时机']='UI_卡牌确认使用',
				['触发逻辑']={
t =
{
    {
        'function',
        {'a','b'},
        {},
        {
            'map',
            '+',
            'a',
            'b',
            {1,2,3}
        }
    },
    {1,2,3},
    {3,2,1}
},
lua = function ()
	local G = require "gf"
	local t = G.api
	return (function(a_38,b_42)
		return t["tLua_MAP"](t["tLua_ADD"],a_38,b_42,{1,2,3})
	end)({1,2,3},{3,2,1})
end
,
},
			},
		},
	},
}}
return t