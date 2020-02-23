local G = require "gf"
local noti = G.notify

local function cardplay_infolist(...)
    --print(...)
end

local function cardplay_notify_create(func)
    noti[func] = function (...)
        cardplay_infolist(func, ...)
    end
    return true
end

local function cardplay_notify_init()
    local initlist = {
        -- 起头
        '卡牌使用_主流程',
        '卡牌攻击_主流程',

        -- 通用
        '卡牌使用_消耗法力',
        '卡牌使用_生效判断',
        '卡牌使用_使用',
        '卡牌使用_上场',
        '卡牌使用_随从召唤',
        '卡牌使用_武器装备',

        -- 子效果
        '技能效果_效果树_执行子效果',

        -- 关键词
        '卡牌关键词_战吼',
        '卡牌关键词_亡语',

        -- 系统
        '逻辑注册_初始化',
        '逻辑注册_别人初始化',
        '逻辑注册_上场',
        '逻辑注册_上手',
        '逻辑注册_生效',
        '逻辑注册_添加',

        -- 系统特殊
        '逻辑注册_水晶设置',
        '逻辑注册_抽牌',
        '逻辑注册_攻击次数重置_回合开始',
        '逻辑注册_攻击次数设置_单个上场',
        '逻辑注册_攻击状态设置_回合结束',
        '逻辑注册_武器功能_回合开始',
        '逻辑注册_武器功能_武器添加',
        '逻辑注册_武器功能_武器摧毁',
        '逻辑注册_武器功能_攻击力变化',
        '逻辑注册_武器功能_回合结束',
        '逻辑注册_武器功能_消耗耐久',
        '逻辑注册_战吼',
        '逻辑注册_卡牌死亡结算',
        '逻辑注册_死亡',
        '逻辑注册_冲锋添加',
        '逻辑注册_冲锋删除',
        '逻辑注册_回合结束_冻结删除判断',
        '逻辑注册_圣盾前置条件',
        '逻辑注册_圣盾抵消伤害',
        '逻辑注册_剧毒前置条件',
        '逻辑注册_剧毒消灭对方',
        '逻辑注册_风怒添加',
        '逻辑注册_风怒删除',
        '逻辑反注册_沉默',

        -- 效果
        '卡牌使用_攻击',
        '技能效果_法术伤害',
        '技能效果_英雄技能伤害',
        '技能效果_随从伤害',
        '技能效果_武器伤害',
        '技能效果_法术治疗',
        '技能效果_英雄技能治疗',
        '技能效果_随从治疗',
        '技能效果_武器治疗',
        '技能效果_法术强度生效',
        '技能效果_本回合当前水晶',
        '技能效果_最大水晶',
        '技能效果_当前水晶',
        '技能效果_本回合攻击',
        '技能效果_护甲',
        '技能效果_生命上限',
        '技能效果_攻击',
        '技能效果_特性',
        '技能效果_特性',
        '技能效果_本回合特性',
        '技能效果_添加BUFF',
        '技能效果_抽牌',
        '技能效果_创建手牌',
        '技能效果_设置生命上限',
        '技能效果_设置攻击力',
        '技能效果_战场光环',
        '技能效果_追踪术',
        '技能效果_召唤',
        '技能效果_奥数飞弹',
        '技能效果_变形',
        '技能效果_死亡结算',
        '技能效果_消灭目标',
        '技能效果_牧师脏牌',
        '技能效果_牧师精控',
        '技能效果_潜行者闷棍',
        '技能效果_装备武器',
        '技能效果_弃牌',

        -- 目标
        '技能目标_选取英雄',
        '技能目标_选取武器',
        '技能目标_选取随从',
        '技能目标_剔除目标',
        '技能目标_添加目标',
        '技能目标_随机选择',
    }

    G.call('array_map', initlist, cardplay_notify_create)
end

cardplay_notify_init()