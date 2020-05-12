--[[4020

]]
local G = require "gf"
local L = {}
local t = G.api

--hide=true
t['主机处理回调_申请加入房间'] = function(o_room_player_加入玩家)
    local boolean_加入房间成功 = true
    -- TODO: 检查加入条件
    if true then 
        o_room_player_加入玩家.是主机 = false
        G.call('房间_更新玩家信息', o_room_player_加入玩家)
        G.call('房间_同步房间信息', G.curSocketTarget)
        G.call('网络通用_发送消息', G.curSocketTarget, '客机处理回调_加入房间回调', boolean_加入房间成功)
    end
end

--hide=true
t['主机处理回调_更改准备状态'] = function(o_room_player_准备玩家)
    -- TODO: 检查准备条件
    if true then 
        o_room_player_准备玩家.准备就绪 = not o_room_player_准备玩家.准备就绪
        G.call('房间_更新玩家信息', o_room_player_准备玩家)
    end
end
