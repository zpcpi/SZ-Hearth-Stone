local G = require "gf"
local noti = G.notify

function noti.角色_添加手牌()
    local ui_obj
    local count
    ui_obj = G.getUI('v_battle_1v1').getChildByName('Self').c_handcards_self
    -- ui_obj = G.getUI('v_handcards_self').c_handcards_self
    ui_obj:addCard()

    count = ui_obj.CardCount

    ui_obj = G.getUI('v_animactor').c_animactor
    ui_obj.__o_animquest = {
        [1] = {
            [1] = G.call('动画系统_创建quest', ui_obj, G.QueryName(0x10010005 + count - 1)),
        },
    }
    ui_obj:run_animactor()
end
