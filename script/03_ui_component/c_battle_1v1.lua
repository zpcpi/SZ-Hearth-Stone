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

    do
        self.main_actor_obj = self.obj.getChildByName('MainActor')
        -- 注册主动画系统
        local main_actor = self.main_actor_obj.c_animactor
        local o_misc = G.misc()
        o_misc.主动画系统 = main_actor
        o_misc.主战场系统 = self
        
        -- 动画系统引用注册
        main_actor:push_quote('::HandCards_Self', self.selfHandcard.c_handcards_self)
        main_actor:push_quote('::HandCards_Enemy', self.enemyHandcard.c_handcards_enemy)
        
        
        
        -- 其他控件注册
        o_misc.我方手牌控件 = self.selfHandcard
        o_misc.敌方1手牌控件 = self.enemyHandcard
    end
end

return t