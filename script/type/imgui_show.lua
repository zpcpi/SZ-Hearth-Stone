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
    return {type = 'int'}
end

local super_save = t.save
function t.save(od, l, indent)
	super_save(od, l, indent)
end

local function sum(arr, i, j)
	local result = 0
	for x = i, j, 1 do
		result = result + arr[x]
	end
	return result
end

local MIN_Width = 30
local MIN_Heidth = 30

function t.edit(od)
	local doc = d.doc
	local data = od.pobj.布局数据

	if data then
	else
		data = {}
		od.pobj.布局数据 = data
	end

	local gw_list = data[1] or {} -- 所有的格宽数据
	local gh_list = data[2] or {} -- 所有的格高数据
	local used_list = data[5] or {} -- 所有的占位
	local type_list = data[6] or {} -- 所有的控件类型
	data[1] = gw_list
	data[2] = gh_list
	data[5] = used_list
	data[6] = type_list

	-- 开始绘制窗体
	local base_i, base_j = 1, 1
	for j,h in ipairs(gh_list) do
		base_j = j
		base_i = 1
		for i,w in ipairs(gw_list) do
			if used_list[j] and used_list[j][i] then
				-- 有数据，之前的占位给加一下
				if i > base_i then
					imgui.BeginChild('fream,' .. base_i .. ',' .. base_j, sum(gw_list, base_i, i-1), gh_list[j], false)
					imgui.EndChild()
					imgui.SameLine()
				end
				
				-- 开始绘制控件
				if type_list[j][i] == 'button' then
					imgui.Button('button,' .. i .. ',' .. j, sum(gw_list, i, i+used_list[j][i][1]-1), sum(gh_list, j, j+used_list[j][i][2]-1))
					imgui.SameLine()
				end

				base_i = i+used_list[j][i][1]
			end
		end
		imgui.NewLine()
	end

end

-- function t.to_str(od)
-- end

return t