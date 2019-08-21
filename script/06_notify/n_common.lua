local G = require "gf"
local noti = G.notify

function noti.init()
end

function noti.初始化()
    G.addUI('v_main_menu')
end

function noti.主机_新建房间()
    G.addUI('v_room')
    G.removeUI('v_main_menu')
end
