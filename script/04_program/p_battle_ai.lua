--[[401c

]]
local G = require "gf"
local L = {}
local t = G.api

t['战斗AI_添加AI对手'] = function()
    local i_battle_ai_对手 = G.call('战斗AI_获取随机AI对手')
    -- TODO: 添加一个 AI 对手
    -- G.call('房间_更新玩家信息')
end

t['战斗AI_玩家空位补全AI'] = function()
    print('--== 战斗AI_玩家空位补全AI')
    -- TODO: 获取房间空位数量
    -- TODO: 房间空位补全 AI
end

--ret=i_battle_ai
t['战斗AI_获取随机AI对手'] = function()
    -- TODO: 获取当前游戏模式
    -- TODO: 通过游戏模式查找可用 AI
    -- TODO: 获取随机 AI
end

t['战斗AI_AI空位补全AI'] = function()
    print('--== 战斗AI_电脑空位补全AI')
    -- TODO: 获取AI空位数量
    -- TODO: AI空位补全 AI
end
