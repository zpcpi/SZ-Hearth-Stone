local c = require 'editor.c'
local L = require '_lang'
local d = require '_data'
local id = require 'type/id'
local t = d.new_type('array')
local G = require "gf"

t.is_mod = nil
local flags_data = CARD_FLAGS

function t.type_match(od)
    return d.is_table(od.obj)
end

function t.sub_desc(sod, sub_key)
    return {type = 'any'}
end

local super_save = t.save
function t.save(od, l, indent)
	super_save(od, l, indent)
end

function t.edit(od)

end

-- function t.to_str(od)
-- end

return t