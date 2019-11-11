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

local function area_iter(j, i, str, data)
	local text_list = data[3] or {} -- 所有的文本数据
	local used_list = data[4] or {} -- 所有的占用数据
	local old_used_list = data[5] or {} -- 所有的旧占位
	local type_list = data[6] or {} -- 所有的控件类型占位
	data[5] = old_used_list
	data[6] = type_list

	-- 不论如何，文本还是要修改的
	str = string.gsub(str, '\n', '')
	text_list[j][i] = str

	-- 文本内容匹配
	local lenx, leny
	string.gsub(str, '^([%d]+),([%d]+),(.+)$', function(x,y,z)
		lenx = tonumber(x)
		leny = tonumber(y)

		if type_list[j] then
		else
			type_list[j] = {}
		end
		type_list[j][i] = z
	end, 1)

	-- 碰撞测试
	if lenx and leny and (lenx > 0) and (leny > 0) then
		for pj = j, j+leny-1, 1 do
			if used_list[pj] then
			else
				used_list[pj] = {}
			end
			for pi = i, i+lenx-1, 1 do
				if used_list[pj][pi] and (used_list[pj][pi] ~= i .. '|' .. j) then
					lenx,leny = 1, 1
					text_list[j][i] = lenx .. ',' .. leny .. ',' .. type_list[j][i]
					goto next
				end
			end
		end
	end
	::next::

	-- 清理占位数据
	if old_used_list[j] then
		local old_used = old_used_list[j][i]
		if old_used then
			local px, py = old_used[1], old_used[2]
			for pj = j, j+py-1, 1 do
				for pi = i, i+px-1, 1 do
					used_list[pj][pi] = nil
				end
			end
			old_used_list[j][i] = nil
		end
	else
		old_used_list[j] = {}
	end

	if lenx and leny and (lenx > 0) and (leny > 0) then
		for pj = j, j+leny-1, 1 do
			if used_list[pj] then
			else
				used_list[pj] = {}
			end
			for pi = i, i+lenx-1, 1 do
				used_list[pj][pi] = i .. '|' .. j
			end
		end
		old_used_list[j][i] = {lenx, leny}
	end
end

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
	local text_list = data[3] or {} -- 所有的文本数据
	local used_list = data[4] or {} -- 所有的占用数据
	data[1] = gw_list
	data[2] = gh_list
	data[3] = text_list
	data[4] = used_list

	local base_w = 100
	local base_h = 50
	local dragint_h = 27

	-- 第一行
	imgui.NewLine()
	do
		-- 按钮用于复位
		if imgui.Button('最小值复位', base_w, dragint_h) then
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
			local ret,nv = imgui.DragInt('gw_list,' .. i, w, 1, 0, 255, '%.f')
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

		-- 列添加按钮
		if imgui.Button('列添加', base_w, dragint_h) then
			table.insert(gw_list, base_w)
			d.step(doc)
		end
	end

	local h_creater = function (index)
		local h = gh_list[index]
		if h then
			imgui.BeginChild('gh_list_fream,' .. index, base_w, gh_list[index], false)

			imgui.PushItemWidth(base_w)
			local ret,nv = imgui.DragInt('gh_list,' .. index, gh_list[index], 1, 0, 255, '%.f')
			imgui.PopItemWidth()
			imgui.EndChild()

			if ret then
				if not d.dragging then
					d.dragging = d.doc
				end
				gh_list[index] = nv
				d.step(doc)
			end
		end
	end

	-- 第二行
	imgui.NewLine()
	do
		imgui.BeginChild('gh_list_fream', base_w, sum(gh_list) + 10, false)
		for j,h in ipairs(gh_list) do
			h_creater(j)
		end
		imgui.EndChild()
	
		imgui.SameLine()

		imgui.BeginChild('fream', sum(gw_list) + 10, sum(gh_list) + 10, false)
		for j,h in ipairs(gh_list) do
			for i,w in ipairs(gw_list) do
				if text_list[j] then
				else
					text_list[j] = {}
				end
				if used_list[j] then
				else
					used_list[j] = {}
				end

				if used_list[j][i] and (text_list[j][i] == nil or text_list[j][i] == '') then
					imgui.Selectable('', false, 0, w, h)
				else
					local ret, w = imgui.InputTextSimple(i .. ',' .. j, text_list[j][i], w, h, true)
					if ret then
						area_iter(j, i, ret, data)
						d.step(doc)
					end
				end

				imgui.SameLine()
			end
			imgui.NewLine()
		end
		imgui.EndChild()
	end

	-- 行添加按钮
	if imgui.Button('行添加', base_w, base_h) then
		table.insert(gh_list, base_h)
		d.step(doc)
	end

	-- 过滤多余数据
	for _,t in pairs(data) do
		for k,v in pairs(t) do
			if type(v) == 'table' then
				for k2,v2 in pairs(v) do
					if type(v2) == 'string' and v2 == '' then
						v[k2] = nil
					end
				end
				if next(v) == nil then
					t[k] = nil
				end
			end
		end
	end
end

-- function t.to_str(od)
-- end

return t