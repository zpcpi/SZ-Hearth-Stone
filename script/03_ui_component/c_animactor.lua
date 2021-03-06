--[[305b

]]

local G = require "gf"
local t = G.com()



function t:init()
    -- 数据初始化
    self.quote_map = {}
    self.alias_map = {}
    self.__o_animquest = {}

    self.cur_pthread = nil

    self.cur_animquest_list = nil
    self.cur_animquest = nil

    self.cur_animquest_list_stack = nil
    self.cur_animquest_stack = nil
end

function t:start()
end

--[[
    -- 格式
    ::Name --引用
    _Name --别名，指代多个控件

    ::Name.chile_obj.com.attr_name

    .的用法
        1，子控件查找
        2，组件查找

    -- 约定的引用
    ::Caster -- 释放者，指代使用的卡片
    ::Target -- 释放目标
    ::Owner -- 效果拥有者

    -- 约定的别名
    _Card
    _Hero -- 英雄[4]
    _Weapon -- 玩家的武器[4]
    _Spell -- 玩家的英雄技能[4]
    _Secret -- 玩家头顶的奥秘组[4]
    _Missile -- 飞弹

    self -- 动画段自身持有的控件，一般就是刚刚创建的
]]

-- 引用相关设置
-- 引用在同一时刻只能指代一个控件
-- 引用在栈，可以保存之前曾指代过的控件（适合在动画递归并返回时获取到旧数据）
function t:push_quote(key, obj)
    local list = self.quote_map[key]
    if list then
    else
        -- list为空
        list = {}
        self.quote_map[key] = list
    end
    local count = #list or 0
    list[count + 1] = obj
end
function t:get_quote(key)
    local list = self.quote_map[key] or {}
    return list[#list]
end
function t:pop_quote(key)
    local list = self.quote_map[key]
    if list then
        local obj = self:get_quote(key)
        --删除数组最后一个元素        
        list[#list] = nil
        if #list == 0 then
            --栈为空，直接置nil            
            self.quote_map[key] = nil
        end
        return obj
    end
end

-- 别名相关设置
-- 别名可以指代多个控件，针对别名的动画可以同时控制多个控件（比如播放暗言术：骇）
function t:set_alias(key, obj)
    local alias = self.alias_map[key]
    if alias then
    else
        alias = {}
        self.alias_map[key] = alias
    end

    -- 先找下obj
    if G.call('array_get_element_index', alias, obj) then
        -- 已经包含了
        return
    end

    table.insert(alias, obj)
end
function t:remove_alias(key, obj)
    local alias = self.alias_map[key]
    if alias then
    else
        alias = {}
        self.alias_map[key] = alias
    end

    -- 先找下obj
    local index = G.call('array_get_element_index', alias, obj)
    if index then
        -- 找到了
        table.remove(alias, index)
    end
end
function t:get_alias(key)
    return self.alias_map[key]
end
function t:del_alias(key)
    self.alias_map[key] = nil
end

-- 设置动画组
function t:add_animquest(o_animquest_动画段)
    if o_animquest_动画段 ~= nil then
        if self.cur_animquest_list then
        else
            self.cur_animquest_list = {}
            self.cur_animquest_list_stack = {}
            self.cur_animquest_stack = {}

            table.insert(self.__o_animquest, self.cur_animquest_list)
        end

        table.insert(self.cur_animquest_list, o_animquest_动画段)
        self.cur_animquest = o_animquest_动画段
    end
end
function t:go_deep()
    if self.cur_animquest then
        local child
        if self.cur_animquest['child_quests'] then
            child = self.cur_animquest['child_quests']
        else
            child = {}
            self.cur_animquest['child_quests'] = child
        end

        -- 堆栈保存
        G.call('stack_push', self.cur_animquest_list_stack, self.cur_animquest_list)
        G.call('stack_push', self.cur_animquest_stack, self.cur_animquest)

        -- 指向新的层级
        self.cur_animquest_list = child
        self.cur_animquest = child[#child]
    end
end
function t:go_shallow()
    self.cur_animquest_list = G.call('stack_pop', self.cur_animquest_list_stack)
    self.cur_animques = G.call('stack_pop', self.cur_animquest_stack)
end


function t:clear_animquest()
    self.__o_animquest = {}

    self.cur_animquest_list = nil
    self.cur_animques = nil

    G.RemoveAction(self.cur_pthread)
    self.cur_pthread = nil
end
-- 播放速度设置
-- function t:set_speed(v)
--     self.speed = v
-- end
-- function t:get_speed(v)
--     return self.speed
-- end

-- 动画执行逻辑
function t:run_animactor()
    local stage, index = self:get_lock_stage_and_index()
    if stage == 0 then
        -- self:delete()
        return
        -- 动画队列为空，删除自身
        -- removeUI
        -- removeChild
    elseif stage == 1 and index == 0 then
        -- self:delete()
        return
    end

    -- 所有前置阶段动画，直接执行
    for i = 1, stage - 1, 1 do
        local anim_list = self.__o_animquest[i]
        for j = 1, #anim_list, 1 do
            G.RunAction('run_animquest', self, anim_list[j], true)
        end
    end
    -- 所有前置编号动画，直接执行
    local anim_list = self.__o_animquest[stage]
    for i = 1, index - 1, 1 do
        G.RunAction('run_animquest', self, anim_list[i], true)
    end

    -- 需要锁定的动画，等其执行完成
    self.cur_pthread = G.RunAction('run_animquest', self, self.__o_animquest[stage][index], false)

    -- 清除已经执行的动画
    -- 增加最后动画的子动画到队列中
    self:refresh_stage_and_index(stage, index)
end
function t:pause_animactor()

end

-- 控件删除
function t:delete()
    local obj = self.obj
    obj.parent:removeChild(obj)
    obj.c_animactor = nil
end

-- 判断动画是否继续
function t:update()
    self.count = (self.count or 0) + 1

    if self.cur_pthread then
        if self.cur_pthread.co ~= nil then
        else
            self.cur_pthread = nil
            self:run_animactor()
        end
    else
        self:run_animactor()
    end
end

-- 锁定动画节点、编号获取
function t:get_lock_stage_and_index()
    local stage, index = 1, 1
    local function iter(quest)
        if quest['is_mono'] then
            return true
        elseif quest['child_quests'] then
            local result = false
            for k,v in ipairs(quest['child_quests']) do
                result = result or iter(v)
            end
            return result
        end
        return false
    end

    for i,t in ipairs(self.__o_animquest) do
        for j,v in ipairs(t) do
            if iter(v) then
                return i, j
            end
        end
    end

    return #self.__o_animquest, #(self.__o_animquest[#self.__o_animquest] or {})
end

-- 清除已经执行的动画
function t:refresh_stage_and_index(stage, index)
    -- 记录下最后动画的子动画段
    local child = self.__o_animquest[stage][index]['child_quests']
    
    for i = index, 1, -1 do
        table.remove(self.__o_animquest[stage], i)
    end
    
    if #self.__o_animquest[stage] == 0 then
        table.remove(self.__o_animquest, stage)
    end
    
    for i = stage - 1, 1, -1 do
        table.remove(self.__o_animquest, i)
    end
    
    -- 修正动画队列
    if child then
        local newChild = {}
        G.deepCopyInst(child, newChild)
        table.insert(self.__o_animquest, 1, newChild)
    end
    
    -- 指向新的层级
    self.cur_animquest_list = self.__o_animquest[#self.__o_animquest]
    if self.cur_animquest_list then
        self.cur_animquest = self.cur_animquest_list[#self.cur_animquest_list]
    else
        self.cur_animquest = nil
    end
end

return t