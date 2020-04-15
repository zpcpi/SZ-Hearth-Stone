--[[3019

]]

local G = require "gf"
local t = G.com()


function t:init()
end

function t:start()

end

function t:get_choose_obj(target)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local choose = script_战场.choose
    local show_cards = choose.show_cards

    for k, card in iparis(show_cards) do
        if card == target then
            return choose.card_objs[k]
        end
    end
end

function t:create_newcard(card)
    local card_obj = self:get_choose_obj(card)

    if card_obj then
        -- 卡是发现的
    else
        -- 卡需要创建
    end

end

function t:obj_transto_hand(card_obj, estr_player_相对身份, int_编号)


end

return t