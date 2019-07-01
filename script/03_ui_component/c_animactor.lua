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
end

function t:start()
    self:set_quote('::Card', G.getUI('v_card_weapon'))

    self.__o_animquest = {
        [1] = {
            [1] = G.call('动画系统_创建quest', self, G.QueryName(0x10010001)),
            [2] = G.call('动画系统_创建quest', self, G.QueryName(0x10010002)),
            [3] = G.call('动画系统_创建quest', self, G.QueryName(0x10010003)),
        },
    }
    
    self:run_animactor()
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

-- 设置动画组
function t:set_questlist()

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
        -- 动画队列为空，删除自身
        -- removeUI
        -- removeChild
    end

    print('1123', stage, index)
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
    local stage, index = 1, 1
    local iter = function(quest)
        if quest['is_mono'] then
            return true
        elseif quest['next_quest'] then
            local result = false
            for k,v in ipairs(quest['next_quest']) do
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
    for i = index, 1, -1 do
        table.remove(self.__o_animquest[stage], i)
    end

    for i = stage - 1, 1, -1 do
        table.remove(self.__o_animquest, i)
    end
end

return t