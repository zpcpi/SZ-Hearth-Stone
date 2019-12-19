--[[300c

]]

local G = require "gf"
local t = G.com()
function t:init()
    self.功能区 = self.obj.getChildByName('功能区')

    self.布局点 = self.功能区.getChildByName('布局点')

    self.随从占位 = self.布局点.getChildByName('随从占位')
    self.随从占位编号 = 0

    self.动画控件 = self.功能区.getChildByName('动画控件')
end

function t:start()
    self.MinionCount = 0
    self.ShowCount = 0
    self.minions = {}

    self.CurCard = nil

    self.主战场 = G.misc().主战场系统

    self.can_pick = true
    self.can_show = true
    self.point_list = {}

    self.actor = self.动画控件.c_animactor
    self.actor:push_quote('::Self', self)
end

function t:addMinion(o_card_卡牌, count)
    if type(count) == 'number' then
        if count > self.ShowCount then
            count = self.ShowCount + 1
        elseif count < 1 then
            count = 1
        end
    else
        count = self.ShowCount + 1
    end

    if o_card_卡牌 then
        local ui_card = G.loadUI('v_card_manager')
        self.布局点.addChild(ui_card)
    
        ui_card.mouseEnabled = true
        ui_card.scaleX = 0.3
        ui_card.scaleY = 0.3
        ui_card.c_card_manager:setData(o_card_卡牌, true)
    
        -- 随从的攻击指令
        G.call('卡牌注册指令', o_card_卡牌, 0x10040008)

        -- 插入到列表里面
        table.insert(self.minions, count, ui_card)
        self.MinionCount = self.MinionCount + 1
        self.ShowCount = self.ShowCount + 1

        -- 设置控件的初始位置
        local cur_point_list = self:pos计算(self.ShowCount)
        if cur_point_list then
            ui_card.x = cur_point_list[count]
        end
    else
        -- 空的，只是占位用的
        table.insert(self.minions, count, self.随从占位)
        if self.随从占位编号 == 0 then
            -- 之前没有占位的
            self.随从占位编号 = count
            self.ShowCount = self.ShowCount + 1
        else
            -- 之前有占位的，需要调换一下
            if self.随从占位编号 >= count then
                table.remove(self.minions, self.随从占位编号 + 1)
                self.随从占位编号 = count
            elseif self.随从占位编号 < count then
                table.remove(self.minions, self.随从占位编号)
                self.随从占位编号 = count - 1
            end
        end
    end
end

function t:get_cardindex_byobj(obj)
    for k,v in ipairs(self.minions or {}) do
        if v == obj then
            return k
        end
    end
    return 0
end

function t:get_cardobj_byindex(index)
    return (self.minions or {})[index]
end

function t:removeCard(del_count)
    if type(del_count) ~= 'number' then
        return
    end

    local count = self.ShowCount
    if count < del_count then
        return
    end

    local ui_card = self.minions[del_count]
    table.remove(self.minions, del_count)

    self.ShowCount = self.ShowCount - 1
    if ui_card == self.随从占位 then
        self.随从占位编号 = 0
    else
        ui_card.parent:removeChild(ui_card)
        ui_card.visible = false
        self.MinionCount = self.MinionCount - 1
    end
end

function t:removeBlank(del_count)
    if self.随从占位编号 > 0 then
        self:removeCard(self.随从占位编号)
    end
end

function t:rollOver(tar)
    if tar.parent == self.布局点 then
        if self.can_show then
            self.CurCard = tar

            local o_card_picked = tar.c_card_manager:getData()

            local posx, posy = tar.localToGlobal(0, 0)
            self.主战场:showtips(o_card_picked, posx + 160, posy)
        end
    end
end

function t:rollOut(tar)
    if tar.parent == self.布局点 then
        if self.can_show then
            self.CurCard = nil
            self.主战场:hidetips()
        end
    end
end

function t:mouseDown(tar)
    if tar.parent == self.布局点 then
        if self.can_pick then
            local o_card_picked = tar.c_card_manager:getData()

            if o_card_picked then
                G.trig_event('UI_抓取卡牌', o_card_picked, tar)
            end
        end
    end
end

function t:mouseUp(tar)
    if self.can_pick then
    else
        if tar.parent ~= self.布局点 then
            G.trig_event('UI_卡牌确认使用', '我方')
        elseif tar.parent == self.布局点 then
            local o_card_picked = tar.c_card_manager:getData()
            G.trig_event('UI_卡牌选择目标', o_card_picked, tar)
        end
    end
end

function t:can_pick_state(state)
    self.can_pick = state
end

function t:can_show_state(state)
    self.can_show = state
    if state then
    else
        self.主战场:hidetips()
    end
end

function t:pos计算(count)
    if (type(count) == 'number') and (count > 0) then
        if self.point_list[count] then
            return self.point_list[count]
        else
            local cur_point_list = {}
            local centerx = UI_BATTLEMINIONS_POSX['centerx']
            local spacex = UI_BATTLEMINIONS_POSX['spacex']
            local base_count = (count + 1) / 2.0
            for i = 1, count, 1 do
                cur_point_list[i] = centerx + spacex * (i - base_count)
            end
    
            self.point_list[count] = cur_point_list
            return cur_point_list
        end
    end
    return {}
end

function t:get_minion_index(posx, posy)
    posx, posy = self.布局点.globalToLocal(posx, posy)

    local count = math.max(self.ShowCount or 0, 0)
    local cur_point_list = self:pos计算(count)
    local d_spacex = UI_BATTLEMINIONS_POSX['spacex'] * 0.45

    -- print(self.ShowCount, self.MinionCount, count, self.随从占位编号)
    -- print(posx, posy)
    -- G.show_table(cur_point_list)

    local result = nil
    if count > 0 then
        if self.随从占位编号 > 0 then
            -- 往左找
            for i = 1, self.随从占位编号 - 1, 1 do
                if posx <= cur_point_list[i] + d_spacex then
                    return i
                end
            end
            -- 往右找
            for i = count, self.随从占位编号 + 1, -1 do
                if posx > cur_point_list[i] - d_spacex then
                    return i + 1
                end
            end
            return self.随从占位编号
        else
            -- 没有空位的情况下
            if posx <= cur_point_list[1] + d_spacex then
                return 1
            elseif posx > cur_point_list[count] - d_spacex then
                return count + 1
            else
                for i = 1, count - 1, 1 do
                    if (posx > cur_point_list[i] - d_spacex) and (posx <= cur_point_list[i+1] + d_spacex) then
                        return i+1
                    end
                end
            end
        end
    else
        return 1
    end
end

function t:set_minion_pos()
    local count = self.ShowCount
    local cur_point_list = self:pos计算(count)
    if cur_point_list then
        self.actor:clear_animquest()
        for i = 1, count, 1 do
            self.actor:add_animquest(
                G.call('动画系统_创建quest_自定义', self.actor, false, 300, {
                    [1] = {
                        n=4,
                        [1] = '动画系统_多属性设置', 
                        [2] = '::Self.minions[' .. i .. ']', 
                        [3] = {
                            [1] = 'x',
                            [2] = 'y',
                        },
                        [4] = {
                            [1] = cur_point_list[i],
                            [2] = 0,
                        }, 
                        [5] = {
                                ['x1']=0,
                                ['y1']=0.5,
                                ['x2']=0.5,
                                ['y2']=1,
                            },
                    },
                })
            )
        end
    end
end

return t