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

UI_SPELL_TARGET_POS = {
    ['posx'] = 310,
    ['posy'] = 185,
}

UI_BATTLEMINIONS_POSX = {
    ['centerx'] = 0,
    ['spacex'] = 75,
}

CARD_FLAGS = {
    ['type'] = {
        [1] = '功能flag',
        [2] = '标记flag',
        [3] = '动态flag',
    },
    [1] = { -- 功能flag
        ['冲锋'] = 0,  ['嘲讽'] = 1,  ['剧毒'] = 2,  ['突袭'] = 3,  ['磁力'] = 4,
        ['潜行'] = 5,  ['圣盾'] = 6,  ['免疫'] = 7,  ['风怒'] = 8,  ['超级风怒'] = 9,
        ['吸血'] = 10, ['复生'] = 11, ['回响'] = 12, ['休眠'] = 13, ['双生法术'] = 14,
    },
    [2] = { -- 标记flag
        ['过载'] = 0,  ['战吼'] = 1,  ['亡语'] = 2,  ['抉择'] = 3,  ['抉择两次'] = 4,
        ['发现'] = 5,  ['超杀'] = 6,  ['激励'] = 7,  ['任务'] = 8,  ['抽到时释放'] = 9,
        ['反制'] = 10, ['招募'] = 11, ['进化'] = 12, ['升级'] = 13, ['秘密亡语'] = 14,
        ['连击'] = 15, ['祈求'] = 16, ['阴谋'] = 17, ['鉴定'] = 18, ['对战开始时'] = 19,
        ['支线任务'] = 20, ['自动变形'] = 21, ['选取相邻'] = 22, ['选取对面'] = 23, 

    },
    [3] = { -- 动态flag
        ['沉默'] = 0,  ['冻结'] = 1, 

    },
}
