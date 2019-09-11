local GF = require('gfbase')
GF.cacheData = {}

function GF.addUI(name)
    local ui = GF.getUI(name)
    if ui then
        return ui
    end
	ui = GF.loadUI(name)
	GF.Stage().addChild(ui)
    GF.UpdateUIVisible(name)
    GF.set_uitopmost(ui)
	return ui
end

function GF.removeUI(obj)
	local name
	if not obj then
		return
	end
	if type(obj) == 'string' then
		name = obj
		obj = GF.Stage().getChildByName(obj)
	else
		name = obj.name
	end
	GF.Stage().removeChild(obj)
	if GF.DestroyUI then 
		GF.DestroyUI(obj)
    end
    GF.UpdateUIVisible(name)
end

function GF.set_uitopmost(node)
    if not node then return end
    local topmost = GF.GetUITopmost(node.name)
    if topmost then 
        node.topmost = topmost
    end
end

function GF.UpdateUIVisible(name)
    do 
        return 
    end
    local ui = GF.getUI(name)
    if ui then 
        GF.AppendUIList(name)
    else
        GF.RemoveFromUIList(name)
    end
end

function GF.AppendUIList(name)
    local topmost
    local pos

    if not GF.IsTopLayerUI(name) then 
        return
    end
    topmost = GF.GetUITopmost(name)
    if not topmost then 
        return 
    end
    if GF.cacheData.uiList == nil then 
        GF.cacheData.uiList = {}
    end

    for i = 1, #GF.cacheData.uiList do 
        if GF.cacheData.uiList[i] == name then 
            pos = i
            break
        elseif GF.GetUITopmost(GF.cacheData.uiList[i]) > topmost then 
            table.insert(GF.cacheData.uiList, i, name)
            pos = i
            break
        end
    end
    if not pos then 
        table.insert(GF.cacheData.uiList, name)
        pos = #GF.cacheData.uiList
    end

    for i = 1, pos - 1 do 
        local ui_name = GF.cacheData.uiList[i]
        local ui = GF.getUI(ui_name)
        if ui then 
            ui.visible = false
        end
    end
end

function GF.RemoveFromUIList(name)
    local topmost
    if not GF.IsTopLayerUI(name) then 
        return
    end
    topmost = GF.GetUITopmost(name)
    if not topmost then 
        return 
    end
    if GF.cacheData.uiList == nil then 
        return 
    end
    for i = 1, #GF.cacheData.uiList do 
        if name == GF.cacheData.uiList[i] then 
            table.remove(GF.cacheData.uiList, i)
            break
        end
    end
    local length = #GF.cacheData.uiList
    if length > 0 then 
        local ui_name = GF.cacheData.uiList[length]
        local ui = GF.getUI(ui_name)
        if ui then
            ui.visible = true
        end
    end
end
function GF.ChangeUITopmost(name,int_优先级)
    GF.cacheData.uiTopmostList[name].优先级 = int_优先级
end
function GF.GetUITopmost(name)
    if GF.cacheData.uiTopmostList == nil then 
        GF.InitUITopmostList()
        if GF.cacheData.uiTopmostList == nil then 
            return
        end
    end
    if GF.cacheData.uiTopmostList[name] then 
        return GF.cacheData.uiTopmostList[name].优先级
    else
        return nil
    end
end

function GF.IsTopLayerUI(name)
    if GF.cacheData.uiTopmostList == nil then 
        GF.InitUITopmostList()
        if GF.cacheData.uiTopmostList == nil then 
            return
        end
    end
    if GF.cacheData.uiTopmostList[name] then 
        return GF.cacheData.uiTopmostList[name].界面类型 == '一级界面'
    else
        return false
    end
end

function GF.InitUITopmostList()
    local dataList = GF.DBTable('o_ui_topmost')
    local get_table_result
    local ui_name
    GF.cacheData.uiTopmostList = {}
    for i = 1, #dataList do 
        ui_name = dataList[i].界面名称
        GF.cacheData.uiTopmostList[ui_name] = dataList[i]
        get_table_result = true
    end
    if not get_table_result then 
        GF.cacheData.uiTopmostList = nil
    end
end

function GF.getMarginWidth()
    local string_宽度 = GF.GetConfig('margin')
    string_宽度 = string_宽度 or 0
    return tonumber(string_宽度) or 0
end

--适配函数
function GF.AdapteUI(Aui,arch)
    local width = GF.getMarginWidth()
    local srcW = width
    if Aui then
        local addW = (arch and Aui.width*srcW/1280 or width/2)
		Aui.scaleX = (1-srcW/1280)
		Aui.x = Aui.x + addW
	end
end