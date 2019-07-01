--[[1001

]]
local t = {
'o_animquest',
{
	{
		['name']=0x10010001,
		['showname']='卡牌平移',
		['is_mono']=false,
		['time']=1000,
		['iter']={n=4,[1] = '动画系统_平移',
			[2]='::Card',
			[3]=100,
			[4]=-100,
		},
	},
	{
		['name']=0x10010002,
		['showname']='卡牌缩小',
		['is_mono']=true,
		['time']=1000,
		['iter']={n=3,[1] = '动画系统_缩放',
			[2]='::Card',
			[3]=0.3,
		},
	},
	{
		['name']=0x10010003,
		['showname']='卡牌_更改费用',
		['is_mono']=false,
		['time']=1000,
		['iter']={n=3,[1] = '动画系统_更改费用',
			[2]='::Card',
			[3]=100,
		},
	},
}}
return t