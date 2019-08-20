--[[4007

]]
local G = require "gf"
local L = {}
local t = G.api

t['Net_SendMsg'] = function(msg)
    msg = tostring(msg) .. '\n'
    if G.clientList and #G.clientList > 0 then 
        for _, client in ipairs(G.clientList) do 
            client:send(msg)
        end
        return 
    end
    if G.tcpSocket then 
        G.tcpSocket:send(msg)
    end
end
