--[[305b

]]

local G = require "gf"
local t = G.com()

function t:init()
    -- 数据初始化
    self.quote_map = {}
    self.alias_map = {}
    self.animquests = {}

    self.speed = 100
    self.is_running = false
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

function t:set_speed()

end

-- 动画执行逻辑
function t:run_animactor()
    self.is_running = true

end
function t:pause_animactor()
    self.is_running = false

end


function t:update()
    if self.is_running then





    end




end



-- 锁动画编号获取
function t:need_lock_index(__o_animquest_动画队列)







    return i,j,k
end

