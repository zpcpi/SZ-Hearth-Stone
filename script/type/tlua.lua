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
	local w = imgui.GetAvailWidthLua() / 2

	imgui.NewLine()
	if imgui.Button('format', 200, 50) then
		if type(od.obj.t) == 'string' then
			local code = load('return (function () return ' .. od.obj.t .. 'end)()')()
			od.obj.t = code
			t.get_table(od)

			local ast = G.call('tLua_parse', od.obj.t)
			if ast then
				local code = G.call('tLua_code', ast)
				od.obj.lua = code
			end
		end
	end

	imgui.NewLine()
	local edit_text =  t.get_table(od)
	local ret, ok = imgui.InputTextSimple('table', edit_text, w, 1000)
	if ret and ret ~= edit_text then
		local ast = G.call('tLua_parse', ret)

		if ast then
			local code = G.call('tLua_code', ast)
			d.update_value(od, {t = ret, lua = code or od.obj.lua})
		end
	end

	imgui.SameLine()
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
		local ast = G.call('tLua_parse', t.get_table(od))
		if ast then
			local code = G.call('tLua_code', ast)
			d.update_value(od, {t = od.obj.t, lua = code or od.obj.lua})
		end
		return ''
	end
end

local code = {}
local tabc = 0
local tl = function(v)
    table.insert(code, v)
end
local tlt = function(v)
    table.insert(code, string.rep('    ', tabc) .. v)
end
local tup = table.unpack
local tc = table.concat
function t.get_table(od)
	local table = od.obj.t
	if type(table) == 'string' then
		return table
	elseif type(table) == 'table' then
		local function iter(...)
			local count = select('#', ...)
			local no_t = true
			for i = 1, count, 1 do
				local v = select(i, ...)
				if type(v) == 'table' then
					no_t = false
					goto next
				end
			end
			::next::

			local sq = ''
			local st = tl
			if no_t then
			else
				sq = '\n'
				st = tlt
			end

			tl('{')
			tabc = tabc + 1
			for i = 1, count, 1 do
				local v = select(i, ...)
				local sq = sq
				if i > 1 then
					sq = ',' .. sq
				end

				if type(v) == 'table' then
					tl(sq) st('') iter(tup(v))
				elseif v then
					if type(v) == 'string' then
						tl(sq) st("'" .. v .. "'")
					else
						tl(sq) st(v)
					end
				else
					st(sq)
				end
			end
			tabc = tabc - 1
			if no_t then
			else
				tl('\n')
			end
			st('}')
		end

		code = {}
		tabc = 0
		iter(tup(table))
		table = tc(code)
		od.obj.t = table
		return table
	end
end

function t.save(od, l, indent)
	local str_tlua = string.format('{\nt =\n%s,\nlua = %s,\n}', t.get_table(od), t.get_code(od) or '')
	table.insert(l, str_tlua)
end

return t