local t = require 'type/estr'
if type(t) ~= 'table' then t = {} end

t.estr_player = {'我方', '友方1', '敌方1', '敌方2'}
t.estr_side = {'我方', '敌方'}
t.estr_absolute_id_type = {'红1', '红2', '蓝1', '蓝2'}
t.estr_battle_type = {'1v1', '2v2'}

t.estr_mana_type = {'最大值', '当前值', '锁定值', '下回锁定值','预览值', '预览锁定值'}
t.estr_cardattr_type = {'当前值', '最大值', '浮动值', '光环值', '原始值'}

t.estr_cardevent_inittype = {'初始', '上场', '上手', '生效', '添加'}
t.estr_cardattr_enum = {'费用', '过载费用', '攻击', '生命', '护甲', '法术伤害', '英雄技能伤害'}
t.estr_cardpos_type = {'牌库', '手牌', '战场', '坟场', '丢弃'}
t.estr_minionpos_type = {'左邻', '右邻', '末尾'}

t.estr_damage_type = {'法术', '英雄技能', '攻击', '疲劳', '直接'}
t.estr_heal_type = {'法术', '英雄技能'}

t.estr_ui_layer_type = {'一级界面', '二级界面'}

t.estr_ui_battlehero_type = {'英雄', '英雄技能', '武器'}



return t