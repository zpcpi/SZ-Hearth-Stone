DEFAULT_NET_PORT = '3363'

PLAYER_ONLY_KEY_LIST = {'玩家名称', '玩家IP', '是主机'}


HANDCARDS_MAX_COUNT = 10
MANA_MAX_COUNT = 10
BATTLEMINIONS_MAX_COUNT = 7

UI_IN_FUNC_AREA = {
    ['minx'] = 285,
    ['miny'] = 0,
    ['maxx'] = 795,
    ['maxy'] = 155,
}

UI_IN_HAND_AREA = {
    ['minx'] = 315,
    ['miny'] = 0,
    ['maxx'] = 765,
    ['maxy'] = 110,
}

UI_SPELL_SHOW_POS = {
    ['posx'] = 160,
    ['posy'] = 380,
}

UI_BATTLEMINIONS_POSX = {
    ['centerx'] = 0,
    ['spacex'] = 85,
}

CARD_FLAGS = {
    ['type'] = {
        [1] = '功能flag',
        [2] = '标记flag',
        [3] = '动态flag',
        [4] = '标签flag',
    },
    [1] = { -- 功能flag，不要改旧编号
        ['冲锋'] = 0,  ['嘲讽'] = 1,  ['剧毒'] = 2,  ['突袭'] = 3,  ['磁力'] = 4,
        ['潜行'] = 5,  ['圣盾'] = 6,  ['免疫'] = 7,  ['风怒'] = 8,  ['超级风怒'] = 9,
        ['吸血'] = 10, ['复生'] = 11, ['回响'] = 12, ['休眠'] = 13, ['双生法术'] = 14,
        ['不能攻击英雄'] = 15,
    },
    [2] = { -- 标记flag，不要改旧编号
        ['过载'] = 0,  ['战吼'] = 1,  ['亡语'] = 2,  ['抉择'] = 3,  ['抉择两次'] = 4,
        ['发现'] = 5,  ['超杀'] = 6,  ['激励'] = 7,  ['任务'] = 8,  ['抽到时释放'] = 9,
        ['反制'] = 10, ['招募'] = 11, ['进化'] = 12, ['升级'] = 13, ['秘密亡语'] = 14,
        ['连击'] = 15, ['祈求'] = 16, ['阴谋'] = 17, ['鉴定'] = 18, ['对战开始时'] = 19,
        ['支线任务'] = 20, ['自动变形'] = 21, ['选取相邻'] = 22, ['选取对面'] = 23, ['光环'] = 24,
        ['法术伤害'] = 25, ['英雄技能伤害'] = 26, ['被动'] = 27,
    },
    [3] = { -- 动态flag，随便改
        ['沉默'] = 0, -- 被沉默，需要清空技能和buff
        ['冻结'] = 1, -- 被冻结，在回合结束时，有攻击次数剩余解冻
        ['等待死亡'] = 2, -- 被消灭，或者负血被检测到
        ['首回合召唤'] = 3, -- 首回合登场，无法攻击，突袭免疫也会用到
        ['已经登场'] = 4, -- 已经算是场面的随从了，解决随从召唤动画问题
        ['未知'] = 5, -- 不完全清楚卡牌的信息
        ['武器开启'] = 6, -- 一般情况下，武器在自己回合才会打开
    },
    [4] = { -- 标签flag，随便改
        ['白银之手新兵'] = 0, 
        ['动物伙伴'] = 1, 
    }
}

EVENT_PRIOR = {
    first = 99999999,

    weaponDurability = 1000, -- 需要在武器免疫失去之前

    -- 回合开始要做的东西
    SetMana = 100,
    weaponEffect = 80,
    setAttackCount = 70,
    drawCard = -100, -- 抽牌在卡牌逻辑之后

    -- 回合结束要做的东西
    cancelFrozen = 69, -- 在“设置攻击次数”之后

    -- 伤害流程
    spellDamage = 100,

    divineShield = -1000, -- 圣盾抵消伤害，确保伤害不为0才触发
    poisonous = -2000, -- 确定造成伤害了，再消灭对方
    
    base = 0,



    last = -99999999,
}

EVENT_GROUP = {
    system = 'system', -- 系统默认分组

    -- 回合开始要做的东西
    SetMana = '设置水晶数',
    drawCard = '抽牌',
    setAttackCount = '设置攻击次数',
    weaponEffect = '武器功能',

    -- 回合结束要做的东西
    cancelFrozen = '冻结解除',

    charge = '冲锋',
    divineShield = '圣盾',
    poisonous = '剧毒',
    Windfury = '风怒',

    weaponDurability = '武器耐久',

    spellDamage = '法术强度',
}

-- 敌方1
-- 我方
-- 我方的敌方1，指代我行动回合结束时行动的人
PLAYER_MAPPING_L2A_1v1 = {
    ['红1'] = {
        ['我方'] = '红1',
        ['敌方1'] = '蓝1',
    },
    ['蓝1'] = {
        ['我方'] = '蓝1',
        ['敌方1'] = '红1',
    },
}

-- 敌方2 敌方1
-- 友方1 我方
-- 我方的敌方1，指代我行动回合结束时行动的人
PLAYER_MAPPING_L2A_2v2 = {
    ['红1'] = {
        ['我方'] = '红1',
        ['友方1'] = '红2',
        ['敌方1'] = '蓝1',
        ['敌方2'] = '蓝2',
    },
    ['红2'] = {
        ['我方'] = '红2',
        ['友方1'] = '红1',
        ['敌方1'] = '蓝2',
        ['敌方2'] = '蓝1',
    },
    ['蓝1'] = {
        ['我方'] = '蓝1',
        ['友方1'] = '蓝2',
        ['敌方1'] = '红2',
        ['敌方2'] = '红1',
    },
    ['蓝2'] = {
        ['我方'] = '蓝2',
        ['友方1'] = '蓝1',
        ['敌方1'] = '红1',
        ['敌方2'] = '红2',
    },
}

local function A2L_iter(mapping)
    local t = {}
    for estr_absolute_id_type_绝对身份,sub_mapping in pairs(mapping) do
        local sub_t = {}
        t[estr_absolute_id_type_绝对身份] = sub_t
        for estr_player_相对身份,estr_absolute_id_type_绝对身份2 in pairs(sub_mapping) do
            sub_t[estr_absolute_id_type_绝对身份2] = estr_player_相对身份
        end
    end
    return t
end

PLAYER_MAPPING_A2L_2v2 = A2L_iter(PLAYER_MAPPING_L2A_2v2)
PLAYER_MAPPING_A2L_1v1 = A2L_iter(PLAYER_MAPPING_L2A_1v1)

function CARD_GET_ATTR(odata, key, ...)
    if key then
        if type(odata) == 'table' then
            return CARD_GET_ATTR(odata[key], ...)
        end
    end
    return odata
end

