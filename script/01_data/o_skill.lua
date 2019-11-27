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
        {},
        {
            {'f',3},
            {
                'a',
                {
                    'function',
                    {'b','c'},
                    {},
                    {
                        'if',
                        {'tLua_bg','c',0},
                        {
                            'a',
                            {'+','b',1},
                            {'-','c',1}
                        },
                        'b'
                    }
                }
            },
            {'d',2}
        },
        {'a',0,10}
    }
},
lua = function ()
	local G = require "gf"
	local t = G.api
	return (function()
		local f_64 = 3
		local function a_102 (b_178,c_182)
			return (function ()
				if(t["tLua_bg"](c_182,0))then
					return a_102(t["tLua_ADD"](b_178,1),t["tLua_SUB"](c_182,1))
				else
					return b_178
				end
			end)()
		end
		local d_570 = 2
		return a_102(0,10)
	end)()
end
,
},
			},
		},
	},
}}
return t