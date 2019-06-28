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

    self.speed = 100
end

function t:start()
end

-- 引用相关设置
function t:set_quote(key, obj, com)
    self.quote_map[key] = {
        ['obj'] = obj,
        ['com'] = com,
    }
end
function t:get_quote(key)
    return self.quote_map[key]
end
function t:del_quote(key)
    self.quote_map[key] = nil
end

-- 别名相关设置
function t:set_alias(key, obj, com)
    if self.alias_map[key] then
    else
        self.alias_map[key] = {}
    end
    local alias = self.alias_map[key]

    -- 先找下obj
    local list = G.call('数值_Find', alias, 'obj', obj)
    if list and #list > 0 then
        -- 再判断下com
        list = G.call('数值_Find', list, 'com', com)
        if list and #list > 0 then
            return
        end
    end

    table.insert(alias, {
        ['obj'] = obj,
        ['com'] = com,
    })
end
function t:remove_alias(key, obj, com)
    if self.alias_map[key] then
    else
        self.alias_map[key] = {}
    end
    local alias = self.alias_map[key]

    -- 先找下obj
    local list = G.call('数值_Find', alias, 'obj', obj)
    if list and #list > 0 then
        -- 再判断下com
        list = G.call('数值_Find', list, 'com', com)
        if list and #list > 0 then
            -- todo
            -- 删除对应的组合
        end
    end
end
function t:get_alias(key)
    return self.alias_map[key]
end
function t:del_alias(key)
    self.alias_map[key] = nil
end

-- 播放速度设置
function t:set_speed(v)
    self.speed = v
end
function t:get_speed(v)
    return self.speed
end

-- 动画执行逻辑
function t:run_animactor()
    local stage, index = self:get_lock_stage_and_index()
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
    self:clear_ran_stage_and_index(stage, index)

    -- 增加最后动画的子动画
end
function t:pause_animactor()

end

-- 判断动画是否继续
function t:update()
    if self.cur_pthread then
        if self.cur_pthread.co ~= nil then
        else
            self.cur_pthread = nil
            self:run_animactor()
        end
    end
end



-- 锁定动画节点、编号获取
function t:get_lock_stage_and_index()

    return stage, index
end

-- 清除已经执行的动画
function t:clear_ran_stage_and_index(stage, index)

end