--[[3006

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.enemyHandcard = self.obj.getChildByName('EnemyHandcard')
    self.enemyHandcard.c_handcards_enemy:InitDifference(
        0x1001000f,      -- Anim Basd ID
        function (obj)   -- NewCard fixfunc
            obj.y = -200
        end
    )

    self.selfHandcard = self.obj.getChildByName('SelfHandcard')
    self.selfHandcard.c_handcards_self:InitDifference(
        0x10010005,      -- Anim Basd ID
        function (obj)  -- NewCard fixfunc
            obj.y = 200
        end
    )

    self.特效层级 = self.obj.getChildByName('特效层级')
    self.跨界面操作框 = self.obj.getChildByName('跨界面操作框')
    self.selfPlayQueue = self.obj.getChildByName('selfPlayQueue').c_battle_playqueue_self
    self.enemyPlayQueue = self.obj.getChildByName('enemyPlayQueue').c_battle_playqueue_enemy

    self.endTurnBtn = self.obj.getChildByName('EndTurnButton')

    -- 进出功能区开关
    self.InFuncArea = false
    self.can_move = false

    -- 其他控件注册
    self.selfBattlehero = self.obj.getChildByName('SelfBattleHero')
    self.enemyBattlehero = self.obj.getChildByName('EnemyBattleHero')

    self.selfBattlemana = self.obj.getChildByName('SelfBattleMana')
    self.enemyBattlemana = self.obj.getChildByName('EnemyBattleMana')

    self.selfBattleminion = self.obj.getChildByName('SelfBattleMinion')
    self.enemyBattleminion = self.obj.getChildByName('EnemyBattleMinion')

    self.Record = self.obj.getChildByName('Record')
    self.Record_功能区 = self.Record.getChildByName('功能区')
    self.carddeckPanel = self.Record_功能区.getChildByName('我方牌库面签')
    self.carddeck = self.carddeckPanel.getChildByName('容器')

    self.tips版 = self.obj.getChildByName('全局Tips版')
    self:initTipsCard()

    self.choose = self.obj.getChildByName('Choose').c_choose

    -- 连线管理
    self.popline_list = {}

    local o_misc = G.misc()
    o_misc.主战场系统 = self
    do
        self.main_actor_obj = self.obj.getChildByName('MainActor')
        -- 注册主动画系统
        local main_actor = self.main_actor_obj.c_animactor
        o_misc.主动画系统 = main_actor
        
        -- 动画系统引用注册
        main_actor:push_quote('::HandCards_Self', self.selfHandcard.c_handcards_self)
        main_actor:push_quote('::HandCards_Enemy', self.enemyHandcard.c_handcards_enemy)
    end
    do
        self.skill_actor_obj = self.obj.getChildByName('SkillActor')
        -- 注册技能动画系统
        local skill_actor = self.skill_actor_obj.c_animactor
        o_misc.技能动画系统 = skill_actor

        -- 动画系统引用注册
        skill_actor:push_quote('::HandCards_Self', self.selfHandcard.c_handcards_self)
        skill_actor:push_quote('::HandCards_Enemy', self.enemyHandcard.c_handcards_enemy)

    end
end

function t:rmouseUp()
    G.trig_event('UI_取消操作')
end

function t:mouseMove()
    local posx, posy = G.MousePos()

    if self.InFuncArea then
        local area = UI_IN_HAND_AREA
        if (posy < area['maxy']) and (posx > area['minx']) and (posx < area['maxx']) then
            self.InFuncArea = false
            G.trig_event('UI_鼠标进入手牌区')
        end
    else
        -- 手牌控件区域，出去时增加了一定的延展距离，防止选中卡牌后立即触发了进入功能区事件
        local area = UI_IN_FUNC_AREA
        if (posy > area['maxy']) or (posx < area['minx']) or (posx > area['maxx']) then
            self.InFuncArea = true
            G.trig_event('UI_鼠标进入功能区')
        end
    end

    if self.can_move then
        local script_己方战场随从 = self.selfBattleminion.c_battleminion_self
        local index = script_己方战场随从:get_minion_index(G.MousePos())
        if index ~= script_己方战场随从.随从占位编号 then
            G.trig_event('UI_鼠标切换站位', index)
        end
    end
end

function t:update()
    -- FIXME: 不应该写在 update 中
    -- self:update_end_turn_button()
end

function t:click(tar)
    LuaPanda.BP()
    if G.call('对决_当前是否是我方回合') and tar == self.endTurnBtn then 
        local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', '我方')
        G.call('对决_回合结束', estr_absolute_id_type_绝对身份)
    end
end

function t:mouseUp(tar)
    G.trig_event('UI_卡牌确认使用')
end

-- 连线设置
function t:add_popline()
    local ui_line = G.loadUI('v_pop_pointline')
    self.跨界面操作框.addChild(ui_line)
    table.insert(self.popline_list, ui_line)
    
    return ui_line.c_pop_pointline
end

function t:clear_popline()
    for _,ui_line in ipairs(self.popline_list) do
        ui_line.parent:removeChild(ui_line)
        ui_line.visible = false
        ui_line.c_pop_pointline = nil
    end

    self.popline_list = {}
end

-- 创建特效飞弹
function t:add_missile(posx, posy)
    local ui_mis = G.loadUI('v_missile')
    self.特效层级.addChild(ui_mis)

    -- 设置初始位置
    ui_mis.x, ui_mis.y = self.特效层级.globalToLocal(posx, posy)
    ui_mis.scaleX, ui_mis.scaleY = 0.06, 0.06

    return ui_mis
end

function t:update_end_turn_button()
    local string_按钮文字 = ''
    if G.call('对决_当前是否是我方回合') then 
        local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', '我方')    
        if G.call('角色_是否剩余可用水晶', estr_absolute_id_type_绝对身份) then
            string_按钮文字 = '结束回合(黄)'
        else
            string_按钮文字 = '结束回合(绿)'
        end
    else
        string_按钮文字 = '对方回合'
    end
    if self.endTurnBtn.c_button.text ~= string_按钮文字 then 
        self.endTurnBtn.c_button.text = string_按钮文字
    end
end

function t:initTipsCard()
    local ui_card = G.loadUI('v_card_manager')
    self.tips版.addChild(ui_card)
    self.TipsCard = ui_card

    ui_card.visible = false
    ui_card.scaleX = 0.7
    ui_card.scaleY = 0.7
end

-- tips在全局显示
function t:showtips(o_card, posx, posy)
    self.TipsCard.visible = true
    self.TipsCard.x, self.TipsCard.y = self.TipsCard.parent.globalToLocal(posx, posy)

    local get_attr = CARD_GET_ATTR
    local cardtype = get_attr(o_card, '逻辑数据', '类型')
    local pos = get_attr(o_card, '动态数据', '卡牌位置')
    if (cardtype == 0x10090001) and (pos == '战场') then
        -- 是英雄卡，并且在战场
        self.TipsCard.c_card_manager:setData(o_card, true)
    else
        self.TipsCard.c_card_manager:setData(o_card)
    end
end

function t:hidetips()
    self.TipsCard.visible = false
end

function t:can_move_state(moving)
    self.can_move = moving
end

return t