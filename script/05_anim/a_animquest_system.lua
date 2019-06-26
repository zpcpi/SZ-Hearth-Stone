--[[500a

]]
local G = require "gf"
local t = G.act

-- 动画结构
--[[
    o_animactor
        quote_map -- 引用表(唯一)
        alias_map -- 别名表(允许指代多个)
        _o_animquest -- 并行执行的动画段
        
    o_obj
        obj -- 控件
        com_name -- 组件名称

    o_animquest
        is_mono -- 是否锁定动画队列
        time -- 段执行时长
        _o_animquest_shaft -- 并行执行的动画轴
        _o_animquest -- 后续并行执行的动画段

    o_animquest_shaft
        cur_index -- 当前节点(动态)

        str_obj -- 控件指代
        attr -- 控件属性
        _o_animquest_shaft_node -- 节点数组

    o_animquest_shaft_node
        v_target -- 目标数值
        time -- 过渡时间
        ... -- 曲线数值
        next_node -- 跳转节点，否则终止
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










