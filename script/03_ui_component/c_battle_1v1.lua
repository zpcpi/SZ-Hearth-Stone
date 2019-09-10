--[[3006

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.enemyHandcard = self.obj.getChildByName('EnemyHandcard')
    self.enemyHandcard.c_handcards_enemy:InitDifference(
        G.call('角色_获取对手身份标识'),         -- PlayerType
        0x1001000f,      -- Anim Basd ID
        function (obj)   --  Tips fixfunc 
            obj.y = -160
        end,
        function (obj)   -- NewCard fixfunc
            obj.y = -200
        end
    )

    self.selfHandcard = self.obj.getChildByName('SelfHandcard')
    self.selfHandcard.c_handcards_self:InitDifference(
        G.call('角色_获取自己身份标识'),         -- PlayerType
        0x10010005,      -- Anim Basd ID
        function (obj)  -- Tips fixfunc 
            obj.y = 160
        end,
        function (obj)  -- NewCard fixfunc
            obj.y = 200
        end
    )
end

function t:AddPlayerCard(playerType)
    local script

    if self.selfHandcard.c_handcards_self:GetPlayerType() == playerType then 
        script = self.selfHandcard.c_handcards_self
    elseif self.enemyHandcard.c_handcards_enemy:GetPlayerType() == playerType then 
        script = self.enemyHandcard.c_handcards_enemy
    end
    if not script then 
        return 
    end
    script:addCard()
end

function t:RemovePlayerCard(playerType)
    local script

    if self.selfHandcard.c_handcards_self:GetPlayerType() == playerType then 
        script = self.selfHandcard.c_handcards_self
    elseif self.enemyHandcard.c_handcards_enemy:GetPlayerType() == playerType then 
        script = self.enemyHandcard.c_handcards_enemy
    end
    if not script then 
        return 
    end
    script:removeCard()
end

function t:GetHandcardNode(playerType)
    if self.selfHandcard.c_handcards_self:GetPlayerType() == playerType then 
        return self.selfHandcard
    elseif self.enemyHandcard.c_handcards_enemy:GetPlayerType() == playerType then 
        return self.enemyHandcard
    end
end

function t:GetAnimActor(playerType)
    local script

    if self.selfHandcard.c_handcards_self:GetPlayerType() == playerType then 
        script = self.selfHandcard.c_handcards_self
    elseif self.enemyHandcard.c_handcards_enemy:GetPlayerType() == playerType then 
        script = self.enemyHandcard.c_handcards_enemy
    end
    if not script then 
        return 
    end
    return script:GetAnimActor()
end

return t