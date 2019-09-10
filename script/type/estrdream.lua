local t = require 'type/estr'
if type(t) ~= 'table' then t = {} end

t.estr_player = {'玩家1', '玩家2', '玩家3', '玩家4'}
t.estr_battle_type = {'1v1', '2v2'}

return t