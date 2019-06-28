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
        obj -- 控件
        com_name -- 组件名称

    o_animquest
        is_mono -- 是否锁定动画队列
        time -- 段执行时长
        farg -- 执行函数功能
        _o_animquest_shaft -- 并行执行的动画轴
        _o_animquest -- 后续并行执行的动画段

    o_animquest_shaft
        str_obj -- 控件指代
        attr -- 控件属性
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
t['run_animquest_shaft'] = function(o_animactor, o_animquest, o_animquest_shaft)
    local iter = nil
    if o_animquest_shaft.str_obj then


    end

    if iter then
        local next_node = 1
        while next_node do
            local node = o_animquest_shaft._o_animquest_shaft_node[next_node]

            if node then
                if node.target then
                    -- 运动
    
                else
                    -- 不运动，单纯的等待
    
                end
                next_node = node.next_index
            else
                return
            end
        end
    end
end



--type=actor
t['run_animquest'] = function(o_animactor, o_animquest, is_run_child)
    -- RemoveAction

    -- 执行所有的动画轴
    local shaft_plist = {}
    for k,v in ipairs(o_animquest._o_animquest_shaft or {}) do
        local p = G.RunAction('run_animquest_shaft', o_animactor, o_animquest, v)
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

    -- 修正坐标
    -- todo

    -- 开启新动画
    if is_run_child then
        for k,v in ipairs(o_animquest._o_animquest or {}) do
            G.RunAction('run_animquest', o_animactor, v, true)
        end
    end
end

