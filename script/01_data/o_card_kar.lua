--[[1020

]]
local t = {
'o_card',
{
	{
		['name']=0x10200001,
		['showname']='魔法乌鸦',
		['卡牌属性']={
			['费用']=1,
			['攻击']=2,
			['生命']=2,
		},
		['美术数据']={
			['原画']=0x56930001,
			['原画偏移X']=-3.0,
			['画家']='Daria Tuzova',
			['趣味描述']='年轻的麦迪文喜欢到处旅行，并在卡拉赞留下了许多情。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080002,
			},
			['品质']=0x10070002,
			['种族']=0x100a0006,
		},
		['局外数据']={
			['dbfid']=39350,
			['uid']='KAR_300',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200002,
		['showname']='展览馆守卫',
		['卡牌属性']={
			['费用']=6,
			['攻击']=5,
			['生命']=5,
		},
		['美术数据']={
			['原画']=0x56930002,
			['原画偏移X']=-5,
			['画家']='Alex Horley Orlandelli',
			['描述']='战吼：选择一个友方野兽，召唤一个它的复制。',
			['趣味描述']='当太阳最后的光芒消失在地平线上后，展览馆的一切都活了过来，就如同被施了魔法般活灵活现地围绕在她身旁。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080002,
			},
			['品质']=0x10070002,
			['目标指向文本']={
				[1]='召唤一个复制。',
			},
		},
		['局外数据']={
			['dbfid']=39696,
			['uid']='KAR_065',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200003,
		['showname']='月光林地传送门',
		['卡牌属性']={
			['费用']=6,
		},
		['美术数据']={
			['原画']=0x56930003,
			['画家']='Evgeniy Zaqumyennyy',
			['描述']='恢复6点生命值。随机召唤一个法力值消耗为（6）的随从。',
			['趣味描述']='没人想去月光林地开派对，因为那里有熊出没。',
		},
		['逻辑数据']={
			['类型']=0x10090005,
			['职业']={
				[1]=0x10080002,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39714,
			['uid']='KAR_075',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200004,
		['showname']='豹子戏法',
		['卡牌属性']={
			['费用']=2,
		},
		['美术数据']={
			['原画']=0x56990001,
			['画家']='Mike Sass',
			['描述']='奥秘：在你的对手施放一个法术后，召唤一个4/2并具有潜行的猎豹。',
			['趣味描述']='我最近学了新的戏法，都是很棒的戏法，就连麦迪文也没有见识过。',
		},
		['逻辑数据']={
			['类型']=0x10090005,
			['职业']={
				[1]=0x10080003,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39160,
			['uid']='KAR_004',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200005,
		['showname']='绅士豹',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=3,
			['攻击']=4,
			['生命']=2,
		},
		['美术数据']={
			['原画']=0x56990002,
			['原画偏移X']=3.0,
			['画家']='Mike Sass',
			['描述']='潜行',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080003,
			},
			['品质']=0x10070001,
			['种族']=0x100a0006,
		},
		['局外数据']={
			['dbfid']=39173,
			['uid']='KAR_004a',
		},
	},
	{
		['name']=0x10200006,
		['showname']='慈祥的外婆',
		['卡牌属性']={
			['费用']=2,
			['攻击']=1,
			['生命']=1,
		},
		['美术数据']={
			['原画']=0x56990003,
			['原画偏移X']=-5,
			['原画缩放X']=1.05,
			['原画缩放Y']=1.05,
			['画家']='Matt Dixon',
			['描述']='亡语：召唤一只3/2的大灰狼。',
			['趣味描述']='当这位“外婆”亮出她的尖牙和利爪时，就显得不那么慈祥了。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080003,
			},
			['品质']=0x10070002,
			['种族']=0x100a0006,
		},
		['局外数据']={
			['dbfid']=39481,
			['uid']='KAR_005',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200007,
		['showname']='大灰狼',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=2,
			['攻击']=3,
			['生命']=2,
		},
		['美术数据']={
			['原画']=0x56990004,
			['原画偏移X']=-3.0,
			['原画缩放X']=1.05,
			['原画缩放Y']=1.05,
			['画家']='Matt Dixon',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080003,
			},
			['品质']=0x10070001,
			['种族']=0x100a0006,
		},
		['局外数据']={
			['dbfid']=39161,
			['uid']='KAR_005a',
		},
	},
	{
		['name']=0x10200008,
		['showname']='神秘女猎手',
		['卡牌属性']={
			['费用']=3,
			['攻击']=3,
			['生命']=4,
		},
		['美术数据']={
			['原画']=0x56990005,
			['原画偏移X']=-5,
			['画家']='Arthur Bozonnet',
			['描述']='你的奥秘法力值消耗为（0）点。',
			['趣味描述']='她将自己包裹得密不透风，就连马也一样，只为增添那一份神秘感。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080003,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39492,
			['uid']='KAR_006',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200009,
		['showname']='呓语魔典',
		['卡牌属性']={
			['费用']=1,
			['攻击']=1,
			['生命']=1,
		},
		['美术数据']={
			['原画']=0x56960001,
			['原画偏移X']=-5,
			['画家']='A. J. Nazzaro',
			['描述']='战吼：随机将一张法师法术牌置入你的手牌。',
			['趣味描述']='它梦想有一天能像《荆棘谷的青山》一样，“永远”留在冒险者的任务日志里。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080004,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39169,
			['uid']='KAR_009',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020000a,
		['showname']='麦迪文的男仆',
		['卡牌属性']={
			['费用']=2,
			['攻击']=2,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56960002,
			['画家']='Sean McNally',
			['描述']='战吼：如果你控制一个奥秘，则造成3点伤害。',
			['趣味描述']='常年伴随在麦迪文左右，就连男仆养的猴子都会七十二种戏法。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080004,
			},
			['品质']=0x10070002,
			['目标指向文本']={
				[1]='造成3点伤害。',
			},
		},
		['局外数据']={
			['dbfid']=39767,
			['uid']='KAR_092',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020000b,
		['showname']='火焰之地传送门',
		['卡牌属性']={
			['费用']=7,
		},
		['美术数据']={
			['原画']=0x56960003,
			['画家']='Gustav Schmidt',
			['描述']='造成5点伤害。随机召唤一个法力值消耗为（5）的随从。',
			['趣味描述']='火焰之地是由泰坦所铸造的一个熔火领域，用来关押拉格纳罗斯和他那群无法无天的爪牙。',
		},
		['逻辑数据']={
			['类型']=0x10090005,
			['职业']={
				[1]=0x10080004,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39715,
			['uid']='KAR_076',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020000c,
		['showname']='夜魇骑士',
		['卡牌属性']={
			['费用']=3,
			['攻击']=2,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56920001,
			['原画偏移X']=-5,
			['画家']='Luke Mancini',
			['描述']='战吼：如果你的手牌中有龙牌，便召唤两个1/1的雏龙。',
			['趣味描述']='她原本想要加入蓝龙骑士团的，可谁又能拒绝传送门的诱惑呢？',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080005,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39477,
			['uid']='KAR_010',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020000d,
		['showname']='银月城传送门',
		['卡牌属性']={
			['费用']=4,
		},
		['美术数据']={
			['原画']=0x56920002,
			['画家']='Jimmy Lo',
			['描述']='使一个随从获得+2/+2。随机召唤一个法力值消耗为（2）的随从。',
			['趣味描述']='和部落粗犷且朴素的整体风格相比，银月城可谓是东部王国的时尚之都。',
		},
		['逻辑数据']={
			['类型']=0x10090005,
			['职业']={
				[1]=0x10080005,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39716,
			['uid']='KAR_077',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020000e,
		['showname']='象牙骑士',
		['卡牌属性']={
			['费用']=6,
			['攻击']=4,
			['生命']=4,
		},
		['美术数据']={
			['原画']=0x56920003,
			['原画偏移X']=-5,
			['画家']='Zoltan Boros',
			['描述']='战吼：发现一张法术牌。为你的英雄恢复等同于其法力值消耗的生命值。',
			['趣味描述']='如何骑上去，这是一个问题。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080005,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39439,
			['uid']='KAR_057',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020000f,
		['showname']='净化',
		['卡牌属性']={
			['费用']=2,
		},
		['美术数据']={
			['原画']=0x56980001,
			['画家']='Rafael Zanchetin',
			['描述']='沉默一个友方随从，抽一张牌。',
			['趣味描述']='净化心灵的第一步，就是先把嘴闭上。',
		},
		['逻辑数据']={
			['类型']=0x10090005,
			['职业']={
				[1]=0x10080006,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39468,
			['uid']='KAR_013',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200010,
		['showname']='宴会牧师',
		['卡牌属性']={
			['费用']=4,
			['攻击']=3,
			['生命']=6,
		},
		['美术数据']={
			['原画']=0x56980002,
			['原画偏移X']=-5,
			['画家']='Paul Mafayon',
			['描述']='每当你施放一个法术，为你的英雄恢复3点生命值。',
			['趣味描述']='宴会牧师最厉害的本领，就是圣言术：吃！',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080006,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39442,
			['uid']='KAR_035',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200011,
		['showname']='玛瑙主教',
		['卡牌属性']={
			['费用']=5,
			['攻击']=3,
			['生命']=4,
		},
		['美术数据']={
			['原画']=0x56980003,
			['原画偏移X']=-5,
			['画家']='Arthur Gimaldinov',
			['描述']='战吼：召唤一个在本局对战中死亡的友方随从。',
			['趣味描述']='人生如棋，落子无悔。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080006,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39374,
			['uid']='KAR_204',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200012,
		['showname']='吹嘘海盗',
		['卡牌属性']={
			['费用']=1,
			['攻击']=1,
			['生命']=1,
		},
		['美术数据']={
			['原画']=0x56970001,
			['画家']='Zoltan Boros',
			['描述']='战吼：随机将一张（你对手职业的）卡牌置入你的手牌。',
			['趣味描述']='只要两杯朗姆酒，他就能吹上一整天！',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080007,
			},
			['品质']=0x10070002,
			['种族']=0x100a0004,
		},
		['局外数据']={
			['dbfid']=39698,
			['uid']='KAR_069',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200013,
		['showname']='致命餐叉',
		['卡牌属性']={
			['费用']=3,
			['攻击']=3,
			['生命']=2,
		},
		['美术数据']={
			['原画']=0x56970002,
			['原画偏移X']=-5,
			['画家']='Konstantin Turovec',
			['描述']='亡语：将一张3/2的武器牌置入你的手牌。',
			['趣味描述']='餐叉既可以用来吃饭，也可以用来……消灭对手。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080007,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39822,
			['uid']='KAR_094',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200014,
		['showname']='锋利餐叉',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=3,
			['攻击']=3,
			['生命']=2,
		},
		['美术数据']={
			['原画']=0x56970003,
			['原画缩放X']=0.9,
			['原画缩放Y']=0.9,
			['画家']='Konstantin Turovec',
		},
		['逻辑数据']={
			['类型']=0x10090006,
			['职业']={
				[1]=0x10080007,
			},
			['品质']=0x10070001,
		},
		['局外数据']={
			['dbfid']=39821,
			['uid']='KAR_094a',
		},
	},
	{
		['name']=0x10200015,
		['showname']='虚灵商人',
		['卡牌属性']={
			['费用']=5,
			['攻击']=5,
			['生命']=6,
		},
		['美术数据']={
			['原画']=0x56970004,
			['画家']='Alex Horley Orlandelli',
			['描述']='战吼：如果你的手牌中有其他职业的卡牌，则其法力值消耗减少（2）点。',
			['趣味描述']='虚灵以热衷收集和买卖各种魔法物品和神器而著称，比那些贪婪的地精靠谱多了。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080007,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39700,
			['uid']='KAR_070',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200016,
		['showname']='幽灵之爪',
		['卡牌属性']={
			['费用']=2,
			['攻击']=1,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x569a0001,
			['原画缩放X']=0.9,
			['原画缩放Y']=0.9,
			['画家']='Ralph Horsley',
			['描述']='当你拥有法术伤害时，获得+2攻击力。',
			['趣味描述']='比起那些钢爪骨爪，幽灵之爪伸出来时一点都不疼。',
		},
		['逻辑数据']={
			['类型']=0x10090006,
			['职业']={
				[1]=0x10080008,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39694,
			['uid']='KAR_063',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200017,
		['showname']='大漩涡传送门',
		['卡牌属性']={
			['费用']=2,
		},
		['美术数据']={
			['原画']=0x569a0002,
			['原画偏移Y']=5.0,
			['画家']='Daria Tuzova',
			['描述']='对所有敌方随从造成1点伤害。随机召唤一个法力值消耗为（1）的随从。',
			['趣味描述']='坊间传闻这是当下最热门的一个度假胜地，旱鸭子和深海恐惧者谢绝前往！',
		},
		['逻辑数据']={
			['类型']=0x10090005,
			['职业']={
				[1]=0x10080008,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39712,
			['uid']='KAR_073',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200018,
		['showname']='邪恶的巫医',
		['卡牌属性']={
			['费用']=4,
			['攻击']=3,
			['生命']=4,
		},
		['美术数据']={
			['原画']=0x569a0003,
			['原画偏移X']=-5,
			['画家']='Rafael Zanchetin',
			['描述']='每当你施放一个法术，随机召唤一个基础图腾。',
			['趣味描述']='对付女巫有两种办法：要么对她造成4点伤害，要么点燃她脚下的那堆柴火。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080008,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39190,
			['uid']='KAR_021',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200019,
		['showname']='玛克扎尔的小鬼',
		['卡牌属性']={
			['费用']=1,
			['攻击']=1,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56950001,
			['原画偏移X']=-3.0,
			['画家']='Peter Stapleton',
			['描述']='每当你弃掉一张牌时，抽一张牌。',
			['趣味描述']='玛克扎尔曾有个叫多比的手下，不过那是一个悲伤的故事了。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080009,
			},
			['品质']=0x10070002,
			['种族']=0x100a0007,
		},
		['局外数据']={
			['dbfid']=39740,
			['uid']='KAR_089',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020001a,
		['showname']='镀银魔像',
		['卡牌属性']={
			['费用']=3,
			['攻击']=3,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56950002,
			['原画偏移X']=-5,
			['画家']='Daren Bader',
			['描述']='如果你弃掉了这张随从牌，则会召唤它。',
			['趣味描述']='听说镀银魔像是由设计出侏儒军刀的神秘部门研发而成的。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080009,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39380,
			['uid']='KAR_205',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020001b,
		['showname']='附灵术',
		['卡牌属性']={
			['费用']=5,
		},
		['美术数据']={
			['原画']=0x56950003,
			['画家']='Jakub Kasper',
			['描述']='召唤一个1/1的蜡烛，2/2的扫帚和3/3的茶壶。',
			['趣味描述']='瞧见没，这就是让卡德加去布置餐桌的后果。',
		},
		['逻辑数据']={
			['类型']=0x10090005,
			['职业']={
				[1]=0x10080009,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39197,
			['uid']='KAR_025',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020001c,
		['showname']='蜡烛',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=1,
			['攻击']=1,
			['生命']=1,
		},
		['美术数据']={
			['原画']=0x56950004,
			['原画偏移X']=-8.0,
			['原画缩放X']=1.05,
			['原画缩放Y']=1.05,
			['画家']='Matt O\'Connor',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080009,
			},
			['品质']=0x10070001,
		},
		['局外数据']={
			['dbfid']=39199,
			['uid']='KAR_025a',
		},
	},
	{
		['name']=0x1020001d,
		['showname']='扫帚',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=2,
			['攻击']=2,
			['生命']=2,
		},
		['美术数据']={
			['原画']=0x56950005,
			['原画偏移X']=-5,
			['画家']='Jim Nelson',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080009,
			},
			['品质']=0x10070001,
		},
		['局外数据']={
			['dbfid']=39198,
			['uid']='KAR_025b',
		},
	},
	{
		['name']=0x1020001e,
		['showname']='茶壶',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=3,
			['攻击']=3,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56950006,
			['原画偏移X']=-5,
			['画家']='Sam Nielson',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080009,
			},
			['品质']=0x10070001,
		},
		['局外数据']={
			['dbfid']=39200,
			['uid']='KAR_025c',
		},
	},
	{
		['name']=0x1020001f,
		['showname']='保卫国王',
		['卡牌属性']={
			['费用']=3,
		},
		['美术数据']={
			['原画']=0x56940001,
			['画家']='Jim Nelson',
			['描述']='战场上每有一个敌方随从，便召唤一个1/1并具有嘲讽的禁卫。',
			['趣味描述']='要想伤害国王，得先从我们的尸体上踏过去！',
		},
		['逻辑数据']={
			['类型']=0x10090005,
			['职业']={
				[1]=0x1008000a,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39495,
			['uid']='KAR_026',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200020,
		['showname']='禁卫',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=1,
			['攻击']=1,
			['生命']=1,
		},
		['美术数据']={
			['原画']=0x56940002,
			['原画偏移X']=-5,
			['描述']='嘲讽',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x1008000a,
			},
			['品质']=0x10070001,
		},
		['局外数据']={
			['dbfid']=40501,
			['uid']='KAR_026t',
		},
	},
	{
		['name']=0x10200021,
		['showname']='愚者之灾',
		['卡牌属性']={
			['费用']=5,
			['攻击']=3,
			['生命']=4,
		},
		['美术数据']={
			['原画']=0x56940003,
			['原画缩放X']=0.9,
			['原画缩放Y']=0.9,
			['画家']='Anton Zemskov',
			['描述']='每个回合攻击次数不限，但无法攻击英雄。',
			['趣味描述']='傻人不一定有傻福。',
		},
		['逻辑数据']={
			['类型']=0x10090006,
			['职业']={
				[1]=0x1008000a,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39417,
			['uid']='KAR_028',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200022,
		['showname']='铁炉堡传送门',
		['卡牌属性']={
			['费用']=5,
		},
		['美术数据']={
			['原画']=0x56940004,
			['画家']='Nate Bowden',
			['描述']='获得4点护甲值。随机召唤一个法力值消耗为（4）的随从。',
			['趣味描述']='铁炉堡坐落在白雪皑皑的丹莫罗山顶，是艾泽拉斯联盟矮人和侏儒的主城。',
		},
		['逻辑数据']={
			['类型']=0x10090005,
			['职业']={
				[1]=0x1008000a,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39747,
			['uid']='KAR_091',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200023,
		['showname']='符文蛋',
		['卡牌属性']={
			['费用']=1,
			['攻击']=0,
			['生命']=2,
		},
		['美术数据']={
			['原画']=0x56910001,
			['原画偏移X']=-5,
			['画家']='A. J. Nazzaro',
			['描述']='亡语：抽一张牌。',
			['趣味描述']='符文蛋饼异常美味，鲜香嫩滑回味无穷！',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39433,
			['uid']='KAR_029',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200024,
		['showname']='奥术畸体',
		['卡牌属性']={
			['费用']=1,
			['攻击']=2,
			['生命']=1,
		},
		['美术数据']={
			['原画']=0x56910002,
			['原画偏移X']=-5,
			['画家']='Alex Alexandrov',
			['描述']='每当你施放一个法术，该随从便获得+1生命值。',
			['趣味描述']='他原本是一个时空畸体，在厌倦了两极颠倒的生活后变成了现在这个模样。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070002,
			['种族']=0x100a0009,
		},
		['局外数据']={
			['dbfid']=39215,
			['uid']='KAR_036',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200025,
		['showname']='自负的演员',
		['卡牌属性']={
			['费用']=2,
			['攻击']=3,
			['生命']=2,
		},
		['美术数据']={
			['原画']=0x56910003,
			['原画偏移X']=-5,
			['原画缩放X']=1.05,
			['原画缩放Y']=1.05,
			['画家']='Matt Dixon',
			['描述']='嘲讽',
			['趣味描述']='曾经有人匿名送给他一本书，叫《演员的自我修养》。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39476,
			['uid']='KAR_011',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200026,
		['showname']='虚空幽龙史学家',
		['卡牌属性']={
			['费用']=2,
			['攻击']=1,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56910004,
			['原画缩放X']=1.05,
			['原画缩放Y']=1.05,
			['画家']='Ralph Horsley',
			['描述']='战吼：如果你的手牌中有龙牌，便发现一张龙牌。',
			['趣味描述']='她会告诉你当年那些没挡着绿光的人，现在都回家带孩子去了！',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39554,
			['uid']='KAR_062',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200027,
		['showname']='橱柜蜘蛛',
		['卡牌属性']={
			['费用']=3,
			['攻击']=1,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56910005,
			['原画偏移X']=-5,
			['画家']='Dave Allsop',
			['描述']='战吼：召唤一只1/3的蜘蛛。',
			['趣味描述']='不得不说，它俩还挺有夫妻相的。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070002,
			['种族']=0x100a0006,
		},
		['局外数据']={
			['dbfid']=39207,
			['uid']='KAR_030a',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200028,
		['showname']='地窖蜘蛛',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=3,
			['攻击']=1,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56910006,
			['原画偏移X']=-5,
			['画家']='Dave Allsop',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070001,
			['种族']=0x100a0006,
		},
		['局外数据']={
			['dbfid']=39206,
			['uid']='KAR_030',
		},
	},
	{
		['name']=0x10200029,
		['showname']='莫罗斯',
		['卡牌属性']={
			['费用']=3,
			['攻击']=1,
			['生命']=1,
		},
		['美术数据']={
			['原画']=0x56910008,
			['原画偏移X']=-5,
			['画家']='Sean McNally',
			['描述']='潜行，在你的回合结束时，召唤一个1/1的家仆。',
			['趣味描述']='虽然莫罗斯管理着卡拉赞众多的家仆，但给气球充气这种活还得他自己来干。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070005,
			['是精英']=true,
		},
		['局外数据']={
			['dbfid']=39453,
			['uid']='KAR_044',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020002a,
		['showname']='家仆',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=1,
			['攻击']=1,
			['生命']=1,
		},
		['美术数据']={
			['原画']=0x56910007,
			['原画偏移X']=-5,
			['画家']='Max Grecke',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070001,
		},
		['局外数据']={
			['dbfid']=39232,
			['uid']='KAR_044a',
		},
	},
	{
		['name']=0x1020002b,
		['showname']='机械动物管理员',
		['卡牌属性']={
			['费用']=3,
			['攻击']=3,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56910009,
			['原画偏移X']=-5,
			['原画缩放X']=1.05,
			['原画缩放Y']=1.05,
			['画家']='Matt Dixon',
			['描述']='战吼：随机使一个友方野兽，龙和鱼人获得+1/+1。',
			['趣味描述']='猜猜鱼人在哪里？<咔嚓>',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070002,
			['种族']=0x100a0005,
		},
		['局外数据']={
			['dbfid']=39839,
			['uid']='KAR_095',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020002c,
		['showname']='紫罗兰法师',
		['卡牌属性']={
			['费用']=3,
			['攻击']=4,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x5691000a,
			['原画偏移X']=-5,
			['画家']='Eric Braddock',
			['描述']='在你的回合时，你的英雄会获得免疫。',
			['趣味描述']='自从加入到紫罗兰之眼后，困扰她多年的近视问题终于解决了。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39313,
			['uid']='KAR_712',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020002d,
		['showname']='奥能铁匠',
		['卡牌属性']={
			['费用']=4,
			['攻击']=3,
			['生命']=2,
		},
		['美术数据']={
			['原画']=0x5691000b,
			['原画偏移X']=-5,
			['原画偏移Y']=5.0,
			['画家']='Anton Zemskov',
			['描述']='战吼：召唤一个0/5并具有嘲讽的随从。',
			['趣味描述']='除去这个花哨的头衔，他就是一名普通的铁匠。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39491,
			['uid']='KAR_710',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x1020002e,
		['showname']='复活的盾牌',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=2,
			['攻击']=0,
			['生命']=5,
		},
		['美术数据']={
			['原画']=0x5691000c,
			['原画偏移X']=-5,
			['画家']='Anton Zemskov',
			['描述']='嘲讽',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070001,
		},
		['局外数据']={
			['dbfid']=39308,
			['uid']='KAR_710m',
		},
	},
	{
		['name']=0x1020002f,
		['showname']='鸟禽守护者',
		['卡牌属性']={
			['费用']=5,
			['攻击']=3,
			['生命']=6,
		},
		['美术数据']={
			['原画']=0x5691000d,
			['原画偏移X']=3.0,
			['画家']='Jim Nelson',
			['描述']='战吼：如果你控制一个奥秘，便获得+1/+1和嘲讽。',
			['趣味描述']='浪漫喜剧类节目是他的最爱。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070003,
		},
		['局外数据']={
			['dbfid']=39489,
			['uid']='KAR_037',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200030,
		['showname']='玛克扎尔王子',
		['卡牌属性']={
			['费用']=5,
			['攻击']=5,
			['生命']=6,
		},
		['美术数据']={
			['原画']=0x5691000e,
			['原画偏移X']=-5,
			['画家']='Joe Madureira & Grace Liu',
			['描述']='对战开始时：额外将五张传说随从牌置入你的牌库。',
			['趣味描述']='玛克扎尔在一次淘旧货时买到了血吼。但是当他发现这把传奇武器是赝品时，气得把整个旧货市场都送进了扭曲虚空。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070005,
			['种族']=0x100a0007,
			['是精英']=true,
		},
		['局外数据']={
			['dbfid']=39840,
			['uid']='KAR_096',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200031,
		['showname']='巴内斯',
		['卡牌属性']={
			['费用']=5,
			['攻击']=3,
			['生命']=4,
		},
		['美术数据']={
			['原画']=0x5691000f,
			['原画偏移X']=-5,
			['画家']='Garrett Hanna',
			['描述']='战吼：随机挑选你牌库里的一个随从，召唤一个1/1的复制。',
			['趣味描述']='他之前能扮演任何角色，直到莫罗斯没收了他的欺诈宝珠。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070005,
			['是精英']=true,
		},
		['局外数据']={
			['dbfid']=39941,
			['uid']='KAR_114',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200032,
		['showname']='展览馆法师',
		['卡牌属性']={
			['费用']=5,
			['攻击']=4,
			['生命']=4,
		},
		['美术数据']={
			['原画']=0x56910010,
			['原画偏移X']=-5,
			['画家']='Garrett Hanna',
			['描述']='战吼：随机使一个友方野兽，龙和鱼人获得+2/+2。',
			['趣味描述']='每当他有新的戏法时，就会引来众多的围观及解密。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070002,
		},
		['局外数据']={
			['dbfid']=39269,
			['uid']='KAR_702',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200033,
		['showname']='书卷之龙',
		['卡牌属性']={
			['费用']=6,
			['攻击']=3,
			['生命']=6,
		},
		['美术数据']={
			['原画']=0x56910011,
			['原画偏移X']=-8.0,
			['画家']='Dave Allsop',
			['描述']='战吼：如果你的手牌中有龙牌，则消灭一个攻击力小于或等于3的敌方随从。',
			['趣味描述']='他最喜欢中古奇幻类的书籍，例如《戒指王》和《霜与火之歌》。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070003,
			['种族']=0x100a0003,
			['目标指向文本']={
				[1]='消灭一个攻击力小于或等于3的敌方随从。',
			},
		},
		['局外数据']={
			['dbfid']=39210,
			['uid']='KAR_033',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200034,
		['showname']='沟渠潜伏者',
		['卡牌属性']={
			['费用']=6,
			['攻击']=3,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56910012,
			['原画偏移X']=-5,
			['画家']='Jerry Mascho',
			['描述']='战吼：消灭一个随从。亡语：再次召唤被消灭的随从。',
			['趣味描述']='他最喜欢潜水了，只看看不说话的那种。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070003,
			['目标指向文本']={
				[1]='消灭一个随从。',
			},
		},
		['局外数据']={
			['dbfid']=39465,
			['uid']='KAR_041',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200035,
		['showname']='馆长',
		['卡牌属性']={
			['费用']=7,
			['攻击']=4,
			['生命']=6,
		},
		['美术数据']={
			['原画']=0x56910013,
			['原画缩放X']=1.05,
			['原画缩放Y']=1.05,
			['画家']='Wei Wang',
			['描述']='嘲讽，战吼：从你的牌库中抽一张野兽牌、龙牌和鱼人牌。',
			['趣味描述']='年久失修的馆长，脾气也变得十分古怪。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070005,
			['种族']=0x100a0005,
			['是精英']=true,
		},
		['局外数据']={
			['dbfid']=39225,
			['uid']='KAR_061',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200036,
		['showname']='守护者麦迪文',
		['卡牌属性']={
			['费用']=8,
			['攻击']=7,
			['生命']=7,
		},
		['美术数据']={
			['原画']=0x56910014,
			['原画偏移X']=-3.0,
			['画家']='James Ryman',
			['描述']='战吼：装备埃提耶什，守护者的传说之杖。',
			['趣味描述']='麦迪文为了让自己的派对更热闹，便联络古尔丹，打开了黑暗之门……',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070005,
			['是精英']=true,
		},
		['局外数据']={
			['dbfid']=39841,
			['uid']='KAR_097',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
	{
		['name']=0x10200037,
		['showname']='埃提耶什',
		['postfix']='衍生卡',
		['卡牌属性']={
			['费用']=3,
			['攻击']=1,
			['生命']=3,
		},
		['美术数据']={
			['原画']=0x56910015,
			['原画缩放X']=0.9,
			['原画缩放Y']=0.9,
			['描述']='在你施放一个法术后，随机召唤一个法力值消耗相同的随从。失去1点耐久度。',
		},
		['逻辑数据']={
			['类型']=0x10090006,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070001,
			['是精英']=true,
		},
		['局外数据']={
			['dbfid']=40360,
			['uid']='KAR_097t',
		},
	},
	{
		['name']=0x10200038,
		['showname']='奥术巨人',
		['卡牌属性']={
			['费用']=12,
			['攻击']=8,
			['生命']=8,
		},
		['美术数据']={
			['原画']=0x56910016,
			['画家']='Dan Scott',
			['描述']='在本局对战中，你每施放一个法术就会使法力值消耗减少（1）点。',
			['趣味描述']='表面上他们是被卡拉赞的魔法吸引所至，但实际上他们的最爱是莫罗斯的厨艺。',
		},
		['逻辑数据']={
			['类型']=0x10090004,
			['职业']={
				[1]=0x10080001,
			},
			['品质']=0x10070004,
		},
		['局外数据']={
			['dbfid']=39426,
			['uid']='KAR_711',
			['扩展包']=0x100b000a,
			['可收集']=true,
		},
	},
}}
return t