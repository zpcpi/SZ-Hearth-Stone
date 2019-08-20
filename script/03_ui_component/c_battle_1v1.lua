--[[3006

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.enemyHandcard = self.obj.getChildByName('EnemyHandcard')
    self.enemyHandcard.c_handcards_enemy:SetPlayerType('敌方1')
    self.selfHandcard = self.obj.getChildByName('SelfHandcard')
    self.selfHandcard.c_handcards_self:SetPlayerType('我方')
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