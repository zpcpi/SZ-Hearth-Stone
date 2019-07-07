--[[500a

]]
local G = require "gf"
local t = G.act

-- 有两个规则，要求锁动画队列
-- 1，quest要求锁
-- 2，shatf修改了同一个数据

-- 动画结构
--[[
    o_animactor
        quote_map -- 引用表(唯一)
        alias_map -- 别名表(允许指代多个)
        __o_animquest -- 并行执行的动画段
        
    o_obj
        可能是obj，也可能是com
        需要使用的时候再判断

    o_animquest
        is_mono -- 是否锁定动画队列
        time -- 段执行时长
        farg -- 执行函数功能
        _o_animquest_shaft -- 并行执行的动画轴
        _o_animquest -- 后续并行执行的动画段

    o_animquest_shaft
        iter -- 执行函数
        _o_animquest_shaft_node -- 节点数组

    o_animquest_shaft_node
        v_target -- 目标数值
        time -- 过渡时间
        ... -- 曲线数值
        next_index -- 跳转节点，否则终止
]]

--[[
    曲线查看网站
    https://cubic-bezier.com/#1,0,.5,1

    函数调用
    o_pk = {
        time -- 帧
        value -- 值
        0
        ... -- 4个曲线参数
    }

    obj.setAnimKeys(attr, 2, pk)
    com.obj.setAnimKeys(attr, 2, pk, com.__name)
]]

--type=actor
t['run_animquest_shaft'] = function(o_animactor, o_animquest_shaft)
    if o_animquest_shaft and o_animquest_shaft.funs then
        local cur_index = 1
        while true do
            local nodeA = o_animquest_shaft['nodelist'][cur_index]
            local nodeB = o_animquest_shaft['nodelist'][nodeA['next_index'] or 0]

            if nodeA and nodeB then
                if nodeB['target'] then
                    o_animquest_shaft.funs(nodeA, nodeB)
                end
                G.wait_time(nodeA['time'])

                cur_index = nodeA['next_index']
            else
                return
            end
        end
    end
end

--type=actor
t['run_animquest'] = function(o_animactor, o_animquest, is_run_child)
    -- 初始化动画轴
    G.misc().当前演算体 = o_animactor
    G.misc().当前动画段 = o_animquest
    o_animquest['shaft'] = G.call('动画系统_汇总动画轴', o_animquest['iter'])

    -- 执行所有的动画轴
    local shaft_plist = {}
    for k,v in ipairs(o_animquest['shaft'] or {}) do
        local p = G.RunAction('run_animquest_shaft', o_animactor, v)
        table.insert(shaft_plist, p)
    end
    
    -- 等待动画过期
    G.wait_time(o_animquest.time)

    -- 关闭所有动画线程
    for k,v in ipairs(shaft_plist) do
        if v and v.co ~= nil then
            G.RemoveAction(v)
        end
    end

    -- 最终修正数值
    -- todo

    -- 开启新动画
    if is_run_child then
        for k,v in ipairs(o_animquest['child_quests'] or {}) do
            G.RunAction('run_animquest', o_animactor, v, true)
        end
    end
end

