--[[400e

]]
local G = require "gf"
local L = {}
local t = G.api

-- 组合数值计算
local Combination_Number_list = {}
--hide=true
--type=math
t['Combination_Number'] = function (count, max)
    if (max >= 0) and (count <= max) and (count >= 0) then
        local line_m = Combination_Number_list[max]

        if line_m then
        else
            line_m = {}
            line_m[0] = 1
            line_m[max] = 1
            Combination_Number_list[max] = line_m
        end

        if line_m[count] then
            return line_m[count]
        else
            local result = G.call('Combination_Number', count - 1, max - 1) + G.call('Combination_Number', count, max - 1)
            line_m[count] = result
            return result
        end
    else
        return 0
    end
end

-- 贝赛尔曲线相关
--hide=true
--type=math
t['Bezier_curve'] = function (posxs, posys, dots)
    local pointxs, pointys = {}, {}

    if posxs and posys and dots and (#posxs > 1) and (#posxs == #posys) then
        local point_count = #posxs
        local arga = G.call('array_map', 
                            G.call('create_arithmetic_progression', 0, 1, point_count),
                            function(n)
                                return G.call('Combination_Number', n, point_count - 1)
                            end)
        local argt = G.call('array_map',
                            dots,
                            function(n)
                                return G.call('create_geometric_progression', 1, n, point_count)
                            end)
        local argtplus = G.call('array_map',
                            dots,
                            function(n)
                                return G.call('create_geometric_progression', 1, 1 - n, point_count)
                            end)

        for i = 1, #dots, 1 do
            local t_queue = argt[i]
            local plust_queue = argtplus[i]

            local x, y = 0, 0
            for k = 1, point_count, 1 do
                local temp = arga[k] * t_queue[k] * plust_queue[point_count - k + 1]
                x = x + posxs[k] * temp
                y = y + posys[k] * temp
            end
            table.insert(pointxs, x)
            table.insert(pointys, y)
        end

        return pointxs, pointys
    end
end

--hide=true
--type=math
t['Bezier_curve_bycount'] = function (posxs, posys, count, dotpro)
    if posxs and posys and (#posxs > 1) and (#posxs == #posys) and (count > 1) and (dotpro <= 1) and (dotpro >= 0) then
        local k = 1 / (count - 1)
        local dots = G.call('create_arithmetic_progression', dotpro * k, k, count - dotpro)
        return G.call('Bezier_curve', posxs, posys, dots)
    end
end

-- 随机库功能

local rlib_数据有效性处理 = function (self, boolean_计算条件, boolean_重置权重, func_权重iter, func_排序iter)
    if self and self.datas then
    else
        return
    end

    -- 数据有效性处理
    self.int_当前数据量 = 0
    self.int_最大有效数据索引 = 0
    self.int_最大数据量 = #self.datas

    for index,data in ipairs(self.datas) do
        if boolean_计算条件 then
            if data['condition'] then
                data['condivalue'] = G.call(data['condition'])
            else
                data['condivalue'] = true
            end
        end

        if boolean_重置权重 then
            if func_权重iter then
                data['cur_weight'] = func_权重iter(data)
            else
                data['cur_weight'] = data['weight']
            end
        end

        -- 有效性判定
        if (data['condivalue'] ~= false) and (data['cur_weight'] > 0) then
            self.int_当前数据量 = self.int_当前数据量 + 1
            self.int_最大有效数据索引 = index
            data['isvalid'] = 1
        else
            data['isvalid'] = 0
        end
    end

    if func_排序iter then
        table.sort(self.datas, func_排序iter)
        -- 有效数据一定都在前面
        self.int_最大有效数据索引 = self.int_当前数据量
    end

    -- 最大深度计算
    local count_max = self.int_最大有效数据索引
    local deep = 1
    while count_max > 1 do
        count_max = (count_max+1) >> 1
        deep = deep + 1
    end
    self.int_最大深度 = deep
end

local rlib_索引树更新 = function (self, index_list)    
    for deep = 2, self.int_最大深度, 1 do
        -- 设置下一层要修改的索引值
        local index_list_reverse = {}
        for _,v in ipairs(index_list or {}) do
            local count = (v+1) >> 1
            index_list_reverse[count] = 1
        end

        index_list = {}
        for count,_ in pairs(index_list_reverse) do
            table.insert(index_list, count)

            if self.tree[deep] then
            else
                self.tree[deep] = {}
            end

            local data_left = self.tree[deep-1][count*2 - 1]
            local data_right = self.tree[deep-1][count*2]

            local weight = 0
            if data_left and (data_left['isvalid'] == 1) then
                weight = weight + (data_left['cur_weight'] or 0)
            end
            if data_right and (data_right['isvalid'] == 1) then
                weight = weight + (data_right['cur_weight'] or 0)
            end
            self.tree[deep][count] = {
                ['cur_weight'] = weight,
                ['isvalid'] = 1,
            }
        end
    end
end

local rlib_查找数据 = function (self, weight_cur)
    local int_baseindex = 1
    local iter = function (deep)
        local weight_left = self.tree[deep][int_baseindex]['cur_weight']
        if weight_cur <= weight_left then
            -- 在左侧
        else
            -- 在右侧，且约定一定在右侧
            weight_cur = weight_cur - weight_left
            int_baseindex = int_baseindex + 1
        end
    end

    for deep = self.int_最大深度, 2, -1 do
        iter(deep)
        -- 下潜一层
        int_baseindex = int_baseindex * 2 - 1
    end
    iter(1)
    return int_baseindex
end

local rlib_终止判断 = function (self)
    local weight_max = (self.tree[self.int_最大深度][1] or {})['cur_weight'] or 0

    if weight_max > 0 then
        -- 还有数据，直接返回权重总值
        return weight_max
    elseif self.boolean_是否循环 == true then
        if (self.boolean_是否已取空 == true) and (self.boolean_是否已初始化 == true) then
        else
            self:初始化(false, true)
            weight_max = self.tree[self.int_最大深度][1]['cur_weight']
            if weight_max > 0 then
                -- 还有数据，直接返回权重总值
                return weight_max
            else
                self.boolean_是否已取空 = true
            end
        end
    end
    return 0
end

--hide=true
--type=math
t['Randomlib_添加数据'] = function (self, data)
    if type(data) == 'table' then
        local new_data = {
            ['value'] = data[1],
            ['weight'] = data[2],
            ['condition'] = data[3],
            ['cur_weight'] = data[4],
        }
        table.insert(self.datas, new_data)
        self.int_最大数据量 = self.int_最大数据量 + 1

        self.boolean_是否已初始化 = false
    end
end
--hide=true
--type=math
t['Randomlib_添加数据_顺序选取'] = function (self, index, data)
    if data == nil then
        -- index可以缺省，改为填写data
        index, data = #self.datas+1, index
    end

    if type(data) == 'table' then
        local new_data = {
            ['value'] = data[1],
            ['weight'] = data[2],
            ['condition'] = data[3],
            ['cur_weight'] = data[4],
        }
        table.insert(self.datas, index, new_data)
        self.int_最大数据量 = self.int_最大数据量 + 1

        self.boolean_是否已初始化 = false
    end
end
--hide=true
--type=math
t['Randomlib_修改数据'] = function (self, index, key, value)
    if index <= self.int_最大数据量 then
        local data = self.datas[index]
        if data then
            data[key] = value
        end

        self.boolean_是否已初始化 = false
    end
end
--hide=true
--type=math
t['Randomlib_删除数据'] = function (self, index)
    table.remove(self.datas, index)
    self.boolean_是否已初始化 = false
end
--hide=true
--type=math
t['Randomlib_初始化'] = function (self, boolean_计算条件, boolean_重置权重)
    rlib_数据有效性处理(self, boolean_计算条件, boolean_重置权重, nil, function (a,b) return (a['isvalid'] > b['isvalid']) end)
    self.tree = {}
    self.tree[1] = self.datas
    rlib_索引树更新(self, G.call('create_arithmetic_progression', 1, 1, self.int_最大有效数据索引))
    self.boolean_是否已初始化 = true
end
--hide=true
--type=math
t['Randomlib_初始化_顺序选取'] = function (self, boolean_计算条件, boolean_重置权重)
    -- 关键就是不要排序
    rlib_数据有效性处理(self, boolean_计算条件, boolean_重置权重)
    self.tree = {}
    self.tree[1] = self.datas
    rlib_索引树更新(self, G.call('create_arithmetic_progression', 1, 1, self.int_最大有效数据索引))
    self.boolean_是否已初始化 = true
end
--hide=true
--type=math
t['Randomlib_求值_完全随机'] = function (self)
    local weight_max = rlib_终止判断(self)

    if weight_max == 0 then
        return
    end

    local weight_cur = math.random(weight_max)
    local int_baseindex = rlib_查找数据(self, weight_cur)

    if (int_baseindex < 1) or (int_baseindex > self.int_最大有效数据索引) then
        -- 数据越界
        return
    end

    -- 完全随机，啥都不改
    local data = self.datas[int_baseindex]
    return data['value']
end
--hide=true
--type=math
t['Randomlib_求值_抽取随机'] = function (self)
    local weight_max = rlib_终止判断(self)

    if weight_max == 0 then
        return
    end

    local weight_cur = math.random(weight_max)
    local int_baseindex = rlib_查找数据(self, weight_cur)

    if (int_baseindex < 1) or (int_baseindex > self.int_最大有效数据索引) then
        -- 数据越界
        return
    end

    -- 抽取随机，权重变0
    local data = self.datas[int_baseindex]
    data['cur_weight'] = 0
    rlib_索引树更新(self, {int_baseindex})
    
    return data['value']
end
--hide=true
--type=math
t['Randomlib_求值_有损随机'] = function (self)
    local weight_max = rlib_终止判断(self)

    if weight_max == 0 then
        return
    end

    local weight_cur = math.random(weight_max)
    local int_baseindex = rlib_查找数据(self, weight_cur)

    if (int_baseindex < 1) or (int_baseindex > self.int_最大有效数据索引) then
        -- 数据越界
        return
    end

    -- 有损随机，权重减1
    local data = self.datas[int_baseindex]
    data['cur_weight'] = data['cur_weight'] - 1
    rlib_索引树更新(self, {int_baseindex})
    
    return data['value']
end
--hide=true
--type=math
t['Randomlib_求值_顺序选取'] = function (self)
    local weight_max = rlib_终止判断(self)

    if weight_max == 0 then
        return
    end

    -- 每次都选第一个
    local weight_cur = 1
    local int_baseindex = rlib_查找数据(self, weight_cur)

    if (int_baseindex < 1) or (int_baseindex > self.int_最大有效数据索引) then
        -- 数据越界
        return
    end

    -- 顺序选取，权重减1
    local data = self.datas[int_baseindex]
    data['cur_weight'] = data['cur_weight'] - 1
    rlib_索引树更新(self, {int_baseindex})
    
    return data['value']
end

--hide=true
--type=math
--ret=o_randomlib
t['Create_Randomlib'] = function (o_randomlib_type_随机库类型)
    local rlib = {}

    -- 数据
    rlib.datas = {}
    rlib.tree = nil

    -- 属性初始化
    rlib.int_当前数据量 = 0
    rlib.int_最大数据量 = 0
    rlib.int_最大有效数据索引 = 0
    rlib.int_最大深度 = 0
    rlib.int_概率基底 = 1
    rlib.boolean_是否循环 = false
    rlib.boolean_是否已初始化 = false
    rlib.随机库类型 = o_randomlib_type_随机库类型

    -- 随机库方法注册
    rlib.添加数据 = t[o_randomlib_type_随机库类型['添加数据功能']]
    rlib.修改数据 = t[o_randomlib_type_随机库类型['修改数据功能']]
    rlib.删除数据 = t[o_randomlib_type_随机库类型['删除数据功能']]
    rlib.初始化 = t[o_randomlib_type_随机库类型['初始化功能']]

    local mt = {}
    mt.__call = function (self, count)
        if self.boolean_是否已初始化 then
        else
            self:初始化(false, false)
        end

        local result = {}
        local funs = o_randomlib_type_随机库类型['求值功能']
        for i = 1, (count or 0), 1 do
            result[i] = G.call(funs, self)
        end
        return result
    end
    setmetatable(rlib, mt)

    return rlib
end



