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
