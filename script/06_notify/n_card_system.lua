local G = require "gf"
local noti = G.notify

function noti.card_create()
    local ui_obj
    -- 随从预览
    ui_obj = G.getUI('v_card_minion')
    if not ui_obj then
        ui_obj = G.addUI('v_card_minion')
        ui_obj.x = ui_obj.x - 450
    end

    -- 法术预览
    ui_obj = G.getUI('v_card_spell')
    if not ui_obj then
        ui_obj = G.addUI('v_card_spell')
        ui_obj.x = ui_obj.x - 100
    end

    -- 英雄预览
    ui_obj = G.getUI('v_card_hero')
    if not ui_obj then
        ui_obj = G.addUI('v_card_hero')
        ui_obj.x = ui_obj.x + 200
    end


end