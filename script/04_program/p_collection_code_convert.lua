--[[4022

]]
local G = require "gf"
local L = {}
local t = G.api
-- key:cardDbfID  value:cardData
local cardDbfIdDataDict = {}

local function ReadData(stream, index)
    return table.remove(stream, index)
end

local function ReadVarint(stream)
    local shift = 0
	local result = 0
	while true do
		local c = ReadData(stream, 1)
        if c == nil or c == "" then
            G.call('提示_添加提示', '卡牌代码不正确')
            print('Unexpected EOF while reading varint')
            return 0
        end
		local i = string.byte(c)
		result = result | ((i & 0x7f) << shift)
		shift = shift + 7
		if i & 0x80 == 0 then
            break
        end
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
    if ReadData(varintList, 1) ~= string.byte('\0') then
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
	-- format = _read_varint(data)
	-- try:
	-- 	format = FormatType(format)
	-- except ValueError:
	-- 	raise ValueError("Unsupported FormatType in deckstring %r" % (format))

	-- heroes: CardList = []
	-- num_heroes = _read_varint(data)
	-- for i in range(num_heroes):
	-- 	heroes.append(_read_varint(data))

	-- cards: CardIncludeList = []
	-- num_cards_x1 = _read_varint(data)
	-- for i in range(num_cards_x1):
	-- 	card_id = _read_varint(data)
	-- 	cards.append((card_id, 1))

	-- num_cards_x2 = _read_varint(data)
	-- for i in range(num_cards_x2):
	-- 	card_id = _read_varint(data)
	-- 	cards.append((card_id, 2))

	-- num_cards_xn = _read_varint(data)
	-- for i in range(num_cards_xn):
	-- 	card_id = _read_varint(data)
	-- 	count = _read_varint(data)
	-- 	cards.append((card_id, count))
end

    