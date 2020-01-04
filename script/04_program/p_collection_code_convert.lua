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

--ret=o_deck
t['收藏_解析卡组代码'] = function (string_cardcode, boolean_need_create_inst)
    -- 先把卡组 base64 编码的代码解析成二进制
    local bin = G.zzbase64_decode(string_cardcode)
    -- 再把二进制解析成十六进制字符串
    local hexstr = ''
    for i = 1, #bin do 
        local charcode = tonumber(string.byte(bin, i, i))
        hexstr = hexstr .. string.format('%02x', charcode)
    end
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
        return nil
    end
    -- 第二个是 版本号
    local version = ReadVarint(varintList)
    -- TODO: 处理版本信息, 暂时不知道版本有什么用
	-- if version != DECKSTRING_VERSION:
	-- 	raise ValueError("Unsupported deckstring version %r" % (version))

    -- 第三个是 模式(1 为狂野, 2 为标准)
    local mode = ReadVarint(varintList)

    -- 解析英雄
    local heroCount = ReadVarint(varintList)
    local heroList = {}
    for i = 1, heroCount do 
        local hero = ReadVarint(varintList)
        table.insert(heroList, hero)
    end

    local cardDbfIdList = {}
    -- 解析数量为 1 的卡片
    local singleCardCount = ReadVarint(varintList)
    for i = 1, singleCardCount do 
        local cardDbfID = ReadVarint(varintList)
        table.insert(cardDbfIdList, cardDbfID)
    end

    -- 解析数量为 2 的卡片
    local doubleCardCount = ReadVarint(varintList)
    for i = 1, doubleCardCount do 
        local cardDbfID = ReadVarint(varintList)
        table.insert(cardDbfIdList, cardDbfID)
        table.insert(cardDbfIdList, cardDbfID)
    end

    -- 解析数量为 n 的卡片
    local multiCardCount = ReadVarint(varintList)
    for i = 1, multiCardCount do 
        local cardDbfID = ReadVarint(varintList)
        local cardCount = ReadVarint(varintList)
        for j = 1, cardCount do 
            table.insert(cardDbfIdList, cardDbfID)
        end
    end

    local o_deck
    if boolean_need_create_inst then 
        o_deck = G.NewInst('o_deck')
    else
        o_deck = {}
    end
    o_deck['卡组名称'] = '新卡组'
    o_deck['模式'] = '任意'
    if mode == 1 then 
        o_deck['模式'] = '狂野'
    elseif mode == 2 then 
        o_deck['模式'] = '标准'
    end
    o_deck['英雄'] = {}
    for _, heroDbfID in ipairs(heroList) do 
        if cardDbfIdDataDict[heroDbfID] ~= nil then 
            local i_card_英雄 = cardDbfIdDataDict[heroDbfID].name
            table.insert(o_deck['英雄'], i_card_英雄)
        else
            print('Cannot find hero by dbfid', heroDbfID)
        end
    end
    o_deck['卡牌列表'] = {}
    for _, cardDbfID in ipairs(cardDbfIdList) do 
        if cardDbfIdDataDict[cardDbfID] ~= nil then 
            local o_card_卡片 = cardDbfIdDataDict[cardDbfID]
            table.insert(o_deck['卡牌列表'], o_card_卡片)
        else
            print('Cannot find card by dbfid', cardDbfID)
        end
    end

    return o_deck
end
