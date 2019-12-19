--[[3015

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.牌库分割线 = {
        self.obj.getChildByName('牌库顶分割线'),
        self.obj.getChildByName('牌库分割线'),
        self.obj.getChildByName('牌库底分割线'),
    }

    self.牌库容器 = {
        self.obj.getChildByName('牌库顶容器'),
        self.obj.getChildByName('牌库容器'),
        self.obj.getChildByName('牌库底容器'),
    }

    self.卡牌面板 = self.obj.getChildByName('卡牌面板')
    
    self.卡牌信息列表 = {}
    self.卡牌列表 = {}
end

function t:start()
    local get_cardinfo_iter = function (index)
        if index > #self.卡牌信息列表 then
            for i = (#self.卡牌信息列表 + 1), index, 1 do
                local obj = G.Clone(self.卡牌面板)
                self.卡牌信息列表[i] = obj
                obj.name = i
            end
        end
        return self.卡牌信息列表[index]
    end

    G.api['carddeck_func'] = function ()
        while true do
            G.wait1('UI_牌库更新')
            local index = 0
            local _o_randomlib_抽牌牌库 = G.misc()['我方牌库']

            for k,v in ipairs(_o_randomlib_抽牌牌库) do
                if v and v.datas and (#v.datas > 0) then
                    self.牌库分割线[k].visible = true
                    self.牌库容器[k].visible = true

                    for _,data in ipairs(v.datas) do
                        if (data['isvalid'] == 1) and (data['cur_weight'] > 0) then
                            index = index + 1

                            local card_obj = get_cardinfo_iter(index)
                            local card = data['value']
                            local 品质 = G.QueryName((card['逻辑数据'] or {})['品质'] or 0x10070001)

                            card_obj.visible = true
                            self.牌库容器[k].addChild(card_obj)
                            self.卡牌列表[index] = card

                            local text_obj = card_obj.getChildByName('卡牌信息')
                            text_obj.text = card.showname
                            text_obj.color = 品质['品质颜色']
                            text_obj.outColor = 0x1
                        end
                    end
                end
            end

            for i = index + 1, #self.卡牌信息列表, 1 do
                self.卡牌信息列表[i].visible = false
            end
        end
    end

    self.主战场 = G.misc().主战场系统
    G.start_program('carddeck_func')
end

function t:rollOver(tar)
    local index = tonumber(tar.name)
    if index > 0 then
        local card = self.卡牌列表[index]
        local posx, posy = tar.localToGlobal(0, 0)

        posy = posy - 30
        if posy > 530 then
            posy = 530
        elseif posy < 100 then
            posy = 100
        end

        self.主战场:showtips(card, posx - 120, posy)
    end
end

function t:rollOut(tar)
    local index = tonumber(tar.name)
    if index > 0 then
        self.主战场:hidetips()
    end
end

return t