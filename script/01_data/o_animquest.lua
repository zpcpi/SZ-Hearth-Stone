--[[1001

]]
local t = {
'o_animquest',
{
	{
		['name']=0x10010005,
		['showname']='手牌复位(1)',
		['class']={n=1,[1] = '手牌复位动画生成',
			[2]={
				[1]=0x10010005,
				[2]=0x10010006,
				[3]=0x10010007,
				[4]=0x10010008,
				[5]=0x10010009,
				[6]=0x1001000a,
				[7]=0x1001000b,
				[8]=0x1001000c,
				[9]=0x1001000d,
				[10]=0x1001000e,
			},
		},
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=0.0,
					[2]=10.0,
					[3]=0.0,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x10010006,
		['showname']='手牌复位(2)',
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-90.230346986377,
					[2]=1.7067746423076,
					[3]=-10.50279726654,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[2]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[2]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=12.961040607329,
					[2]=9.8302854781376,
					[3]=1.5003996095057,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x10010007,
		['showname']='手牌复位(3)',
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-140.62400750747,
					[2]=-10.395018449514,
					[3]=-16.504395704563,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[2]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[2]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-38.847577584063,
					[2]=8.4732674784422,
					[3]=-4.5011988285172,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[3]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[3]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=64.627579323215,
					[2]=5.762952952667,
					[3]=7.5019980475286,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x10010008,
		['showname']='手牌复位(4)',
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-189.47614170862,
					[2]=-27.699451429134,
					[3]=-22.505994142586,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[2]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[2]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-90.230346986377,
					[2]=1.7067746423076,
					[3]=-10.50279726654,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[3]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[3]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=12.961040607329,
					[2]=9.8302854781376,
					[3]=1.5003996095057,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[4]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[4]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=115.58566778023,
					[2]=-3.684143826741,
					[3]=13.503596485552,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x10010009,
		['showname']='手牌复位(5)',
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-236.25123042782,
					[2]=-50.016832370099,
					[3]=-28.507592580609,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[2]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[2]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-140.62400750747,
					[2]=-10.395018449514,
					[3]=-16.504395704563,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[3]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[3]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-38.847577584063,
					[2]=8.4732674784422,
					[3]=-4.5011988285172,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[4]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[4]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=64.627579323215,
					[2]=5.7629529526669,
					[3]=7.5019980475287,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[5]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[5]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=165.27670125674,
					[2]=-18.407445385493,
					[3]=19.505194923574,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x1001000a,
		['showname']='手牌复位(6)',
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-229.38783047973,
					[2]=-46.358662199057,
					[3]=-27.607352814905,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[2]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[2]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-153.00281256226,
					[2]=-14.239828205447,
					[3]=-18.004795314069,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[3]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[3]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-72.33022500026,
					[2]=4.6869801734694,
					[3]=-8.4022378132321,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[4]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[4]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=10.369259139002,
					[2]=9.8913804714205,
					[3]=1.2003196876046,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[5]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[5]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=92.778167438668,
					[2]=1.2275307371256,
					[3]=10.802877188441,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[6]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[6]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=172.58717023514,
					[2]=-21.061783563557,
					[3]=20.405434689278,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x1001000b,
		['showname']='手牌复位(7)',
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-224.78066524849,
					[2]=-43.979986247283,
					[3]=-27.007192971103,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[2]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[2]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-161.19758347287,
					[2]=-16.982544040817,
					[3]=-19.005061720406,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[3]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[3]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-94.475304875943,
					[2]=0.90062437559976,
					[3]=-11.002930469709,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[4]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[4]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-25.913193631589,
					[2]=9.3212582883845,
					[3]=-3.0007992190115,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[5]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[5]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=43.153556784927,
					[2]=8.1153724401725,
					[3]=5.0013320316858,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[6]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[6]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=111.37992544528,
					[2]=-2.6935494855963,
					[3]=13.003463282383,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[7]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[7]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=177.43725719837,
					[2]=-22.895012191039,
					[3]=21.00559453308,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x1001000c,
		['showname']='手牌复位(8)',
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-221.4747036425,
					[2]=-42.310542652677,
					[3]=-26.578507368387,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[2]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[2]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-167.02105763042,
					[2]=-19.029007010076,
					[3]=-19.719537724932,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[3]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[3]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-110.1767119969,
					[2]=-2.4172691304081,
					[3]=-12.860568081478,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[4]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[4]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-51.755323160556,
					[2]=7.2868945285324,
					[3]=-6.0015984380229,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[5]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[5]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=7.40687903934,
					[2]=9.944580880422,
					[3]=0.85737120543185,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[6]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[6]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=66.463060937565,
					[2]=5.5177484360883,
					[3]=7.7163408488866,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[7]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[7]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=124.56790641823,
					[2]=-5.9302381796782,
					[3]=14.575310492341,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[8]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[8]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=180.88971656823,
					[2]=-24.235515214265,
					[3]=21.434280135796,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x1001000d,
		['showname']='手牌复位(9)',
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-218.98708604723,
					[2]=-41.074717835822,
					[3]=-26.25699316635,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[2]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[2]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-171.37166887776,
					[2]=-20.61142229158,
					[3]=-20.255394728327,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[3]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[3]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-121.87766822351,
					[2]=-5.2387739839739,
					[3]=-14.253796290304,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[4]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[4]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-71.047639413668,
					[2]=4.8747114658455,
					[3]=-8.2521978522815,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[5]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[5]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-19.438783374624,
					[2]=9.6181696024869,
					[3]=-2.2505994142586,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[6]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[6]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=32.383161430208,
					[2]=8.9396024371655,
					[3]=3.7509990237643,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[7]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[7]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=83.850120649344,
					[2]=2.846448451857,
					[3]=9.7525974617872,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[8]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[8]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=134.39791129831,
					[2]=-8.5944989416565,
					[3]=15.75419589981,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[9]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[9]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=183.47242635739,
					[2]=-25.257823593993,
					[3]=21.755794337833,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x1001000e,
		['showname']='手牌复位(10)',
		['is_mono']=false,
		['time']=300,
		['iter']={
			[1]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[1]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-217.0475010104,
					[2]=-40.123182998776,
					[3]=-26.006926564766,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[2]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[2]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-174.74513392598,
					[2]=-21.870279328578,
					[3]=-20.672172397634,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[3]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[3]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-130.92894462697,
					[2]=-7.6294819965661,
					[3]=-15.337418230503,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[4]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[4]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-85.97851404492,
					[2]=2.4758405527679,
					[3]=-10.002664063372,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[5]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[5]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=-40.283249076838,
					[2]=8.3581456141304,
					[3]=-4.66790989624,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[6]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[6]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=5.7609908581493,
					[2]=9.9664746064448,
					[3]=0.66684427089143,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[7]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[7]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=51.755323160556,
					[2]=7.2868945285324,
					[3]=6.0015984380229,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[8]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[8]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=97.301297582181,
					[2]=0.34261866111027,
					[3]=11.336352605154,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[9]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[9]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=142.00434801228,
					[2]=-10.80619453054,
					[3]=16.671106772286,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
			[10]={n=4,[1] = '动画系统_多属性设置',
				[2]='::HandCards.c_battle_handcards_self.handCards[10]',
				[3]={
					[1]='x',
					[2]='y',
					[3]='rotation',
				},
				[4]={
					[1]=185.47721061534,
					[2]=-26.062962551121,
					[3]=22.005860939417,
				},
				[5]={
					['x1']=0,
					['y1']=0.5,
					['x2']=0.5,
					['y2']=1,
				},
			},
		},
	},
	{
		['name']=0x10010001,
		['showname']='卡牌平移',
		['is_mono']=false,
		['time']=1000,
		['iter']={
			[1]={n=4,[1] = '动画系统_属性累加',
				[2]='::Card',
				[3]='x',
				[4]=100,
			},
			[2]={n=4,[1] = '动画系统_属性累加',
				[2]='::Card',
				[3]='y',
				[4]=-100,
			},
		},
	},
	{
		['name']=0x10010002,
		['showname']='卡牌缩小',
		['is_mono']=false,
		['time']=1000,
		['iter']={
			[1]={n=4,[1] = '动画系统_属性设置',
				[2]='::Card',
				[3]='scaleX',
				[4]=0.3,
			},
			[2]={n=4,[1] = '动画系统_属性设置',
				[2]='::Card',
				[3]='scaleY',
				[4]=0.3,
			},
		},
	},
	{
		['name']=0x10010003,
		['showname']='卡牌_更改费用',
		['is_mono']=true,
		['time']=1000,
		['iter']={
			[1]={n=4,[1] = '动画系统_属性设置',
				[2]='::Card.卡牌框.c_card_weapon',
				[3]='cost',
				[4]=100,
			},
		},
	},
	{
		['name']=0x10010004,
		['showname']='卡牌_更改费用',
		['is_mono']=true,
		['time']=1000,
		['iter']={
			[1]={n=4,[1] = '动画系统_属性设置',
				[2]='::Card.卡牌框.c_card_weapon',
				[3]='cost',
				[4]=-50,
			},
		},
	},
}}
return t