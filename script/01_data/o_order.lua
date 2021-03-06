--[[1004

]]
local t = {
'o_order',
{
	{
		['name']=0x10040001,
		['showname']='无目标指令',
		['状态列表']={
			[1]={
				['监测列表']={
					['__1']=0x10050001,
					['__2']=0x10050012,
					['__3']=0x10050014,
				},
				['跳转节点']={
					[1]=0,
					[2]=0,
					[3]=2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=0,
					[3]=-2,
				},
			},
			[2]={
				['监测列表']={
					['__1']=0x10050005,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=3,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=-2,
					[2]=-2,
				},
			},
			[3]={
				['监测列表']={
					['__1']=0x10050008,
					['__2']=0x10050006,
					['__3']=0x1005000d,
				},
				['跳转节点']={
					[1]=-1,
					[2]=-2,
					[3]=-2,
				},
				['分支跳转节点']={
					[1]=-2,
					[2]=-2,
					[3]=-2,
				},
			},
		},
	},
	{
		['name']=0x10040004,
		['showname']='随从_单目标指令',
		['状态列表']={
			[1]={
				['监测列表']={
					['__1']=0x10050001,
					['__2']=0x10050012,
					['__3']=0x10050014,
				},
				['跳转节点']={
					[1]=0,
					[2]=0,
					[3]=2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=0,
					[3]=-2,
				},
			},
			[2]={
				['监测列表']={
					['__1']=0x10050015,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=3,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=-2,
					[2]=-2,
				},
			},
			[3]={
				['监测列表']={
					['__1']=0x10050016,
					['__2']=0x10050006,
					['__3']=0x1005000d,
					['__4']=0x10050007,
				},
				['跳转节点']={
					[1]=4,
					[2]=-2,
					[3]=-2,
					[4]=0,
				},
				['分支跳转节点']={
					[1]=-1,
					[2]=-2,
					[3]=-2,
					[4]=0,
				},
			},
			[4]={
				['监测列表']={
					['__1']=0x1005000a,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=-1,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=-2,
				},
			},
		},
	},
	{
		['name']=0x10040003,
		['showname']='随从_无目标指令',
		['状态列表']={
			[1]={
				['监测列表']={
					['__1']=0x10050001,
					['__2']=0x10050012,
					['__3']=0x10050014,
				},
				['跳转节点']={
					[1]=0,
					[2]=0,
					[3]=2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=0,
					[3]=-2,
				},
			},
			[2]={
				['监测列表']={
					['__1']=0x10050015,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=3,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=-2,
					[2]=-2,
				},
			},
			[3]={
				['监测列表']={
					['__1']=0x10050008,
					['__2']=0x10050006,
					['__3']=0x1005000d,
					['__4']=0x10050007,
				},
				['跳转节点']={
					[1]=-1,
					[2]=-2,
					[3]=-2,
					[4]=0,
				},
				['分支跳转节点']={
					[1]=-2,
					[2]=-2,
					[3]=-2,
					[4]=0,
				},
			},
		},
	},
	{
		['name']=0x10040002,
		['showname']='单目标指令',
		['状态列表']={
			[1]={
				['监测列表']={
					['__1']=0x10050001,
					['__2']=0x10050012,
					['__3']=0x10050014,
				},
				['跳转节点']={
					[1]=0,
					[2]=0,
					[3]=2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=0,
					[3]=-2,
				},
			},
			[2]={
				['监测列表']={
					['__1']=0x10050002,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=3,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=-2,
					[2]=-2,
				},
			},
			[3]={
				['监测列表']={
					['__1']=0x1005000a,
					['__2']=0x10050006,
					['__3']=0x1005000d,
				},
				['跳转节点']={
					[1]=-1,
					[2]=-2,
					[3]=-2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=-2,
					[3]=-2,
				},
			},
		},
	},
	{
		['name']=0x10040005,
		['showname']='发现指令',
		['状态列表']={
			[1]={
				['监测列表']={
					['__1']=0x10050019,
				},
				['跳转节点']={
					[1]=-5,
				},
				['分支跳转节点']={
					[1]=0,
				},
			},
		},
	},
	{
		['name']=0x10040006,
		['showname']='抉择指令',
		['状态列表']={
			[1]={
				['监测列表']={
					['__1']=0x10050001,
					['__2']=0x10050012,
					['__3']=0x10050014,
				},
				['跳转节点']={
					[1]=0,
					[2]=0,
					[3]=2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=0,
					[3]=-2,
				},
			},
			[2]={
				['监测列表']={
					['__1']=0x10050005,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=3,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=-2,
					[2]=-2,
				},
			},
			[3]={
				['监测列表']={
					['__1']=0x10050008,
					['__2']=0x10050006,
					['__3']=0x1005000d,
				},
				['跳转节点']={
					[1]=4,
					[2]=-2,
					[3]=-2,
				},
				['分支跳转节点']={
					[1]=-2,
					[2]=-2,
					[3]=-2,
				},
			},
			[4]={
				['监测列表']={
					['__1']=0x1005000b,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=-1,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=5,
					[2]=-2,
				},
			},
			[5]={
				['监测列表']={
					['__1']=0x1005000a,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=-1,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=-2,
				},
			},
		},
	},
	{
		['name']=0x10040007,
		['showname']='随从_抉择指令',
	},
	{
		['name']=0x10040008,
		['showname']='战场随从_攻击指令',
		['状态列表']={
			[1]={
				['监测列表']={
					['__1']=0x10050017,
				},
				['跳转节点']={
					[1]=2,
				},
				['分支跳转节点']={
					[1]=0,
				},
			},
			[2]={
				['监测列表']={
					['__1']=0x1005000a,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=-3,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=-2,
				},
			},
		},
	},
	{
		['name']=0x1004000a,
		['showname']='英雄技能_单目标指令',
		['状态列表']={
			[1]={
				['监测列表']={
					['__1']=0x10050001,
					['__2']=0x10050012,
					['__3']=0x10050018,
				},
				['跳转节点']={
					[1]=0,
					[2]=0,
					[3]=2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=0,
					[3]=-2,
				},
			},
			[2]={
				['监测列表']={
					['__1']=0x1005000a,
					['__2']=0x1005000d,
				},
				['跳转节点']={
					[1]=-4,
					[2]=-2,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=-2,
				},
			},
		},
	},
	{
		['name']=0x1004000c,
		['showname']='英雄技能_无目标指令',
		['状态列表']={
			[1]={
				['监测列表']={
					['__1']=0x10050001,
					['__2']=0x10050012,
					['__3']=0x1005001a,
				},
				['跳转节点']={
					[1]=0,
					[2]=0,
					[3]=-4,
				},
				['分支跳转节点']={
					[1]=0,
					[2]=0,
					[3]=-2,
				},
			},
		},
	},
	{
		['name']=0x1004000b,
		['showname']='英雄技能_抉择指令',
	},
	{
		['name']=0x10040009,
		['showname']='英雄_攻击指令',
	},
}}
return t