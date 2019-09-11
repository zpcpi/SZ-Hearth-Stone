local t = require 'type/estr'
if type(t) ~= 'table' then t = {} end

t.estr_player = {'我方', '友方1', '敌方1', '敌方2'}
t.estr_absolute_id_type = {'红1', '红2', '蓝1', '蓝2'}
t.estr_battle_type = {'1v1', '2v2'}

return t