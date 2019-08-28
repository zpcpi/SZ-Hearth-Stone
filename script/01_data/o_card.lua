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
		['画家']='Richard Wright',
		['趣味描述']='“把月火术拖到每一个技能栏位上。”——《如何成为一名德鲁伊》，第五章，第三节',
		['扩展包']=0x100b0001,
		['可收集']=true,
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
		['画家']='Doug Alexander',
		['趣味描述']='有些德鲁伊做梦时都回响着陌生人的喊叫声：“给我个激活！”',
		['扩展包']=0x100b0001,
		['可收集']=true,
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
		['画家']='Dany Orizio',
		['趣味描述']='谁去谁留，都由爪子决定。',
		['扩展包']=0x100b0001,
		['可收集']=true,
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
		['画家']='Brad Vancata',
		['趣味描述']='这种爪子形状的印记如果纹在身上，人们一定知道你是德鲁伊玩家。',
		['扩展包']=0x100b0001,
		['可收集']=true,
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
		['画家']='Cyril Van Der Haegen',
		['趣味描述']='见效快，疗效好，无毒副作用。',
		['扩展包']=0x100b0001,
		['可收集']=true,
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
		['画家']='James Ryman',
		['趣味描述']='使用法力水晶增长装置增加你的法力值，只要399！',
		['扩展包']=0x100b0001,
		['可收集']=true,
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
		['画家']='Grace Liu',
		['趣味描述']='显然这对火元素和水元素也有作用。难道这说明元素也是长耳朵的吗？',
		['扩展包']=0x100b0001,
		['可收集']=true,
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
		['画家']='Sean O’Daniels',
		['趣味描述']='当一只熊向后仰身张开它的前臂时，他就要横扫！...或者拥抱你了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
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
		['画家']='Alex Horley Orlandelli',
		['趣味描述']='平衡对德鲁伊来说很重要。这张卡牌现在就很平衡了。',
		['扩展包']=0x100b0001,
		['可收集']=true,
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
}}
return t