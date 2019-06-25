--[[500a

]]
local G = require "gf"
local t = G.act

-- 动画结构
--[[
    o_animquest



    o_animquest_shaft
        obj -- 控件(动态)
        cur_index -- 当前节点(动态)
        flag_type -- 1:done or running,2:once or repeat
        _ran_index -- 已执行节点(动态)

        attr -- 控件属性
        is_com -- 是否c中的属性
        com_name -- c组件名称
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












