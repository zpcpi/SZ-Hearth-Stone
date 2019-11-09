local c = require 'editor.c'
local L = require '_lang'
local d = require '_data'
local id = require 'type/id'
local t = d.new_type('array')
local G = require "gf"

t.is_mod = nil

function t.type_match(od)
    return d.is_table(od.obj)
end

t.sub_desc = function(sod, sub_key)
    return {type = 'int'}
end

local super_save = t.save
function t.save(od, l, indent)
	super_save(od, l, indent)
end

function get_data(od)
	local data = od.obj
	local flaglist = {}

	for index,t in ipairs(CARD_FLAGS) do
		local value = data[index] or 0
		local flags = flaglist[index] or {}
		data[index] = value
		flaglist[index] = flags

		for flag, v in pairs(t) do
			if (value & (1 << v)) > 0 then
				flags[v+1] = {
					['key'] = flag,
					['value'] = true,
				}
			else
				flags[v+1] = {
					['key'] = flag,
					['value'] = false,
				}
			end
		end
	end

	return flaglist
end

function set_data(od, key, value)
	local data = od.obj

	for index,t in ipairs(CARD_FLAGS) do
		local v = t[key]
		if v then
			if value then
				data[index] = data[index] | (1 << v)
			else
				data[index] = data[index] & (~ (1 << v))
			end
			break
		end
	end
end

function t.edit(od)
	local doc = d.doc
	local data = get_data(od)

	local cw = 150
	local ch = 35
	local bw = 140
	local bh = 30

	imgui.NewLine()

	for i, t in ipairs(data) do
		local zw = cw * 5
		local zh_count = (#t - 1) // 5 + 1
		local zh = ch * zh_count

		imgui.BeginChild(i, zw, zh, false)
		for j, flag in ipairs(t) do
			if flag then
				if flag['value'] then
					if imgui.Button('<04>' .. flag['key'], bw, bh) then
						set_data(od, flag['key'], false)
						d.step(doc)
					end
				else
					if imgui.Button('<07>' .. flag['key'], bw, bh) then
						set_data(od, flag['key'], true)
						d.step(doc)
					end
				end
			end

			if (j % 5) ~= 0 then 
				imgui.SameLine()
			end 
		end
		imgui.EndChild()
		imgui.NewLine()
	end
end

function t.to_str(od)
	local data = get_data(od)

	local result = ''
	for _,t in ipairs(data) do
		for _, flag in ipairs(t) do
			if flag and flag['value'] then
				if result ~= '' then
					result = result .. '|' .. flag['key']
				else
					result = flag['key']
				end
			end
		end
	end

	return result
end

return t