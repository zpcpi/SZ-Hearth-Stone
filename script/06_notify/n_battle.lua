local G = require "gf"
local noti = G.notify

function noti.对决_初始化战场(estr_battle_type_对决类型)
    if estr_battle_type_对决类型 == '1v1' then 
        G.addUI('v_battle_1v1')
        noti.作弊系统_初始化作弊系统ui()
    elseif estr_battle_type_对决类型 == '2v2' then 
    end
    G.removeUI('v_room')
end

function noti.对决_设置对决卡组()
    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:UpdateDeckInfo()
    end
end

function noti.对决_设置对决模式()
    local v_room = G.getUI('v_room')
    if v_room then 
        v_room.c_room:UpdateGameModeInfo()
    end
end

function noti.对决_结算_相对身份(estr_player_相对身份, boolean_是否胜利)
    if not G.call('房间_是否同一阵营_相对身份', estr_player_相对身份, '我方') then 
        boolean_是否胜利 = not boolean_是否胜利
    end
    G.noti_call('对决界面_显示结算界面', boolean_是否胜利)
end

function noti.对决_结算_绝对身份(estr_absolute_id_type_绝对身份, boolean_是否胜利)
    if not G.call('房间_是否同一阵营_绝对身份', estr_absolute_id_type_绝对身份, G.call('房间_获取绝对身份', '我方')) then 
        boolean_是否胜利 = not boolean_是否胜利
    end
    G.noti_call('对决界面_显示结算界面', boolean_是否胜利)
end

function noti.对决界面_显示结算界面(boolean_是否胜利)
    print('--== 对决界面_显示结算界面')
    local o_node_结算界面 = G.changeUI('v_battle_result')
    if o_node_结算界面 and o_node_结算界面.c_battle_result then 
        print('--== 对决界面_显示结算界面 2')
        o_node_结算界面.c_battle_result:setData(boolean_是否胜利)
    end
    print('--== 对决界面_显示结算界面 3')
end