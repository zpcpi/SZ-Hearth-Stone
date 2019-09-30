local G = require "gf"
local noti = G.notify

function noti.card_create()
    local ui_obj
    -- -- 随从预览
    -- ui_obj = G.getUI('v_card_minion')
    -- if not ui_obj then
    --     ui_obj = G.addUI('v_card_minion')
    --     ui_obj.x = ui_obj.x - 500
    --     ui_obj.y = ui_obj.y + 200
    --     ui_obj.scaleX = 0.5
    --     ui_obj.scaleY = 0.5
    -- end

    -- -- 法术预览
    -- ui_obj = G.getUI('v_card_spell')
    -- if not ui_obj then
    --     ui_obj = G.addUI('v_card_spell')
    --     ui_obj.x = ui_obj.x - 300
    --     ui_obj.y = ui_obj.y + 200
    --     ui_obj.scaleX = 0.5
    --     ui_obj.scaleY = 0.5
    -- end

    -- -- 英雄预览
    -- ui_obj = G.getUI('v_card_hero')
    -- if not ui_obj then
    --     ui_obj = G.addUI('v_card_hero')
    --     ui_obj.x = ui_obj.x - 100
    --     ui_obj.y = ui_obj.y + 200
    --     ui_obj.scaleX = 0.5
    --     ui_obj.scaleY = 0.5
    -- end

    -- -- 武器预览
    -- ui_obj = G.getUI('v_card_weapon')
    -- if not ui_obj then
    --     ui_obj = G.addUI('v_card_weapon')
    --     ui_obj.x = ui_obj.x + 100
    --     ui_obj.y = ui_obj.y + 200
    --     ui_obj.scaleX = 0.5
    --     ui_obj.scaleY = 0.5
    -- end
    -- local ui_card = ui_obj

    -- 显示战场
    G.call('对决_初始化战场', G.misc().对决类型)

    -- 手牌区功能
    -- ui_obj = G.getUI('v_handcards_self')
    -- if not ui_obj then
    --     ui_obj = G.addUI('v_handcards_self')
    -- end
end