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
    return true
end

t['法力消耗预览_修改数据'] = function (o_order_info_当前指令信息)
	print('trig 法力消耗预览')
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
	print('trig 法力消耗预览取消')
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

    o_order_info_当前指令信息['CasterObj'] = obj

    -- 控件父级设置
    local script_战场 = o_misc.主战场系统
    script_战场.跨界面操作框.addChild(obj)
    local posx, posy = obj.parent.globalToLocal(G.MousePos())
    obj.x = posx
    obj.y = posy

    -- 注册动画
    script_动画系统:push_quote('::CurPickCard', obj)
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
    script_战场.selfHandcard.c_handcards_self:pickcard_state(obj, true)
    script_战场.enemyHandcard.c_handcards_enemy:pickcard_state(true)
    script_战场.selfBattlehero.c_battlehero_self:pickcard_state(true)
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
	return G.call('卡牌进入功能区条件判断', o_order_info_当前指令信息)
end

t['卡牌进入功能区_修改数据'] = function (o_order_info_当前指令信息)
	print('trig 卡牌进入功能区')
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
    print('trig 随从切换站位')
end

--==========================================================
-- 卡牌确认使用
-- 0x10050008
--==========================================================
t['卡牌确认使用_事件'] = function (o_order_info_当前指令信息)
    return {'UI_卡牌确认使用'}
end

t['卡牌确认使用_条件'] = function (o_order_info_当前指令信息)
    return true
end

t['卡牌确认使用_修改数据'] = function (o_order_info_当前指令信息)
    -- 分支判断
    -- 抉择
    -- 随从
    -- 完成使用
    print('trig 卡牌确认使用')
end


















t['xxx_事件'] = function (o_order_info_当前指令信息)

end

t['xxx_条件'] = function (o_order_info_当前指令信息)

end

t['xxx_修改数据'] = function (o_order_info_当前指令信息)

end










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
    script_动画系统:clear_animquest()

    -- 删除连线控件
    while true do
        local obj_line = script_动画系统:pop_quote('::PopLine')
        if obj_line then
        else
            break
        end
    end
    script_战场:clear_popline()
    
    -- 手牌中删除
    local script_手牌组件 = script_战场.selfHandcard.c_handcards_self
    local obj = o_order_info_当前指令信息['CasterObj']
    local obj_index = script_手牌组件:get_cardindex_byobj(obj)
    if obj_index > 0 then
        script_手牌组件:removeCard(obj_index)
        
        -- 当前卡牌消耗，约定手牌obj的编号和逻辑编号一致
        -- 如果每张卡都有实例的话，就不用这个方法了
        G.call('角色_移除手牌', '我方', obj_index)
    end

    -- 手牌状态恢复
    script_手牌组件:pickcard_state(nil, false)
    script_战场.enemyHandcard.c_handcards_enemy:pickcard_state(false)
	script_战场.selfBattlehero.c_battlehero_self:pickcard_state(false)
    
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
    script_动画系统:clear_animquest()

    -- 删除连线控件
    while true do
        local obj_line = script_动画系统:pop_quote('::PopLine')
        if obj_line then
        else
            break
        end
    end
    script_战场:clear_popline()

    -- 手牌状态恢复
    local script_手牌组件 = script_战场.selfHandcard.c_handcards_self

    script_手牌组件:pickcard_state(nil, false)
    script_战场.enemyHandcard.c_handcards_enemy:pickcard_state(false)
	script_战场.selfBattlehero.c_battlehero_self:pickcard_state(false)
    
    -- 控件父级设置
    local obj = o_order_info_当前指令信息['CasterObj']
    local orgx, orgy = obj.localToGlobal(0, 0)
    script_手牌组件.布局点.addChild(obj)
    obj.x, obj.y = obj.parent.globalToLocal(orgx, orgy)
    
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
t['卡牌进入功能区条件判断'] = function(o_order_info_当前指令信息)
    return true
end