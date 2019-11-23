local G = require 'gf'
local d = require '_data'
local L = require '_lang'
local t = {}

function t.type_match(od)
    return type(od.obj) == 'table'
end

function t.to_str(od)
	return ''
end

function t.edit(od)
	local w = imgui.GetAvailWidthLua()
	imgui.NewLine()
	
	local edit_text =  t.get_table(od)
	local ret, ok = imgui.InputTextSimple('table', edit_text, w, 200)
	if ret and ret ~= edit_text then
		local ast = G.call('tLua_parse', ret)

		if ast then
			local code = G.call('tLua_code', ast)
			d.update_value(od, {t = ret, lua = code or od.obj.lua})
		end
	end
	imgui.NewLine()

	imgui.BeginChild('分隔', 0, 5, true)
	imgui.EndChild()
	imgui.NewLine()

	imgui.Text(t.get_code(od) or '')
end

function t.new(od, name)
	local tlua = {
		t = '{}',
	}
	d.update_value(od, tlua)
end

function t.get_code(od)
	local code = od.obj.lua
	if type(code) == 'string' then
		return code
	elseif type(code) == 'function' or code == nil then
		local ast = G.call('tLua_parse', od.obj.t)
		if ast then
			local code = G.call('tLua_code', ast)
			d.update_value(od, {t = od.obj.t, lua = code or od.obj.lua})
		end
		return ''
	end
end

function t.get_table(od)
	local table = od.obj.t
	if type(table) == 'string' then
		return table
	end
end

function t.save(od, l, indent)
	local str_tlua = string.format('{\nt = [===[\n%s]===],\nlua = %s,\n}', t.get_table(od), t.get_code(od) or '')
	table.insert(l, str_tlua)
end

return t