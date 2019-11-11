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

local function sum(arr)
	local result = 0
	for _,v in ipairs(arr) do
		result = result + v
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

	imgui.NewLine()

	-- 第一行
	do
		-- 按钮用于复位
		if imgui.Button('最小值复位', 100, 30) then
			for i,w in ipairs(gw_list) do
				if w < MIN_Width then
					gw_list[i] = MIN_Width
				end
			end
			for i,h in ipairs(gh_list) do
				if h < MIN_Heidth then
					gh_list[i] = MIN_Heidth
				end
			end
			d.step(doc)
		end

		-- 宽度控制器
		imgui.SameLine()
		for i,w in ipairs(gw_list) do
			imgui.PushItemWidth(w)
			local ret,nv = imgui.DragInt('gw_list' .. i, w, 1, 0, 255, '%.f')
			imgui.SameLine()
			imgui.PopItemWidth()

			if ret then
				if not d.dragging then
					d.dragging = d.doc
				end
				gw_list[i] = nv
				d.step(doc)
			end
		end
	end

	-- 第二行
	imgui.NewLine()

	imgui.Button('', 100, 30)
	imgui.SameLine()

	imgui.BeginChild('fream', sum(gw_list) + 10, sum(gh_list) + 10, false)
	for j,h in ipairs(gh_list) do
		for i,w in ipairs(gw_list) do
			if imgui.Button(i .. ',' .. j, w, h) then

			end
			imgui.SameLine()
		end
		imgui.NewLine()
	end
	imgui.EndChild()
end

-- function t.to_str(od)
-- end

return t