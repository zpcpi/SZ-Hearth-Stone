local G = require 'gf'
local d = require '_data'
local L = require '_lang'
local t = {}

function t.type_match(od)
    return type(od.obj) == 'table'
end

function t.to_str(od)
	if od.obj then
		return 'data done'
	else
		return ''
	end
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
			d.step(d.doc)
		end
	end

	imgui.NewLine()
	local edit_text =  t.get_table(od)
	local ret, ok = imgui.InputTextSimple('table', edit_text, w, 1000)
	if ret and ret ~= edit_text then
		local need_update = true
		ret = string.gsub(ret, '@([^%s(),]*)', function(w)
			if w == 'if' then
				return "{'if',true,'$if_action','$else_action'}"
			elseif w == 'function' then
				return "{'function',{},{},'$block'}"
			elseif w == 'while' then
				return "{'while',true,'$block'}"
			elseif w == 'repeat' then
				return "{'repeat',1,10,1,'$block'}"
			elseif w == 'block' then
				return "{'block','$action'}"
			elseif w == 'table' then
				return "{'table',1}"
			elseif w == 'append' then
				return "{'append',{},{}}"
			elseif w == 'map' then
				return "{'map','+',{}}"
			elseif w == 'filter' then
				return "{'filter',{'function',{'a'},{},true},{}}"
			elseif w == 'foldl' then
				return "{'foldl','+',0,{}}"
			elseif w == 'foldr' then
				return "{'foldr','+',0,{}}"
			elseif w == 'lis' then
				return "{'listener',{},'+'}"
			else
				need_update = false
			end
		end) or ret
		if need_update then
			d.update_value(od, {t = ret, lua = od.obj.lua})
		end
    	-- todo,先执行一次代码替换
		
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
local ti = table.insert
local ts = table.sort
function t.get_table(od)
	local table = od.obj.t
	if type(table) == 'string' then
		return table
	elseif type(table) == 'table' then
		local function iter(tb)
			local no_t = true
			for k,v in pairs(tb) do
				if (type(v) == 'table') or (type(k) == 'string') then
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

			-- key排序
			local keylist = {}
			for k,v in pairs(tb) do
				ti(keylist, k)
			end
			ts(keylist, function (a, b)
				if type(a) == 'number' then
					if type(b) == 'number' then
						return a < b
					else
						return true
					end
				else
					if type(b) == 'number' then
						return false
					else
						return a < b
					end
				end
			end)

			local i = 1
			for _,k in ipairs(keylist) do
				local v = tb[k]
				local sq = sq
				if i > 1 then
					sq = ',' .. sq
				end

				if type(v) ~= 'nil' then
					tl(sq)
				else
					st(sq)
				end
				if type(k) == 'string' then
					st("['") tl(k) tl("'] = ")
				else
					st('')
				end

				if type(v) == 'table' then
					iter(v)
				elseif type(v) == 'boolean' then
					if v == true then
						tl('true')
					elseif v == false then
						tl('false')
					end
				elseif type(v) == 'string' then
						tl("'" .. v .. "'")
				elseif type(v) == 'number' then
					if v > 0x10010000 then
						tl(string.format('0x%x', v))
					else
						tl(v)
					end
				else
					tl(v)
				end
				i = i + 1
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
		iter(table)
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