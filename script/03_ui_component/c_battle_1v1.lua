--[[3006

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.enemyHandcard = self.obj.getChildByName('EnemyHandcard')
    self.enemyHandcard.c_handcards_enemy:InitDifference(
        0x1001000f,      -- Anim Basd ID
        function (obj)   --  Tips fixfunc 
            obj.y = -180
        end,
        function (obj)   -- NewCard fixfunc
            obj.y = -200
        end
    )

    self.selfHandcard = self.obj.getChildByName('SelfHandcard')
    self.selfHandcard.c_handcards_self:InitDifference(
        0x10010005,      -- Anim Basd ID
        function (obj)  -- Tips fixfunc 
            obj.y = 140
        end,
        function (obj)  -- NewCard fixfunc
            obj.y = 200
        end
    )

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


    end


    self.跨界面操作框 = self.obj.getChildByName('跨界面操作框')

    self.endTurnBtn = self.obj.getChildByName('EndTurnButton')

    -- 进出功能区开关
    self.InFuncArea = false

    -- 其他控件注册
    self.selfBattlehero = self.obj.getChildByName('SelfBattleHero')
    self.enemyBattlehero = self.obj.getChildByName('EnemyBattleHero')

    self.selfBattlemana = self.obj.getChildByName('SelfBattleMana')
    self.enemyBattlemana = self.obj.getChildByName('EnemyBattleMana')

    self.selfBattleminion = self.obj.getChildByName('SelfBattleMinion')
    self.enemyBattleminion = self.obj.getChildByName('EnemyBattleMinion')

    -- 连线管理
    self.popline_list = {}
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

end

function t:click(tar)
    if tar == self.endTurnBtn then 
        G.call('对决_我方回合结束')
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
    end

    self.popline_list = {}
end

-- tips在全局显示
function t:showtips(o_card, posx, posy)



end


return t