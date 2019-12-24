--[[4022

]]
local G = require "gf"
local L = {}
local t = G.api

t['收藏_解析卡组代码'] = function (string_卡组代码)
    -- 先把卡组 base64 编码的代码解析成二进制
    local bin = G.zzbase64_decode(string_卡组代码)
    -- 再把二进制解析成十六进制字符串
    local hexstr = ''
    for i = 1, #bin do 
        local charcode = tonumber(string.byte(bin, i, i))
        hexstr = hexstr .. string.format('%02x', charcode)
    end
    print(hexstr)
    -- 每两个十六进制组合成一个数值
    local list = {}
    while #hexstr > 0 do 
        local str = string.sub(hexstr, 1, 2)
        hexstr = string.sub(hexstr, 3)
        str = '0x' .. str
        print(str)
        table.insert(list, tonumber(str))
    end
    print(#list)
    G.show_table(list)
end
