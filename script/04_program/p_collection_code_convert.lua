--[[4022

]]
local G = require "gf"
local L = {}
local t = G.api
-- key:cardDbfID  value:cardData
local cardDbfIdDataDict = {}

local function ReadVarint(bytes)
    local length = 0
	local result = 0
	while true do
		local byte = table.remove(bytes, 1)
        if byte == nil or byte == "" then
            G.call('提示_添加提示', '卡牌代码不正确')
            print('Unexpected EOF while reading varint')
            return 0
        end
        local value = byte & 0x7f
		result = result | (value << (length * 7))
		if byte & 0x80 ~= 0x80 then
            break
        end
        length = length + 1
    end
	return result
end

t['收藏_生成卡片DbfID映射表'] = function ()
    cardDbfIdDataDict = {}
    local _o_card = G.DBTable('o_card')
    for _, o_card in ipairs(_o_card) do 
        if o_card['局外数据'] ~= nil and o_card['局外数据']['dbfid'] ~= nil then 
            local int_dbfid = o_card['局外数据']['dbfid']
            cardDbfIdDataDict[int_dbfid] = o_card
        end
    end
end

t['收藏_获取卡片DbfID映射表'] = function ()
    return cardDbfIdDataDict
end

t['收藏_解析卡组代码'] = function (string_cardcode)
    -- 先把卡组 base64 编码的代码解析成二进制
    local bin = G.zzbase64_decode(string_cardcode)
    -- 再把二进制解析成十六进制字符串
    local hexstr = ''
    for i = 1, #bin do 
        local charcode = tonumber(string.byte(bin, i, i))
        hexstr = hexstr .. string.format('%02x', charcode)
    end
    print('hexstr', hexstr)
    -- 每两个十六进制组合成一个数值
    local varintList = {}
    while #hexstr > 0 do 
        local str = string.sub(hexstr, 1, 2)
        hexstr = string.sub(hexstr, 3)
        str = '0x' .. str
        table.insert(varintList, tonumber(str))
    end
    -- 依次解析卡组数据
    -- 第一元素是 保留字节 0x00
    if table.remove(varintList, 1) ~= string.byte('\0') then
        G.call('提示_添加提示', '卡牌代码不正确')
        return
    end
    -- 第二个是 版本号
    local version = ReadVarint(varintList)
    print('version', version)
    -- TODO: 处理版本信息
	-- if version != DECKSTRING_VERSION:
	-- 	raise ValueError("Unsupported deckstring version %r" % (version))

    -- 第三个是 模式(1 为狂野, 2 为标准)
    local format = ReadVarint(varintList)
    print('format', format)

    local heroCount = ReadVarint(varintList)
    print('hero count', heroCount)
    local heroList = {}
    for i = 1, heroCount do 
        local hero = ReadVarint(varintList)
        print('hero', hero)
        table.insert(heroList, hero)
    end

    local cardDbfIdList = {}
    local singleCardCount = ReadVarint(varintList)
    for i = 1, singleCardCount do 
        local cardDbfID = ReadVarint(varintList)
        table.insert(cardDbfIdList, cardDbfID)
    end

    local doubleCardCount = ReadVarint(varintList)
    for i = 1, doubleCardCount do 
        local cardDbfID = ReadVarint(varintList)
        table.insert(cardDbfIdList, cardDbfID)
        table.insert(cardDbfIdList, cardDbfID)
    end

    local multiCardCount = ReadVarint(varintList)
    for i = 1, multiCardCount do 
        local cardDbfID = ReadVarint(varintList)
        local cardCount = ReadVarint(varintList)
        for j = 1, cardCount do 
            table.insert(cardDbfIdList, cardDbfID)
        end
    end

    for _, cardDbfID in ipairs(cardDbfIdList) do 
        if cardDbfIdDataDict[cardDbfID] ~= nil then 
            print(cardDbfIdDataDict[cardDbfID].showname)
        else
            print('--== Cannot find dbf id:', cardDbfID)
        end
    end
end

    