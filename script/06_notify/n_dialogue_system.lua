local G = require "gf"
local noti = G.notify

function noti.对话系统_显示对话ui(string_名称,image_立绘,string_对话,o_dialogue_system_actionlist_立绘动画)
    local ui_story
    ui_story = G.getUI('v_dialogue_system_story')
    if not ui_story then
        ui_story = G.addUI('v_dialogue_system_story')
    end
    ui_story.visible = true
    if ui_story.c_dialogue_system_story then
        ui_story.c_dialogue_system_story:setData(string_名称, image_立绘, string_对话, o_dialogue_system_actionlist_立绘动画)
    end
end

function noti.对话系统_显示选择ui(_string_选项)
    local ui_select
    ui_select = G.getUI('v_dialogue_system_select')
    if not ui_select then
        ui_select = G.addUI('v_dialogue_system_select')
    end
    ui_select.visible = true
    if ui_select.c_dialogue_system_select then
        ui_select.c_dialogue_system_select:setData(_string_选项)
    end
end

function noti.对话结束end()
    local ui_story
    ui_story = G.getUI('v_dialogue_system_story')
    if ui_story then
        ui_story.visible = false
    end
end

function noti.选择结束end()
    local ui_select
    ui_select = G.getUI('v_dialogue_system_select')
    if ui_select then
        ui_select.visible = false
    end
    noti.对话结束end()
end