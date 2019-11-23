local G = require 'gf'
local d = require '_data'
local L = require '_lang'
local t = {}

t.base_type = 'function'
t.edit_type = 1
t.is_mod = nil

function t.type_match(od)
    return type(od.obj) == 'string' or type(od.obj) == 'function'
end

function t.to_str(od)
	local show_str = ''
	local code = t.get_code(od)
	local ast = d.lua_parser.expr(code)
	if ast and ast[1] then
		local vars = {}
		for k,v in ipairs(ast[1]) do
			table.insert(vars, v[1])
		end

		show_str = 'anonfunc (' .. table.concat(vars, ',') .. ')'
	end
    return show_str
end

function t.edit(od)
	imgui.NewLine()
	local w = imgui.GetAvailWidthLua()
	imgui.Text(t.get_code(od) or '')
end

function t.get_code(od)
	local code = od.obj
	if type(code) == 'string' then
		return code
	elseif type(code) == 'function' then
		local info = debug.getinfo(code)
		local func_start = info.linedefined
		local func_end = info.lastlinedefined
		local fs = io.open(info.short_src, 'r')
		local linefunc = fs.lines
		local count = 1
		local code_text = ""
		for l in linefunc(fs) do
			if count > func_end then
				break
			elseif count >= func_start then
				code_text = code_text .. '\n' .. l
			end
			count = count + 1
		end

		code = 'function' .. string.match(code_text,"function(.+)end,") .. 'end'
		local ast = d.lua_parser.expr(code)
		code = d.lua_writer.generate(ast)
		code = table.concat(code, '\n')
		d.update_value(od, code)
		return code
	end
end

function t.new(od, name)
	local code = 'function () end'
	local ast = d.lua_parser.expr(code)
	code = d.lua_writer.generate(ast)
	code = table.concat(code, '\n')
	d.update_value(od, code)
end

function t.save(od, l, indent)
	table.insert(l, t.get_code(od))
end

return t