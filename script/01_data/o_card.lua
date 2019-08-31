--[[1006

]]
local t = {
'o_card',
{
	{
		['name']=0x10060003,
		['showname']='月火术',
		['类型']=0x10090005,
		['费用']=0,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='造成1点伤害。',
		['原画']=0x56100004,
		['原画缩放']=0.9,
		['画家']='Richard Wright',
		['趣味描述']='“把月火术拖到每一个技能栏位上。”——《如何成为一名德鲁伊》，第五章，第三节',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-18.0,
	},
	{
		['name']=0x10060004,
		['showname']='激活',
		['类型']=0x10090005,
		['费用']=0,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='在本回合中，获得一个法力水晶。',
		['原画']=0x56100007,
		['原画缩放']=0.9,
		['画家']='Doug Alexander',
		['趣味描述']='有些德鲁伊做梦时都回响着陌生人的喊叫声：“给我个激活！”',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-11.0,
	},
	{
		['name']=0x10060005,
		['showname']='爪击',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='使你的英雄获得2点护甲值，并在本回合中获得+2攻击力。',
		['原画']=0x56100008,
		['原画缩放']=0.9,
		['画家']='Dany Orizio',
		['趣味描述']='谁去谁留，都由爪子决定。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060006,
		['showname']='野性印记',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='使一个随从获得嘲讽和+2/+2。（+2攻击力/+2生命值）',
		['原画']=0x5610000b,
		['原画缩放']=0.9,
		['画家']='Brad Vancata',
		['趣味描述']='这种爪子形状的印记如果纹在身上，人们一定知道你是德鲁伊玩家。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060007,
		['showname']='治疗之触',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='恢复8点生命值。',
		['原画']=0x56100006,
		['原画缩放']=0.9,
		['画家']='Cyril Van Der Haegen',
		['趣味描述']='见效快，疗效好，无毒副作用。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060008,
		['showname']='野性成长',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='获得一个空的法力水晶。',
		['原画']=0x5610000c,
		['原画缩放']=0.9,
		['画家']='James Ryman',
		['趣味描述']='使用法力水晶增长装置增加你的法力值，只要399！',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['延伸卡']={
			[1]=0x1006000d,
		},
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060009,
		['showname']='野蛮咆哮',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='在本回合中，使你的所有角色获得+2攻击力。',
		['原画']=0x56100001,
		['原画缩放']=0.9,
		['画家']='Grace Liu',
		['趣味描述']='显然这对火元素和水元素也有作用。难道这说明元素也是长耳朵的吗？',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x1006000a,
		['showname']='横扫',
		['类型']=0x10090005,
		['费用']=4,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='对一个敌人造成4点伤害，并对所有其他敌人造成1点伤害。',
		['原画']=0x56100005,
		['原画缩放']=0.9,
		['画家']='Sean O’Daniels',
		['趣味描述']='当一只熊向后仰身张开它的前臂时，他就要横扫！...或者拥抱你了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移X']=-4.0,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x1006000b,
		['showname']='星火术',
		['类型']=0x10090005,
		['费用']=6,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='造成5点伤害。抽一张牌。',
		['原画']=0x56100003,
		['原画缩放']=0.9,
		['画家']='Alex Horley Orlandelli',
		['趣味描述']='平衡对德鲁伊来说很重要。这张卡牌现在就很平衡了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x1006000c,
		['showname']='埃隆巴克保护者',
		['类型']=0x10090004,
		['费用']=8,
		['攻击']=8,
		['生命']=8,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='嘲讽',
		['原画']=0x56100002,
		['画家']='Dave Allsop',
		['趣味描述']='我打赌你一定不敢进攻达纳苏斯。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-6.0,
	},
	{
		['name']=0x10060001,
		['showname']='测试卡牌',
		['卡牌指令']=0x10040001,
	},
	{
		['name']=0x10060002,
		['showname']='测试卡牌',
		['卡牌指令']=0x10040001,
	},
	{
		['name']=0x1006000d,
		['showname']='法力过剩',
		['postfix']='公用',
		['类型']=0x10090005,
		['费用']=0,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='抽一张牌。（你最多可以拥有10个法力水晶。）',
		['原画']=0x56140001,
		['原画缩放']=0.9,
		['扩展包']=0x100b0001,
		['可收集']=false,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x1006000e,
		['showname']='幸运币',
		['postfix']='公用',
		['类型']=0x10090005,
		['费用']=0,
		['职业']=0x10080001,
		['品质']=0x10070001,
		['描述']='在本回合中，获得一个法力水晶。',
		['原画']=0x56130001,
		['可收集']=false,
	},
	{
		['name']=0x1006000f,
		['showname']='变形',
		['类型']=0x10090003,
		['费用']=2,
		['职业']=0x10080002,
		['品质']=0x10070001,
		['描述']='英雄技能[br]本回合+1攻击力。[br]+1护甲值。',
		['原画']=0x56140002,
		['可收集']=false,
	},
	{
		['name']=0x10060010,
		['showname']='奥术射击',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['描述']='造成2点伤害。',
		['原画']=0x56150004,
		['原画缩放']=0.9,
		['画家']='Luca Zontini',
		['趣味描述']='法师们用奥术强化箭矢，然后出售给猎人；后来猎人们自己学会了足够的魔法之后便能够自给自足。不少法师因此失业，给暴风城的经济带来不小的冲击。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060011,
		['showname']='森林狼',
		['类型']=0x10090004,
		['费用']=1,
		['攻击']=1,
		['生命']=1,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['种族']=0x100a0006,
		['描述']='你的其他野兽获得+1攻击力。',
		['原画']=0x56150006,
		['画家']='Malcolm Davis',
		['趣味描述']='其他野兽最喜欢和森林狼一起外出打猎了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-6.0,
	},
	{
		['name']=0x10060012,
		['showname']='追踪术',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['描述']='检视你的牌库顶的三张牌，将其中一张置入手牌，弃掉其余牌。',
		['原画']=0x56150008,
		['原画缩放']=0.9,
		['画家']='Mauro Cascioli',
		['趣味描述']='为了那些不知道该把什么牌放入套牌的人准备的！',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060013,
		['showname']='猎人印记',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['描述']='使一个随从的生命值变为1。',
		['原画']=0x56150007,
		['原画缩放']=0.9,
		['画家']='Jimmy Lo',
		['趣味描述']='千万不要和猎人玩捉迷藏的游戏。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060014,
		['showname']='动物伙伴',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['描述']='随机召唤一个野兽伙伴。',
		['原画']=0x56150001,
		['原画缩放']=0.9,
		['画家']='Wei Wang',
		['趣味描述']='你可以召唤米莎，雷欧克或是霍弗！霍弗又没用，又爱惹麻烦！',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060015,
		['showname']='杀戮命令',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['描述']='造成3点伤害。如果你控制一个野兽，则改为造成5点伤害。',
		['原画']=0x56150005,
		['原画缩放']=0.9,
		['画家']='Gabe from Penny Arcade',
		['趣味描述']='“咬死他！”，他下达了命令。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移X']=-4.0,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060016,
		['showname']='多重射击',
		['类型']=0x10090005,
		['费用']=4,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['描述']='对两个随机敌方随从造成3点伤害。',
		['原画']=0x56150002,
		['原画缩放']=0.9,
		['画家']='Benjamin Zhang',
		['趣味描述']='看见没，我完全可以“一心两用”。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-14.0,
	},
	{
		['name']=0x10060017,
		['showname']='驯兽师',
		['类型']=0x10090004,
		['费用']=4,
		['攻击']=4,
		['生命']=3,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['描述']='战吼：使一个友方野兽获得+2/+2并获得嘲讽。',
		['原画']=0x5615000a,
		['画家']='Dan Brereton',
		['趣味描述']='“是谁把狗放出来的？”他问。其实，这只是他的口头禅。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-6.0,
		['目标指向文本']={
			[1]='使一只野兽获得+2/+2并具有嘲讽。',
		},
	},
	{
		['name']=0x10060018,
		['showname']='苔原犀牛',
		['类型']=0x10090004,
		['费用']=5,
		['攻击']=2,
		['生命']=5,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['种族']=0x100a0006,
		['描述']='你的野兽获得冲锋。',
		['原画']=0x56150003,
		['画家']='Lars Grant-West',
		['趣味描述']='人们经常无法分清苔原犀牛和科多兽。这是一头苔原犀牛，对不对？',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-6.0,
	},
	{
		['name']=0x10060019,
		['showname']='饥饿的秃鹫',
		['类型']=0x10090004,
		['费用']=5,
		['攻击']=3,
		['生命']=2,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['种族']=0x100a0006,
		['描述']='每当你召唤一个野兽，抽一张牌。',
		['原画']=0x56150009,
		['画家']='Bernie Kang',
		['趣味描述']='如果你喂饱了它，它就名不副实了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['原画偏移Y']=-6.0,
	},
	{
		['name']=0x1006001a,
		['showname']='稳固射击',
		['类型']=0x10090003,
		['费用']=2,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['描述']='英雄技能[br]对敌方英雄造成2点伤害。',
		['原画']=0x56160001,
		['可收集']=false,
	},
	{
		['name']=0x1006001b,
		['showname']='米莎',
		['postfix']='公用',
		['类型']=0x10090004,
		['费用']=3,
		['攻击']=4,
		['生命']=4,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['种族']=0x100a0006,
		['描述']='嘲讽',
		['原画']=0x56160002,
		['扩展包']=0x100b0001,
		['可收集']=false,
		['原画偏移Y']=-6.0,
	},
	{
		['name']=0x1006001c,
		['showname']='雷欧克',
		['postfix']='公用',
		['类型']=0x10090004,
		['费用']=3,
		['攻击']=2,
		['生命']=4,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['种族']=0x100a0006,
		['描述']='你的其他随从获得+1攻击力。',
		['原画']=0x56160003,
		['扩展包']=0x100b0001,
		['可收集']=false,
		['原画偏移Y']=-6.0,
	},
	{
		['name']=0x1006001d,
		['showname']='霍弗',
		['postfix']='公用',
		['类型']=0x10090004,
		['费用']=3,
		['攻击']=4,
		['生命']=2,
		['职业']=0x10080003,
		['品质']=0x10070001,
		['种族']=0x100a0006,
		['描述']='冲锋',
		['原画']=0x56160004,
		['扩展包']=0x100b0001,
		['可收集']=false,
		['原画偏移Y']=-6.0,
	},
	{
		['name']=0x1006001e,
		['showname']='奥术飞弹',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='造成3点伤害，随机分配到所有敌人身上。',
		['画家']='Warren Mahy',
		['趣味描述']='既然你想要做一个超级厉害的法师，就必须得把奥术飞弹控制得好一些。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006001f,
		['showname']='镜像',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='召唤两个0/2，并具有嘲讽的随从。',
		['画家']='Jim Nelson',
		['趣味描述']='哦，嘿，这是个镜像！！像镜个是这，嘿，哦',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060020,
		['showname']='寒冰箭',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='对一个角色造成3点伤害，并使其冻结。',
		['画家']='Steve Ellis',
		['趣味描述']='在你用这张牌的时候，你可以随意喊出一些咒语，比如“冻住！”“冻结！”或者“结冰，结冰吧，宝贝儿！”',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060021,
		['showname']='魔爆术',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='对所有敌方随从造成1点伤害。',
		['画家']='Howard Lyon',
		['趣味描述']='魔爆术曾是让法师们区别于艾泽拉斯其他职业的技能之一。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060022,
		['showname']='冰霜新星',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='冻结所有敌方随从。',
		['画家']='Josh Tallman',
		['趣味描述']='嘿，伙计，这会冻死你的。我是说真的。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060023,
		['showname']='奥术智慧',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='抽两张牌。',
		['画家']='Dave Berggren',
		['趣味描述']='使用这张牌能让你变得更聪明。面对现实吧：变聪明些对我们大家来说都是好事。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060024,
		['showname']='变形术',
		['类型']=0x10090005,
		['费用']=4,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='使一个随从变形成为1/1的绵羊。',
		['画家']='Vance Kovacs',
		['趣味描述']='你能想象一个嗜血的兽人发出咩咩的叫声吗？',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060025,
		['showname']='水元素',
		['类型']=0x10090004,
		['费用']=4,
		['攻击']=3,
		['生命']=6,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['种族']=0x100a0009,
		['描述']='冻结任何受到该随从伤害的角色。',
		['画家']='John Avon',
		['趣味描述']='千万别在晚会上召唤水元素。它会把一切都搞砸的。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060026,
		['showname']='火球术',
		['类型']=0x10090005,
		['费用']=4,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='造成6点伤害。',
		['画家']='Ralph Horsley',
		['趣味描述']='这个法术会让东西烧起来。如果你是在寻找能把东西烤熟，或者只是加热的法术，你就找错对象了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060027,
		['showname']='烈焰风暴',
		['类型']=0x10090005,
		['费用']=7,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='对所有敌方随从造成4点伤害。',
		['画家']='Romain De Santi',
		['趣味描述']='当地板着火的时候，无论你在地上怎么打滚，都是没用的。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060028,
		['showname']='火焰冲击',
		['类型']=0x10090003,
		['费用']=2,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='英雄技能[br]造成1点伤害。',
		['可收集']=false,
		['目标指向文本']={
			[1]='造成1点伤害。',
		},
	},
	{
		['name']=0x10060029,
		['showname']='镜像',
		['postfix']='衍生卡',
		['类型']=0x10090004,
		['费用']=0,
		['攻击']=0,
		['生命']=2,
		['职业']=0x10080004,
		['品质']=0x10070001,
		['描述']='嘲讽',
		['扩展包']=0x100b0001,
		['可收集']=false,
	},
	{
		['name']=0x1006002a,
		['showname']='保护之手',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='使一个随从获得圣盾。',
		['画家']='Clint Langley',
		['趣味描述']='这个法术的名字已经被修改了太多次，导致连圣骑士们都不知道它应该叫什么了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006002b,
		['showname']='力量祝福',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='使一个随从获得+3攻击力。',
		['画家']='Zoltan Boros',
		['趣味描述']='没有善，没有恶，也没有圣光。只有——力量！',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006002c,
		['showname']='圣光的正义',
		['类型']=0x10090006,
		['费用']=1,
		['攻击']=1,
		['生命']=4,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['画家']='Glenn Rane',
		['趣味描述']='玛克扎尔王子收集了不少稀有的武器，他赋予它们生命，并让它们为他起舞。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006002d,
		['showname']='谦逊',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='使一个随从的攻击力变为1。',
		['画家']='Daren Bader',
		['趣味描述']='这张牌真是会让人的心情很糟糕，就像潮湿阴冷的天气。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006002e,
		['showname']='圣光术',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='恢复6点生命值。',
		['画家']='Zoltan & Gabor',
		['趣味描述']='如果你经常暴露于圣光之下，你应该考虑随身带着防晒霜。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006002f,
		['showname']='奉献',
		['类型']=0x10090005,
		['费用']=4,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='对所有敌人造成2点伤害。',
		['画家']='Vance Kovacs',
		['趣味描述']='神圣的能量从圣洁的大地涌出。但是，味道也有点熏人。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060030,
		['showname']='愤怒之锤',
		['类型']=0x10090005,
		['费用']=4,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='造成3点伤害。抽一张牌。',
		['画家']='Efrem Palacios',
		['趣味描述']='一个称职的圣骑士身上会携带很多工具。愤怒之锤、复仇之钳、正义之锯，等等。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060031,
		['showname']='王者祝福',
		['类型']=0x10090005,
		['费用']=4,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='使一个随从获得+4/+4。（+4攻击力/+4生命值）',
		['画家']='Lucas Graciano',
		['趣味描述']='你知道世界上有多少所谓的“王者”被暗杀了吗？你确定还想要王者祝福吗？',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060032,
		['showname']='真银圣剑',
		['类型']=0x10090006,
		['费用']=4,
		['攻击']=4,
		['生命']=2,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='每当你的英雄进攻，便为其恢复2点生命值。',
		['画家']='Ryan Sook',
		['趣味描述']='它能用来切片，也能切块。你还可以用它来开罐头。（但你不会这么做的。）',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060033,
		['showname']='列王守卫',
		['类型']=0x10090004,
		['费用']=7,
		['攻击']=5,
		['生命']=6,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='战吼：为你的英雄恢复6点生命值。',
		['画家']='E.M. Gist',
		['趣味描述']='神圣的造物从天而降...真是老掉牙的剧情！',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060034,
		['showname']='援军',
		['类型']=0x10090003,
		['费用']=2,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['描述']='英雄技能[br]召唤一个1/1的白银之手新兵。',
		['可收集']=false,
	},
	{
		['name']=0x10060035,
		['showname']='白银之手新兵',
		['postfix']='公用',
		['类型']=0x10090004,
		['费用']=1,
		['攻击']=1,
		['生命']=1,
		['职业']=0x10080005,
		['品质']=0x10070001,
		['扩展包']=0x100b0001,
		['可收集']=false,
	},
	{
		['name']=0x10060036,
		['showname']='北郡牧师',
		['类型']=0x10090004,
		['费用']=1,
		['攻击']=1,
		['生命']=3,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='每当一个随从获得治疗时，抽一张牌。',
		['画家']='Terese Nielsen',
		['趣味描述']='她们帮助被压迫和沮丧的人们。她们也卖饼干。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060037,
		['showname']='圣光闪耀',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='为你的英雄恢复5点生命值。',
		['画家']='James Ryman',
		['趣味描述']='因为你值得！',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060038,
		['showname']='心灵视界',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='随机复制对手手牌中的一张牌，将其置入你的手牌。',
		['画家']='Michael Komarck',
		['趣味描述']='你刚才做的事情我都看见了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060039,
		['showname']='真言术：盾',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='使一个随从获得+2生命值。抽一张牌。',
		['画家']='Jessica Jung',
		['趣味描述']='额外的保护自然不错，但是这护盾阻碍了视野。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006003a,
		['showname']='神圣惩击',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='造成2点伤害。',
		['画家']='Steve Ellis',
		['趣味描述']='这和多么虔诚没有关系，每个人都需要时不时有人鞭策一下。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006003b,
		['showname']='暗言术：痛',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='消灭一个攻击力小于或等于3的随从。',
		['画家']='Raymond Swanland',
		['趣味描述']='许多侍僧学徒都会施放：“暗言术：怒”，这个法术是它的进阶法术。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006003c,
		['showname']='神圣之灵',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='使一个随从的生命值翻倍。',
		['画家']='Jim Pavelec',
		['趣味描述']='加倍的付出会得到加倍的收获！',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006003d,
		['showname']='暗言术：灭',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='消灭一个攻击力大于或等于5的随从。',
		['画家']='Raymond Swanland',
		['趣味描述']='如果你的法术没有命中，那么你的目标身上会留下一道闪电形状的伤疤。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006003e,
		['showname']='神圣新星',
		['类型']=0x10090005,
		['费用']=5,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='对所有敌人造成2点伤害，为所有友方角色恢复2点生命值。',
		['画家']='Luca Zontini',
		['趣味描述']='没有得到圣光眷顾的人切忌使用这个法术，它滋润善者，惩罚恶徒。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006003f,
		['showname']='精神控制',
		['类型']=0x10090005,
		['费用']=10,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='获得一个敌方随从的控制权。',
		['画家']='Sean O’Daniels',
		['趣味描述']='被称为“最有可能让你的对手捶地撞墙的法术。”',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060040,
		['showname']='次级治疗术',
		['类型']=0x10090003,
		['费用']=2,
		['职业']=0x10080006,
		['品质']=0x10070001,
		['描述']='英雄技能[br]恢复2点生命值。',
		['可收集']=false,
	},
	{
		['name']=0x10060041,
		['showname']='背刺',
		['类型']=0x10090005,
		['费用']=0,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='对一个未受伤的随从造成2点伤害。',
		['画家']='Michael Sutfin',
		['趣味描述']='大叫着“看那儿！”，然后让你的对手背对着你，这一招总是出奇地有效。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060042,
		['showname']='影袭',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='对敌方英雄造成3点伤害。',
		['画家']='Frank Cho',
		['趣味描述']='尽管这个技能的名字已被改变，但这并不意味着它就不再“邪恶”。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060043,
		['showname']='致命药膏',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='使你的武器获得+2攻击力。',
		['画家']='Trevor Jacobs',
		['趣味描述']='潜行者们都小心翼翼地保守着制毒的秘密，唯恐法师们把毒药用在他们的法术之中。毒性箭？剧毒之雨？毒元素？听上去就很可怕。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060044,
		['showname']='毒刃',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='造成1点伤害，抽一张牌。',
		['画家']='Alex Garner',
		['趣味描述']='毒如鹤顶，刃若清刚；图穷匕现，君命难长。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060045,
		['showname']='闷棍',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='将一个敌方随从移回你的对手的手牌。',
		['画家']='Scott Altmann',
		['趣味描述']='“潜行者”的闷棍技术比“盗贼”好很多，他们不用天赋支持，就可以保证百分之百闷棍命中。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060046,
		['showname']='刀扇',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='对所有敌方随从造成1点伤害，抽一张牌。',
		['画家']='Andrew Robinson',
		['趣味描述']='转瞬即逝的寒光闪过，漫天飞舞的血花绽放。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060047,
		['showname']='瘟疫使者',
		['类型']=0x10090004,
		['费用']=4,
		['攻击']=3,
		['生命']=3,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='战吼：使一个友方随从获得剧毒。',
		['画家']='J. Axer',
		['趣味描述']='流感的传播元凶。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060048,
		['showname']='刺客之刃',
		['类型']=0x10090006,
		['费用']=5,
		['攻击']=3,
		['生命']=4,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['画家']='Brian Huang',
		['趣味描述']='只有真正的刺客才配拥有。如假包换。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060049,
		['showname']='刺杀',
		['类型']=0x10090005,
		['费用']=5,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='消灭一个敌方随从。',
		['画家']='Glenn Rane',
		['趣味描述']='要是你不想被人暗杀，躲到贫瘠之地，然后隐姓埋名。祝你好运！',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006004a,
		['showname']='疾跑',
		['类型']=0x10090005,
		['费用']=7,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='抽四张牌。',
		['画家']='James Zhang',
		['趣味描述']='潜行者们通常都不擅长慢跑。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006004b,
		['showname']='匕首精通',
		['类型']=0x10090003,
		['费用']=2,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['描述']='英雄技能[br]装备一把1/2的匕首。',
		['可收集']=false,
	},
	{
		['name']=0x1006004c,
		['showname']='邪恶短刀',
		['类型']=0x10090006,
		['费用']=1,
		['攻击']=1,
		['生命']=2,
		['职业']=0x10080007,
		['品质']=0x10070001,
		['可收集']=false,
	},
	{
		['name']=0x1006004d,
		['showname']='先祖治疗',
		['类型']=0x10090005,
		['费用']=0,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['描述']='为一个随从恢复所有生命值并使其获得嘲讽。',
		['画家']='Dan Scott',
		['趣味描述']='你能在战斗中能够召唤祖先的灵魂！所以，出生在一个强大的家族是很重要的！',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006004e,
		['showname']='图腾之力',
		['类型']=0x10090005,
		['费用']=0,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['描述']='使你的图腾获得+2生命值。',
		['画家']='Trent Kaniuga',
		['趣味描述']='禁止踩踏图腾。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006004f,
		['showname']='冰霜震击',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['描述']='对一个敌方角色造成1点伤害，并使其冻结。',
		['画家']='Alex Horley Orlandelli',
		['趣味描述']='年轻的萨满们可能没听说过《你与冰霜震击》这本书。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060050,
		['showname']='石化武器',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['描述']='在本回合中，使一个友方角色获得+3攻击力。',
		['画家']='Alex Horley Orlandelli',
		['趣味描述']='如果你的敌人是石头做的，那就再好不过了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060051,
		['showname']='风怒',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['描述']='使一个随从获得风怒。',
		['画家']='Justin Sweet',
		['趣味描述']='比起“地怒”或是“火怒”，萨满们更喜欢使用“风怒”，因为它更轻巧，更飘逸。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060052,
		['showname']='火舌图腾',
		['类型']=0x10090005,
		['费用']=2,
		['攻击']=0,
		['生命']=3,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['种族']=0x100a0008,
		['描述']='相邻的随从获得+2攻击力。',
		['画家']='Jonathan Ryder',
		['趣味描述']='图腾制造师喜欢用最稀有的木材来打造图腾。甚至有传言说，这些图腾是由埃隆巴克保护者身上的树皮做的。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060053,
		['showname']='妖术',
		['类型']=0x10090005,
		['费用']=4,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['描述']='使一个随从变形成为一个0/1并具有嘲讽的青蛙。',
		['画家']='Steve Hui',
		['趣味描述']='如果你对一个鱼人使用妖术...其实结果也没什么变化，对不对？',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060054,
		['showname']='青蛙',
		['postfix']='衍生卡',
		['类型']=0x10090004,
		['费用']=0,
		['攻击']=0,
		['生命']=1,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['种族']=0x100a0006,
		['描述']='嘲讽',
		['扩展包']=0x100b0001,
		['可收集']=false,
	},
	{
		['name']=0x10060055,
		['showname']='风语者',
		['类型']=0x10090004,
		['费用']=4,
		['攻击']=3,
		['生命']=3,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['描述']='战吼：使一个友方随从获得风怒。',
		['画家']='Vance Kovacs',
		['趣味描述']='患有口臭的风语者...还有什么比这更糟糕的吗？',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['目标指向文本']={
			[1]='使一个随从获得风怒。',
		},
	},
	{
		['name']=0x10060056,
		['showname']='嗜血',
		['类型']=0x10090005,
		['费用']=5,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['描述']='在本回合中，使你的随从获得+3攻击力。',
		['画家']='Luca Zontini',
		['趣味描述']='呜啊哇哇哇哇哇！',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060057,
		['showname']='火元素',
		['类型']=0x10090004,
		['费用']=6,
		['攻击']=6,
		['生命']=5,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['种族']=0x100a0009,
		['描述']='战吼：造成3点伤害。',
		['画家']='Ralph Horsley',
		['趣味描述']='他从来不洗澡。嗯...',
		['扩展包']=0x100b0001,
		['可收集']=true,
		['目标指向文本']={
			[1]='造成3点伤害。',
		},
	},
	{
		['name']=0x10060058,
		['showname']='图腾召唤',
		['类型']=0x10090003,
		['费用']=2,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['描述']='英雄技能[br]随机召唤一个图腾。',
		['可收集']=false,
	},
	{
		['name']=0x10060059,
		['showname']='灼热图腾',
		['postfix']='公用',
		['类型']=0x10090004,
		['费用']=1,
		['攻击']=1,
		['生命']=1,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['种族']=0x100a0008,
		['扩展包']=0x100b0001,
		['可收集']=false,
	},
	{
		['name']=0x1006005a,
		['showname']='石爪图腾',
		['postfix']='公用',
		['类型']=0x10090004,
		['费用']=1,
		['攻击']=0,
		['生命']=2,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['种族']=0x100a0008,
		['描述']='嘲讽',
		['扩展包']=0x100b0001,
		['可收集']=false,
	},
	{
		['name']=0x1006005b,
		['showname']='空气之怒图腾',
		['postfix']='公用',
		['类型']=0x10090004,
		['费用']=1,
		['攻击']=0,
		['生命']=2,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['种族']=0x100a0008,
		['描述']='法术伤害+1',
		['扩展包']=0x100b0001,
		['可收集']=false,
	},
	{
		['name']=0x1006005c,
		['showname']='治疗图腾',
		['postfix']='公用',
		['类型']=0x10090004,
		['费用']=1,
		['攻击']=0,
		['生命']=2,
		['职业']=0x10080008,
		['品质']=0x10070001,
		['种族']=0x100a0008,
		['描述']='在你的回合结束时，为所有友方随从恢复1点生命值。',
		['扩展包']=0x100b0001,
		['可收集']=false,
	},
	{
		['name']=0x1006005d,
		['showname']='牺牲契约',
		['类型']=0x10090005,
		['费用']=0,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['描述']='牺牲一个恶魔，为你的英雄恢复5点生命值。',
		['画家']='Jim Nelson',
		['趣味描述']='这就是为何恶魔不愿意和术士交朋友的原因。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006005e,
		['showname']='死亡缠绕',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['描述']='对一个随从造成1点伤害，如果死亡缠绕将其杀死，抽一张牌。',
		['画家']='Matt Gaser',
		['趣味描述']='很久以前，术士们发现只要在普通的法术中加入一点令人作呕的颜色，就能在伤害敌人的同时使其恐惧。真是一举两得。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006005f,
		['showname']='灵魂之火',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['描述']='造成4点伤害，随机弃一张牌。',
		['画家']='Raymond Swanland',
		['趣味描述']='是把别人的灵魂点燃？还是用自己的灵魂把别人点燃？这似乎是有很大区别的。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060060,
		['showname']='腐蚀术',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['描述']='选择一个敌方随从，在你的回合开始时，消灭该随从。',
		['画家']='Wayne Reynolds',
		['趣味描述']='心灵的腐蚀来自于最初的一些小偷小摸，而在你意识到它之前...嘭！一切化为乌有！',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060061,
		['showname']='虚空行者',
		['类型']=0x10090004,
		['费用']=1,
		['攻击']=1,
		['生命']=3,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['种族']=0x100a0007,
		['描述']='嘲讽',
		['画家']='Alex Horley Orlandelli',
		['趣味描述']='虽然他也拥有蓝色的，胖胖的身材，但他和某部动画片里的主角没关系。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060062,
		['showname']='魔犬',
		['类型']=0x10090004,
		['费用']=2,
		['攻击']=4,
		['生命']=3,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['种族']=0x100a0007,
		['描述']='战吼：随机弃一张牌。',
		['画家']='Alex Horley',
		['趣味描述']='这个小家伙不咬鞋改咬卡牌了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060063,
		['showname']='吸取生命',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['描述']='造成2点伤害，为你的英雄恢复2点生命值。',
		['画家']='Alex Horley Orlandelli',
		['趣味描述']='“我只是减少了你一年的寿命而已。”',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060064,
		['showname']='暗影箭',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['描述']='对一个随从造成4点伤害。',
		['画家']='Dave Allsop',
		['趣味描述']='黑暗中的威胁 —— 明枪易躲，暗箭难防。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060065,
		['showname']='地狱烈焰',
		['类型']=0x10090005,
		['费用']=4,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['描述']='对所有角色造成3点伤害。',
		['画家']='Chippy',
		['趣味描述']='鸟尽弓藏，兔死狗烹，术士才不需要什么忠心耿耿的随从。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060066,
		['showname']='恐惧地狱火',
		['类型']=0x10090004,
		['费用']=6,
		['攻击']=6,
		['生命']=6,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['种族']=0x100a0007,
		['描述']='战吼：对所有其他角色造成1点伤害。',
		['画家']='Zoltan & Gabor',
		['趣味描述']='“地狱火！”——加拉克苏斯，燃烧军团的艾瑞达之王',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060067,
		['showname']='生命分流',
		['类型']=0x10090003,
		['费用']=2,
		['职业']=0x10080009,
		['品质']=0x10070001,
		['描述']='英雄技能[br]抽一张牌并受到2点伤害。',
		['可收集']=false,
	},
	{
		['name']=0x10060068,
		['showname']='冲锋',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['描述']='使一个友方随从获得冲锋。在本回合中无法攻击英雄。',
		['画家']='Alex Horley Orlandelli',
		['趣味描述']='“伙计们！伙计们！你们稳着点儿！”——某些不属于战士的随从。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060069,
		['showname']='旋风斩',
		['类型']=0x10090005,
		['费用']=1,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['描述']='对所有随从造成1点伤害。',
		['画家']='Jonboy Meyers',
		['趣味描述']='分辨资深战士和新手战士的最好办法：新手在用旋风斩时会喊“哇哇哇”。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006006a,
		['showname']='斩杀',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['描述']='消灭一个受伤的敌方随从。',
		['画家']='Dany Orizio',
		['趣味描述']='这没什么，他罪有应得。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006006b,
		['showname']='英勇打击',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['描述']='在本回合中，使你的英雄获得+4攻击力。',
		['画家']='Jonboy Meyers',
		['趣味描述']='真英雄，必英勇，赶快使用英勇打击，做真英雄！',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006006c,
		['showname']='顺劈斩',
		['类型']=0x10090005,
		['费用']=2,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['描述']='对两个随机敌方随从造成2点伤害。',
		['画家']='Phroilan Gardner',
		['趣味描述']='嘿，你们俩...你们能不能站在一起？就一会儿...',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006006d,
		['showname']='战歌指挥官',
		['类型']=0x10090004,
		['费用']=3,
		['攻击']=2,
		['生命']=3,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['描述']='你的具有冲锋的随从获得+1攻击力。',
		['画家']='Wei Wang',
		['趣味描述']='战歌氏族中闹剧不断，什么三教九流的人都能当上他们的指挥官。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006006e,
		['showname']='炽炎战斧',
		['类型']=0x10090006,
		['费用']=3,
		['攻击']=3,
		['生命']=2,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['画家']='Lucas Graciano',
		['趣味描述']='在安宁祥和的年代，人们用另一个不太流行的名字称呼这把武器，寒冰静谧战斧。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x1006006f,
		['showname']='盾牌格挡',
		['类型']=0x10090005,
		['费用']=3,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['描述']='获得5点护甲值。抽一张牌。',
		['画家']='Michael Komarck',
		['趣味描述']='光有面罩是不够的，所以人们发明了盾牌。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060070,
		['showname']='库卡隆精英卫士',
		['类型']=0x10090004,
		['费用']=4,
		['攻击']=4,
		['生命']=3,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['描述']='冲锋',
		['画家']='Alex Horley Orlandelli',
		['趣味描述']='库卡隆就是加尔鲁什·地狱咆哮的精英部队。这么说吧，你最好不要穿着蓝色的战袍出现在这些壮汉面前。',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060071,
		['showname']='奥金斧',
		['类型']=0x10090006,
		['费用']=5,
		['攻击']=5,
		['生命']=2,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['画家']='Stefan Kopinski',
		['趣味描述']='“那个消失了的潜行者再也不曾出现过...”',
		['扩展包']=0x100b0001,
		['可收集']=true,
	},
	{
		['name']=0x10060072,
		['showname']='全副武装',
		['类型']=0x10090003,
		['费用']=2,
		['职业']=0x1008000a,
		['品质']=0x10070001,
		['描述']='英雄技能[br]获得2点护甲值。',
		['可收集']=false,
	},
}}
return t