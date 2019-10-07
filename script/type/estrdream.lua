local t = require 'type/estr'
if type(t) ~= 'table' then t = {} end

t.estr_player = {'我方', '友方1', '敌方1', '敌方2'}
t.estr_absolute_id_type = {'红1', '红2', '蓝1', '蓝2'}
t.estr_battle_type = {'1v1', '2v2'}
t.estr_randomlib_type = {'完全随机', '抽取随机', '有损随机', '顺序选取'}



t.estr_ui_layer_type = {'一级界面', '二级界面'}

t.estr_ui_battlehero_type = {'英雄', '英雄技能', '武器'}

return t