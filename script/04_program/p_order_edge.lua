--[[4012

]]
local G = require "gf"
local L = {}
local t = G.api

local function table_attr_check(t, ...)
    if type(t) == 'table' then
        for _,v in ipairs({...}) do
            if type(t[v]) == 'table' then
            else
                t[v] = {}
            end
            t = t[v]
        end
    end
end

--==========================================================
-- 法力消耗预览
-- 0x10050001
--==========================================================
t['法力消耗预览_事件'] = function (o_order_info_当前指令信息)
    local Caster = o_order_info_当前指令信息['Caster']
    return {'UI_鼠标覆盖卡牌', Caster}
end

t['法力消耗预览_条件'] = function (o_order_info_当前指令信息)
    return G.call('卡牌抓取条件判断', o_order_info_当前指令信息) and
           G.call('卡牌法力水晶消耗判断', o_order_info_当前指令信息)
end

t['法力消耗预览_修改数据'] = function (o_order_info_当前指令信息)
    local Caster = o_order_info_当前指令信息['Caster']

    local 预览值 = Caster['费用'] or 0
    local 预览锁定值 = Caster['过载费用'] or 0

    G.call('角色_设置水晶数据', '我方', '预览值', 预览值)
    G.call('角色_设置水晶数据', '我方', '预览锁定值', 预览锁定值)
end

--==========================================================
-- 法力消耗预览取消
-- 0x10050012
--==========================================================
t['法力消耗预览取消_事件'] = function (o_order_info_当前指令信息)
    local Caster = o_order_info_当前指令信息['Caster']
    return {'UI_鼠标离开卡牌', Caster}
end

t['法力消耗预览取消_条件'] = function (o_order_info_当前指令信息)
    return true
end

t['法力消耗预览取消_修改数据'] = function (o_order_info_当前指令信息)
    local Caster = o_order_info_当前指令信息['Caster']
    G.call('角色_设置水晶数据', '我方', '预览值', 0)
    G.call('角色_设置水晶数据', '我方', '预览锁定值', 0)
end

--==========================================================
-- 抓取卡牌
-- 0x10050014
--==========================================================
t['抓取卡牌_事件'] = function (o_order_info_当前指令信息)
    local Caster = o_order_info_当前指令信息['Caster']
    return {'UI_抓取卡牌', Caster}
end

t['抓取卡牌_条件'] = function (o_order_info_当前指令信息)
    -- local Caster = o_order_info_当前指令信息['Caster']
    -- print('UI_抓取卡牌', string.format('0x%x', Caster['name']), Caster['showname'])
	return G.call('卡牌抓取条件判断', o_order_info_当前指令信息)
end

t['抓取卡牌_修改数据'] = function (o_order_info_当前指令信息)
    local o_misc = G.misc()
    local script_动画系统 = o_misc.主动画系统
    local _, obj = G.event_info()

    local copy_obj = G.Clone(obj)
    o_order_info_当前指令信息['CasterObj'] = obj
    o_order_info_当前指令信息['CasterObj_Clone'] = copy_obj
    copy_obj.alpha = 255
    copy_obj.mouseEnabled = false
    obj.visible = false

    -- 控件父级设置
    local script_战场 = o_misc.主战场系统
    script_战场.跨界面操作框.addChild(copy_obj)
    local posx, posy = copy_obj.parent.globalToLocal(G.MousePos())
    copy_obj.x = posx
    copy_obj.y = posy

    -- 注册动画
    script_动画系统:push_quote('::CurPickCard', copy_obj)
    script_动画系统:add_animquest(
        -- 朝向复位
        G.call('动画系统_创建quest', script_动画系统, G.QueryName(0x1001001b))
    )
    script_动画系统:add_animquest(
        -- 跟随鼠标
        G.call('动画系统_创建quest', script_动画系统, G.QueryName(0x1001001a))
    )

    -- 控件状态更改
    local script_战场 = o_misc.主战场系统
    script_战场.selfHandcard.c_handcards_self:pickcard(obj)
    script_战场.enemyHandcard.c_handcards_enemy:can_show_state(false)

    script_战场.selfBattlehero.c_battlehero_self:can_pick_state(false)
    script_战场.selfBattlehero.c_battlehero_self:can_show_state(false)
    script_战场.enemyBattlehero.c_battlehero_enemy:can_show_state(false)

    script_战场.selfBattleminion.c_battleminion_self:can_pick_state(false)
    script_战场.selfBattleminion.c_battleminion_self:can_show_state(false)
    script_战场.enemyBattleminion.c_battleminion_enemy:can_show_state(false)

    script_战场.InFuncArea = false
end

--==========================================================
-- 卡牌进入功能区
-- 0x10050005
--==========================================================
t['卡牌进入功能区_事件'] = function (o_order_info_当前指令信息)
    return {'UI_鼠标进入功能区'}
end

t['卡牌进入功能区_条件'] = function (o_order_info_当前指令信息)
    return G.call('卡牌进入功能区条件判断', o_order_info_当前指令信息) and
           G.call('卡牌法力水晶消耗判断', o_order_info_当前指令信息)
end

t['卡牌进入功能区_修改数据'] = function (o_order_info_当前指令信息)
end

--==========================================================
-- 卡牌进入功能区_单目标法术
-- 0x10050002
--==========================================================
t['卡牌进入功能区_单目标法术_修改数据'] = function (o_order_info_当前指令信息)
    local o_misc = G.misc()
    local script_动画系统 = o_misc.主动画系统
    local obj = o_order_info_当前指令信息['CasterObj']

    -- 创建指示线
    local script_战场 = o_misc.主战场系统
    local obj_line = script_战场:add_popline()
    
    -- 注册动画
    script_动画系统:clear_animquest()
    script_动画系统:push_quote('::PopLine', obj_line)
    script_动画系统:add_animquest(
        -- 卡牌位置移动到左侧
        G.call('动画系统_创建quest_自定义', script_动画系统, false, 300, 
        {
            [1] = {
                n = 4,
                [1] = '动画系统_设置全局位置',
                [2] = '::CurPickCard',
                [3] = {
                    [1] = 'x',
                    [2] = 'y',
                },
                [4] = {
                    [1] = UI_SPELL_TARGET_POS['posx'],
                    [2] = UI_SPELL_TARGET_POS['posy'],
                },
                [5]={
                    ['x1']=0,
                    ['y1']=0.5,
                    ['x2']=0.5,
                    ['y2']=1,
                },
            },
        })
    )
    script_动画系统:add_animquest(
        -- 注册连线动画
        G.call('动画系统_创建quest', script_动画系统, G.QueryName(0x10010019))
    )

    -- 控件状态更改
    script_战场.selfBattlehero.c_battlehero_self:can_show_state(true)
    script_战场.enemyBattlehero.c_battlehero_enemy:can_show_state(true)

    script_战场.selfBattleminion.c_battleminion_self:can_show_state(true)
    script_战场.enemyBattleminion.c_battleminion_enemy:can_show_state(true)
end

--==========================================================
-- 卡牌进入功能区_随从
-- 0x10050015
--==========================================================

t['卡牌进入功能区_随从_条件'] = function (o_order_info_当前指令信息)
    return G.call('卡牌进入功能区条件判断', o_order_info_当前指令信息) and
           G.call('卡牌法力水晶消耗判断', o_order_info_当前指令信息) and
           G.call('随从召唤条件判断', o_order_info_当前指令信息)
end

t['卡牌进入功能区_随从_修改数据'] = function (o_order_info_当前指令信息)
    local o_misc = G.misc()

    -- 控件状态更改
    local script_战场 = o_misc.主战场系统
    local script_己方战场随从 = script_战场.selfBattleminion.c_battleminion_self
    script_战场:move_state(true)

    -- 添加一个占位
    local index = script_己方战场随从:get_minion_index(G.MousePos())
    script_己方战场随从:addMinion(nil, index)
    script_己方战场随从:set_minion_pos()

    -- 随从站位记录
    o_order_info_当前指令信息['MinionPos'] = index

    -- TODO，根据随从的目标选择方式，来显示额外的信息
end

--==========================================================
-- 卡牌返回手牌区
-- 0x10050006
--==========================================================
t['卡牌返回手牌区_事件'] = function (o_order_info_当前指令信息)
    return {'UI_鼠标进入手牌区'}
end

t['卡牌返回手牌区_条件'] = function (o_order_info_当前指令信息)
    return true
end

t['卡牌返回手牌区_修改数据'] = function (o_order_info_当前指令信息)

end

--==========================================================
-- 卡牌选择目标
-- 0x1005000a
--==========================================================
t['卡牌选择目标_事件'] = function (o_order_info_当前指令信息)
    return {'UI_卡牌选择目标'}
end

t['卡牌选择目标_条件'] = function (o_order_info_当前指令信息)
    local Target, tar_obj = G.event_info()

    -- 条件判断




    return true
end

t['卡牌选择目标_修改数据'] = function (o_order_info_当前指令信息)
    local Target, tar_obj = G.event_info()
    
    table_attr_check(o_order_info_当前指令信息, 'Target')
    table.insert(o_order_info_当前指令信息['Target'], Target)

    table_attr_check(o_order_info_当前指令信息, 'TargetObj')
    table.insert(o_order_info_当前指令信息['TargetObj'], tar_obj)
end

--==========================================================
-- 卡牌抉择
-- 0x1005000b
--==========================================================
t['卡牌抉择_事件'] = function (o_order_info_当前指令信息)
    return {'UI_发现选择卡牌'}
end

t['卡牌抉择_条件'] = function (o_order_info_当前指令信息)
    return true
end

t['卡牌抉择_修改数据'] = function (o_order_info_当前指令信息)
    print('trig 卡牌抉择')
end

--==========================================================
-- 卡牌取消指令
-- 0x1005000d
--==========================================================
t['卡牌取消指令_事件'] = function (o_order_info_当前指令信息)
    return {'UI_取消操作'}
end

t['卡牌取消指令_条件'] = function (o_order_info_当前指令信息)
    -- local Caster = o_order_info_当前指令信息['Caster']
    -- print('UI_取消操作', string.format('0x%x', Caster['name']), Caster['showname'])
    return true
end

t['卡牌取消指令_修改数据'] = function (o_order_info_当前指令信息)

end

--==========================================================
-- 随从切换站位
-- 0x10050007
--==========================================================
t['随从切换站位_事件'] = function (o_order_info_当前指令信息)
    return {'UI_鼠标切换站位'}
end

t['随从切换站位_条件'] = function (o_order_info_当前指令信息)
    return true
end

t['随从切换站位_修改数据'] = function (o_order_info_当前指令信息)
    local o_misc = G.misc()
    local script_战场 = o_misc.主战场系统
    local script_己方战场随从 = script_战场.selfBattleminion.c_battleminion_self
    
    local index = G.event_info()
    script_己方战场随从:addMinion(nil, index)
    script_己方战场随从:set_minion_pos()

    -- 随从站位记录
    o_order_info_当前指令信息['MinionPos'] = index
end

--==========================================================
-- 卡牌确认使用
-- 0x10050008
--==========================================================
t['卡牌确认使用_事件'] = function (o_order_info_当前指令信息)
    return {'UI_卡牌确认使用'}
end

t['卡牌确认使用_条件'] = function (o_order_info_当前指令信息)
    local side = G.event_info()

    return true
end

t['卡牌确认使用_修改数据'] = function (o_order_info_当前指令信息)
    -- 分支判断
    -- 抉择
    -- 随从
    -- 完成使用
end

--==========================================================
-- 卡牌确认使用_随从中途
-- 0x10050016
--==========================================================

t['卡牌确认使用_随从中途_条件'] = function (o_order_info_当前指令信息)
    -- TODO，判断下符合条件的目标是否存在
    return true
end

t['卡牌确认使用_随从中途_修改数据'] = function (o_order_info_当前指令信息)
    local o_misc = G.misc()
    local script_动画系统 = o_misc.主动画系统
    local script_战场 = o_misc.主战场系统

    -- 停止鼠标跟随
    script_动画系统:clear_animquest()

    -- 显示用卡牌隐藏
    local copy_obj = o_order_info_当前指令信息['CasterObj_Clone']
    copy_obj.visible = false

    -- 战场随从设置
    local script_己方战场随从 = script_战场.selfBattleminion.c_battleminion_self
    local Caster = o_order_info_当前指令信息['Caster']
    local index = o_order_info_当前指令信息['MinionPos']
    script_战场:move_state(false)
    script_己方战场随从:can_show_state(true)
    script_己方战场随从:removeBlank()
    script_己方战场随从:addMinion(Caster, index)
    script_己方战场随从:set_minion_pos()
    script_战场.enemyBattleminion.c_battleminion_enemy:can_show_state(true)
    script_战场.selfBattlehero.c_battlehero_self:can_show_state(true)
    script_战场.enemyBattlehero.c_battlehero_enemy:can_show_state(true)

    -- 注册随从控件
    local obj_minion = script_己方战场随从:get_cardobj_byindex(index)
    o_order_info_当前指令信息['CurPlayMinionObj'] = obj_minion
    script_动画系统:push_quote('::CurPickMinion', obj_minion)

    -- 注册动画
    local obj_line = script_战场:add_popline()
    script_动画系统:push_quote('::PopLine', obj_line)
    script_动画系统:add_animquest(
        -- 注册连线动画
        G.call('动画系统_创建quest', script_动画系统, G.QueryName(0x1001001c))
    )
end















-- t['xxx_事件'] = function (o_order_info_当前指令信息)

-- end

-- t['xxx_条件'] = function (o_order_info_当前指令信息)

-- end

-- t['xxx_修改数据'] = function (o_order_info_当前指令信息)

-- end










--==========================================================
-- 通用功能_指令结束
--==========================================================

t['卡牌注册指令_初始化'] = function (o_order_info_当前指令信息, o_card_使用卡牌)
    o_order_info_当前指令信息['Caster'] = o_card_使用卡牌
end

t['卡牌注册指令_完成'] = function (o_order_info_当前指令信息)
    -- 鼠标跟随终止
    local o_misc = G.misc()
    local script_动画系统 = o_misc.主动画系统
    local script_战场 = o_misc.主战场系统

    script_动画系统:pop_quote('::CurPickCard')
    script_动画系统:pop_quote('::CurPickMinion')
    script_动画系统:clear_animquest()

    -- 水晶预览取消
    G.call('角色_设置水晶数据', '我方', '预览值', 0)
    G.call('角色_设置水晶数据', '我方', '预览锁定值', 0)

    -- 删除连线控件
    while true do
        local obj_line = script_动画系统:pop_quote('::PopLine')
        if obj_line then
        else
            break
        end
    end
    script_战场:clear_popline()
    
    -- 显示用卡牌删除
    local copy_obj = o_order_info_当前指令信息['CasterObj_Clone']
    copy_obj.visible = false
    copy_obj.parent:removeChild(copy_obj)

    -- 手牌中删除
    local script_手牌组件 = script_战场.selfHandcard.c_handcards_self
    local obj = o_order_info_当前指令信息['CasterObj']
    local obj_index = script_手牌组件:get_cardindex_byobj(obj)
    if obj_index > 0 then
        -- 当前卡牌消耗，约定手牌obj的编号和逻辑编号一致
        -- 如果每张卡都有实例的话，就不用这个方法了
        G.call('角色_移除手牌', '我方', obj_index)
    end

    -- 手牌状态恢复
    script_手牌组件:pickcard(nil)
    script_战场.enemyHandcard.c_handcards_enemy:can_show_state(true)
	script_战场.selfBattlehero.c_battlehero_self:can_pick_state(true)
	script_战场.selfBattlehero.c_battlehero_self:can_show_state(true)
    script_战场.enemyBattlehero.c_battlehero_enemy:can_show_state(true)
    
    -- 战场随从恢复
    script_战场:move_state(false)
    local script_己方战场随从 = script_战场.selfBattleminion.c_battleminion_self
    script_己方战场随从:can_pick_state(true)
    script_己方战场随从:can_show_state(true)
    script_己方战场随从:removeBlank()
    script_战场.enemyBattleminion.c_battleminion_enemy:can_show_state(true)

    if o_order_info_当前指令信息['CurPlayMinionObj'] then
        -- TODO，不应该直接删除，而是在后续添加时额外判断一次
        script_己方战场随从:removeCard(o_order_info_当前指令信息['MinionPos'])
    end

    script_己方战场随从:set_minion_pos()
    
    -- 播放复位动画
    local int_当前手牌数量 =  G.call('角色_获取手牌数量', '我方')
    if int_当前手牌数量 > 0 then
        script_动画系统:add_animquest(
            G.call('动画系统_创建quest', script_动画系统, G.QueryName(script_手牌组件.AnimBaseID + int_当前手牌数量 - 1))
        )
    end
end

t['卡牌注册指令_退出'] = function (o_order_info_当前指令信息)
    -- 鼠标跟随终止
    local o_misc = G.misc()
    local script_动画系统 = o_misc.主动画系统
    local script_战场 = o_misc.主战场系统

    script_动画系统:pop_quote('::CurPickCard')
    script_动画系统:pop_quote('::CurPickMinion')
    script_动画系统:clear_animquest()

    -- 水晶预览取消
    G.call('角色_设置水晶数据', '我方', '预览值', 0)
    G.call('角色_设置水晶数据', '我方', '预览锁定值', 0)

    -- 删除连线控件
    while true do
        local obj_line = script_动画系统:pop_quote('::PopLine')
        if obj_line then
        else
            break
        end
    end
    script_战场:clear_popline()

    local script_手牌组件 = script_战场.selfHandcard.c_handcards_self

    -- 手牌状态恢复
    script_手牌组件:pickcard(nil)
    script_战场.enemyHandcard.c_handcards_enemy:can_show_state(true)
	script_战场.selfBattlehero.c_battlehero_self:can_pick_state(true)
	script_战场.selfBattlehero.c_battlehero_self:can_show_state(true)
    script_战场.enemyBattlehero.c_battlehero_enemy:can_show_state(true)
    
    -- 战场随从恢复
    script_战场:move_state(false)
    local script_己方战场随从 = script_战场.selfBattleminion.c_battleminion_self
    script_己方战场随从:can_pick_state(true)
    script_己方战场随从:can_show_state(true)
    script_己方战场随从:removeBlank()
    script_战场.enemyBattleminion.c_battleminion_enemy:can_show_state(true)

    if o_order_info_当前指令信息['CurPlayMinionObj'] then
        script_己方战场随从:removeCard(o_order_info_当前指令信息['MinionPos'])
    end

    script_己方战场随从:set_minion_pos()
    
    -- 控件父级设置
    local obj = o_order_info_当前指令信息['CasterObj']
    local copy_obj = o_order_info_当前指令信息['CasterObj_Clone']
    local orgx, orgy = copy_obj.localToGlobal(0, 0)

    -- TODO，如果有随从，播放随从变卡动画
    obj.x, obj.y = obj.parent.globalToLocal(orgx, orgy)
    obj.rotation = 0
    obj.visible = true
    copy_obj.visible = false
    copy_obj.parent:removeChild(copy_obj)
    
    -- 播放复位动画
    local int_当前手牌数量 =  G.call('角色_获取手牌数量', '我方')
    if int_当前手牌数量 > 0 then
        script_动画系统:add_animquest(
            G.call('动画系统_创建quest', script_动画系统, G.QueryName(script_手牌组件.AnimBaseID + int_当前手牌数量 - 1))
        )
    end
end

--==========================================================
-- 通用功能_条件
--==========================================================
--ret=boolean
t['卡牌抓取条件判断'] = function(o_order_info_当前指令信息)
    -- TODO: 是否是当前回合
    return true
end

--ret=boolean
t['卡牌法力水晶消耗判断'] = function(o_order_info_当前指令信息)
    local Caster = o_order_info_当前指令信息['Caster']

    local 预览值 = Caster['费用'] or 0
    local 当前值 = G.call('角色_获取水晶数据', '我方', '当前值')
    return 预览值 <= 当前值
end

--ret=boolean
t['卡牌进入功能区条件判断'] = function(o_order_info_当前指令信息)
    return true
end

--ret=boolean
t['随从召唤条件判断'] = function(o_order_info_当前指令信息)
    return true
end