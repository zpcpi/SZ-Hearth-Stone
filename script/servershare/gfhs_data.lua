local GF = require('gfbase')

function GF.NewInst(dbname)
	local db = GF.DBLoad(dbname)
	local itm = nil
	if db then
		GF.QueryInit(dbname)
		local inst_id = GF.NewTextID(dbname)
		itm = {}
		itm.name = inst_id
		GF.newinst_cache[dbname][inst_id] = itm
	end
	return itm
end

local estr
local enum
function GF.GetEnumValue(enumname)
	if estr == nil then
		estr = require 'type/estrdream'
		enum = require 'type/enumdream'
	end
	return estr[enumname] or enum[enumname]
end

function GF.ClearDynamicData(tableName)
	if GF.newinst_cache == nil then 
		return
	end
	GF.newinst_cache[tableName] = {}
end 

function GF.o2i(data)
	if type(data) ~= 'table' then 
		return 0
	end
	return data.name or 0
end 

function GF.i2o(id)
	if type(id) ~= 'number' then 
		return nil
	end
	return GF.QueryName(id)
end 