--[[7009

]]
local G = require "gf"
local L = {}
local t = G.api

local excel列映射 = {
                    'A', 'B', 'C', 'D', 'E', 'F', 'G', 
                    'H', 'I', 'J', 'K', 'L', 'M', 'N',
                    'O', 'P', 'Q',      'R', 'S', 'T',
                    'U', 'V', 'W',      'X', 'Y', 'Z',}

local function int2let(int_i, string_result)
    string_result = string_result or ""
    if int_i == 0 then
        return string_result
    else
        int_i = int_i - 1
        return int2let(int_i // 26, excel列映射[int_i % 26 + 1] .. string_result)
    end
end

local excel列反映射 = {
    ['A'] = 1 , ['B'] = 2 , ['C'] = 3 , ['D'] = 4 , ['E'] = 5 , ['F'] = 6 , ['G'] = 7 ,
    ['H'] = 8 , ['I'] = 9 , ['J'] = 10, ['K'] = 11, ['L'] = 12, ['M'] = 13, ['N'] = 14,
    ['O'] = 15, ['P'] = 16, ['Q'] = 17,             ['R'] = 18, ['S'] = 19, ['T'] = 20,
    ['U'] = 21, ['V'] = 22, ['W'] = 23,             ['X'] = 24, ['Y'] = 25, ['Z'] = 26,
}

local function let2int(string_i)
    local int_result = 0
    string.gsub(string_i, '(%u?)', function (w)
        int_result = int_result * 26 + excel列反映射[w]
    end)
    return int_result
end

local function xy2yx(string_i)
    local string_result = ''
    string.gsub(string_i, '(%d+)', function (w)
        string_result = string_result .. int2let(tonumber(w))
    end, 1)
    string.gsub(string_i, '(%u+)', function (w)
        string_result = string_result .. tostring(let2int(w))
    end, 1)
    return string_result
end

local function split(str, reps)
    local resultStrList = {}
    string.gsub(str, '([^' .. reps .. ']*)',function (w)
        table.insert(resultStrList, w)
    end)
    resultStrList.n = #resultStrList
    return resultStrList
end

local function npairs(t)
    local i = 1
    local n = t.n or #t or 0
    return function (tab, index)
        index = index + 1
        if index <= n then
            return index, tab[index]
        end
    end, t, 0
end

local function attr_split(str)
    local attr_table = {}
    local has_y = false
    local iter = function(w)
        if w == 'X' then
            return '{X}'
        elseif w == 'Y' then
            if has_y then
                error('attr de y taiduole !')
            else
                has_y = true
            end
            return '{Y}'
        else
            return tonumber(w)
        end
    end
    for _,dot in npairs(split(str, '.')) do
        string.gsub(dot, '([^%[]+)%[?', function (w)
            table.insert(attr_table, w)
        end, 1)
        string.gsub(dot, '%[([%d^X^Y]+X?Y?)%]', function (w)
            table.insert(attr_table, iter(w))
        end)
    end
    return attr_table, has_y
end

local function is_table_empty(t)
    for k,v in pairs(t) do
        if k ~= 'n' then
            return false
        end
    end
    return true
end

local function del_emptytable(t)
    for k,v in pairs(t) do
        if k == '$array_count$' or k == '$has_write$' then
            t[k] = nil
        elseif k ~= 'class' and type(v) == 'table' then
            del_emptytable(v)
            if is_table_empty(v) then
                t[k] = nil
            end
        end
    end
end

local function map(t, f)
    local nt = {}
    nt.n = t.n
    for k,v in npairs(t) do
        nt[k] = f(v)
    end
    return nt
end

local function map_k(t, f, g)
    local nt = {}
    for k,v in npairs(t) do
        nt[g(k)] = f(v)
    end
    return nt
end

local function map_ul(t, f)
    local nt = {}
    local i = 1
    while true do
        local v = t['__' .. i]
        if v then
            nt[i] = f(v)
        else
            return nt
        end
    end
    return nt
end

local function v2formula(v)
    local result = {}
    if type(v) == 'nil' then
        table.insert(result, "''")
    elseif type(v) == 'boolean' then
        if v == true then
            table.insert(result, 'true')
        elseif v == false then
            table.insert(result, 'false')
        end
    elseif type(v) == 'number' then
        table.insert(result, tostring(v))
    elseif type(v) == 'string' then
        table.insert(result, "'" .. v .. "'")
    elseif type(v) == 'table' then
        local tempt = {}
        for pos, val in pairs(v) do
            table.insert(tempt, {pos, val})
        end
        local comp = function(a,b)
            if b[1] == 'n' then
                return false
            elseif a[1] == 'n' then
                return true
            else
                local str_a, str_b
                string.gsub(tostring(a[1]), '^_*(%S+)$', function (w)
                    str_a = w
                end, 1)
                string.gsub(tostring(b[1]), '^_*(%S+)$', function (w)
                    str_b = w
                end, 1)
                return str_a < str_b
            end
        end
        table.sort(tempt,comp)

        -- 开始组装字符串
        table.insert(result, '{')
        for k,v in npairs(tempt) do
            local pos = ''
            if v[1] ~= nil then
                pos = v[1]
            end

            local val = ''
            if v[2] ~= nil then
                val = v[2]
            end

            local str_key = ''

            if pos == 'n' then
                str_key = str_key .. 'n='
            elseif type(pos) == 'string' then
                str_key = str_key .. "['" .. tostring(pos) .. "']="
            else
                str_key = str_key .. '[' .. tostring(pos) .. ']='
            end

            table.insert(result, str_key)
            table.insert(result, v2formula(val))
            table.insert(result, ',')
        end
        table.insert(result, '}')
    end
    table.insert(result, '')
    return table.concat(result)
end

local function string2number(str)
    if str then
        return tonumber(str)
    end
end

local function string2int(str)
    local result = string2number(str)
    if result then
        return math.modf(result)
    end
end

local function string2bool(str)
    if tonumber(str) == 0 then
        return false
    elseif tonumber(str) == 1 then
        return true
    elseif string.upper(str) == 'TRUE' then
        return true
    elseif string.upper(str) == 'FALSE' then
        return false
    end
end

local function number2string(num)
    if num then
        return tostring(tonumber(num))
    end
    return ''
end

local function int2string(int)
    if int and tonumber(int) then
        return tostring(math.modf(tonumber(int)))
    end
    return ''
end

local function int162string(int16)
    if int16 then
        return '0x' .. string.upper(string.format("%x", int16))
    end
    return ''
end

local function bool2string(bool)
    if bool == true then
        return 'TRUE'
    elseif bool == false then
        return 'FALSE'
    else
        return ''
    end
end

local function xmlstr2str(str)
    if str ~= nil then
        str = string.gsub(str, '&lt;', '<')
        str = string.gsub(str, '&amp;', '&')
        str = string.gsub(str, '&gt;', '>')
        str = string.gsub(str, '&quot;', '"')
        str = string.gsub(str, '&apos;', "'")
        return str
    end
end

local function readfunc_arrayify(func, splits)
    local iter = function (f, s)
        return function (v)
            return map(split(v, s), f)
        end
    end

    for _,s in ipairs(splits) do
        func = iter(func, s)
    end
    return func
end

local function writefunc_arrayify(func, splits)
    local iter = function (f, s)
        return function (v)
            return table.concat(map(v, f), s)
        end
    end

    for _,s in ipairs(splits) do
        func = iter(func, s)
    end
    return func
end

local function o_save(typedict_GetTable)
    local d = require "_data"
    local code = d._t_obj.save(d._t_obj.doc_file[typedict_GetTable], 2)
    local path = G.GetScriptPath(typedict_GetTable)
    G.WriteFile(path, code)
end

local function o_clear(typedict_GetTable)
    local t = G.DBTable(typedict_GetTable)
    if t and type(t) == 'table' then
        for i = #t, 1, -1 do
            t[i] = nil
        end
    end
end

local function csv_save(path,str,mode)
    path = 'excel/export/' .. path .. '.csv'
    local csv = G.GetSavePath(path)
    local file = io.open(path, mode)
    file:write(str)
    file:close()
end

local function deepcopy(orig, copy)
    local d = require "_data"
    d.deepcopy(orig, copy, {})
end

local function deepcopy_default(orig, copy)
    for key in pairs(orig['$has_write$'] or {}) do
        local v = orig[key]
        if v ~= nil then
            if type(v) == 'table' then
                copy[key] = {}
                deepcopy(v, copy[key])
            else
                copy[key] = v
            end
        else
            copy[key] = nil
        end
    end
end

local function dir(path)
    local lfs = require("lfs")
    return lfs.dir(path)
end

-- const
local int_max容差 = 30
local excel_写入函数_可支持类型 = {
    ['int'] = string2int,
    ['int16'] = string2int,
    ['number'] = string2number,
    ['str'] = xmlstr2str,
    ['id'] = string2int,
    ['bool'] = string2bool,
    ['code'] = function (v) return load('return (function () ' .. xmlstr2str(v) .. 'end)()')() end,
    ['code_formula'] = function (v) return load('return ' .. xmlstr2str(v))() end,

    ['_int'] = readfunc_arrayify(string2int, {"|", }),
    ['_int16'] = readfunc_arrayify(string2int, {"|", }),
    ['_number'] = readfunc_arrayify(string2number, {"|", }),
    ['_str'] = readfunc_arrayify(xmlstr2str, {"|", }),
    ['_id'] = readfunc_arrayify(string2int, {"|", }),
    ['_bool'] = readfunc_arrayify(string2bool, {"|", }),

    ['__int'] = readfunc_arrayify(string2int, {"|", "@", }),
    ['__number'] = readfunc_arrayify(string2number, {"|", "@", }),
    ['__id'] = readfunc_arrayify(string2int, {"|", "@", }),
}
local excel_写入函数_是否带杠 = {
    ['id'] = true,
    ['_id'] = true,
    ['__id'] = true,
}

local excel_写出函数_可支持类型 = {
    ['int'] = int2string,
    ['int16'] = int162string,
    ['number'] = number2string,
    ['str'] = function (v) return '"' .. tostring(v) .. '"' end,
    ['id'] = int162string,
    ['bool'] = bool2string,
    ['code_formula'] = function (v) return '"' .. v2formula(v) .. '"' end,

    ['_int'] = writefunc_arrayify(int2string, {"|", }),
    ['_int16'] = writefunc_arrayify(int162string, {"|", }),
    ['_number'] = writefunc_arrayify(number2string, {"|", }),
    ['_str'] = writefunc_arrayify(function (v) return tostring(v) end, {"|", }),
    ['_id'] = writefunc_arrayify(int162string, {"|", }),
    ['_bool'] = writefunc_arrayify(bool2string, {"|", }),

    ['__int'] = writefunc_arrayify(int2string, {"|", "@", }),
    ['__number'] = writefunc_arrayify(number2string, {"|", "@", }),
    ['__id'] = writefunc_arrayify(int162string, {"|", "@", }),
}


local 数据查询表 = {}
local 属性数组 = {}
local 竖属性数组 = {}
local 列号数组 = {}
local 列数数组 = {}
local 类型数组 = {}
local 类型字符串 = {}
local t_原始数据 = {}
local o_any_all = {}
local __string_result = {}

local function type_init()
    local get_typeid = function(s)
        local list = G.DBTable(s)
        if list and #list > 0 then
            local cur_id = list[1].name
            if cur_id then
                if type(cur_id) == 'number' then
                    return list[1].name & 0xffff0000
                elseif type(cur_id) == 'string' then
                    return cur_id
                end
            end
        end
    end

    local iter_oread = function(id_base)
        return function (count)
            return string2int(count) + id_base
        end
    end
    local iter_eread = function(s)
        local list = G.DBTable(s)
        return function (showname)
            local t = G.call('数组_Find', list, 'showname', showname)
            if t and #t > 0 then
                if #t > 1 then
                    error('数据名称重复！o表：' .. s .. ',name :' .. showname)
                end

                return t[1].name
            end
        end
    end
    local iter_owrite = function(id_base)
        return function (id)
            return int2string(id - id_base)
        end
    end
    local iter_ewrite = function(s)
        local list = G.DBTable(s)
        return function (id)
            local t = G.call('数组_Find', list, 'name', id)
            if t and #t > 0 then
                return tostring(t[1].showname)
            end
        end
    end

    local func_init_o = function(name_type)
        local id = get_typeid('o_' .. name_type)

        if type(id) == 'number' then
            if excel_写入函数_可支持类型['o_' .. name_type] then
                -- 已经注册了，不用再搞了
            else
                -- id的数字版
                excel_写入函数_可支持类型['o_' .. name_type] = iter_oread(id)
                excel_写出函数_可支持类型['o_' .. name_type] = iter_owrite(id)
                excel_写入函数_是否带杠['o_' .. name_type] = true

                -- id的名字版
                excel_写入函数_可支持类型['e_' .. name_type] = iter_eread('o_' .. name_type)
                excel_写出函数_可支持类型['e_' .. name_type] = iter_ewrite('o_' .. name_type)
                excel_写入函数_是否带杠['e_' .. name_type] = true

                -- id的数字版，i类型
                excel_写入函数_可支持类型['i_' .. name_type] = iter_oread(id)
                excel_写出函数_可支持类型['i_' .. name_type] = iter_owrite(id)

                -- id的名字版，i类型
                excel_写入函数_可支持类型['ei_' .. name_type] = iter_eread('o_' .. name_type)
                excel_写出函数_可支持类型['ei_' .. name_type] = iter_ewrite('o_' .. name_type)

                -- id的名字版
                excel_写入函数_可支持类型['_e_' .. name_type] = readfunc_arrayify(excel_写入函数_可支持类型['e_' .. name_type], {"|", })
                excel_写出函数_可支持类型['_e_' .. name_type] = writefunc_arrayify(excel_写出函数_可支持类型['e_' .. name_type], {"|", })
                excel_写入函数_是否带杠['_e_' .. name_type] = true

                -- id的数字版，数组
                excel_写入函数_可支持类型['_o_' .. name_type] = readfunc_arrayify(excel_写入函数_可支持类型['o_' .. name_type], {"|", })
                excel_写出函数_可支持类型['_o_' .. name_type] = writefunc_arrayify(excel_写出函数_可支持类型['o_' .. name_type], {"|", })
                excel_写入函数_是否带杠['_o_' .. name_type] = true

                -- id的名字版，i类型数组
                excel_写入函数_可支持类型['_ei_' .. name_type] = readfunc_arrayify(excel_写入函数_可支持类型['ei_' .. name_type], {"|", })
                excel_写出函数_可支持类型['_ei_' .. name_type] = writefunc_arrayify(excel_写出函数_可支持类型['ei_' .. name_type], {"|", })
            end
        elseif type(id) == 'string' then
        end
    end

    local path = string.sub(G.GetScriptPath("o_event"), 1, -13)
    for file in dir(path) do
        string.gsub(file, '^o_(.+).lua$', function (w)
            func_init_o(w)
        end)
    end

    local typelist = G.DBTable('o_typedef')
    for _,typedef in ipairs(typelist) do
        string.gsub(typedef['name'], '^o_(.+)$', function (w)
            func_init_o(w)
        end)
    end
end

local function enum_init()
    -- 字符串枚举处理
    local estr_list = require 'type/estrdream'
    for key,estr in pairs(estr_list) do
        if excel_写入函数_可支持类型[key] then
            -- 已经注册了，不用再搞了
        else
            local cur_key = key
            local cur_estr = estr
            local iter = function (v)
                for _,e in npairs(cur_estr) do
                    if e == v then
                        return v
                    end
                end
                if v then
                    error('not fount: estr:[' .. cur_key .. '], val:[' .. tostring(v) .. ']')
                end
            end

            excel_写入函数_可支持类型[cur_key] = iter
            excel_写出函数_可支持类型[cur_key] = function (v)
                return iter(v) or ''
            end
            excel_写入函数_可支持类型['_' .. cur_key] = readfunc_arrayify(iter, {"|", })
            excel_写出函数_可支持类型['_' .. cur_key] = writefunc_arrayify(excel_写出函数_可支持类型[cur_key], {"|", })
        end
    end

    -- 数值枚举处理
    local enum_list = require 'type/enumdream'
    for key,enum in pairs(enum_list) do
        if excel_写入函数_可支持类型[key] then
            -- 已经注册了，不用再搞了
        else
            local cur_key = key
            local cur_enum = enum
            local iter = function (v)
                for i,e in npairs(cur_enum) do
                    if e == v then
                        return i - 1
                    end
                end
                if v then
                    error('not fount: enum:[' .. cur_key .. '], val:[' .. v .. ']')
                end
            end

            excel_写入函数_可支持类型[cur_key] = iter
            excel_写出函数_可支持类型[cur_key] = function (v)
                return cur_enum[v + 1] or ''
            end
            excel_写入函数_可支持类型['_' .. cur_key] = readfunc_arrayify(iter, {"|", })
            excel_写出函数_可支持类型['_' .. cur_key] = writefunc_arrayify(excel_写出函数_可支持类型[cur_key], {"|", })
        end
    end
end

local function excel_init(string_o表名称)
    数据查询表 = {}
    属性数组 = {}
    竖属性数组 = {}
    列号数组 = {}
    列数数组 = {}
    类型数组 = {}
    类型字符串 = {}
    t_原始数据 = {}
    o_any_all = G.DBTable(string_o表名称)
    __string_result = {}

    -- o表类型填充
    type_init()

    -- 枚举类型填充
    enum_init()
end

local function type_rightful(str_type)
    if str_type then
        if excel_写入函数_可支持类型[str_type] then
            return true
        end
    end
    return false
end

local function attr_analyze(str_name, str_attr)
    if str_attr then
        return attr_split(str_attr)
    elseif str_name then
        return attr_split(str_name)
    end
end

--hide=true
--ret=o_sheetData
local function excel_读取数据_sheet数据读取(string_文件名称, string_sheet名称)
    local xlsx = require "load_xlsx"
    local path = G.GetScriptPath("o_event")
    local path_task = string.sub(path, 1, -27) .. 'excel/'
    local excel_data = xlsx.load(path_task .. G.UtfToGbk(string_文件名称))

    for _,excel_sheet in pairs(excel_data) do
        if excel_sheet.name == string_sheet名称 then
            return excel_sheet.sheetData
        end
    end
end

--hide=true
local function excel_读取数据_属性注册(int_col, boolean_调整顺序)
    local str_col = int2let(int_col)
    local str_name = 数据查询表[str_col .. '1']
    local str_attr = 数据查询表[str_col .. '2']
    local str_type = 数据查询表[str_col .. '3']
    if (str_name or str_attr or str_type) == nil then
        -- 返回是否空列
        return false
    end

    if str_type then
        -- 非空，判断类型是否需要记录
        if type_rightful(str_type) then
            -- 确定当列数据属性值
            local attr, has_y = attr_analyze(str_name, str_attr)
            if attr and #attr > 0 then
                local count = nil
                if boolean_调整顺序 and #attr == 1 and attr[1] == 'name' then
                    -- 是name，该属性要第一个处理
                    count = 1
                else
                    count = #属性数组 + 1
                end
                    
                -- 属性合法
                table.insert(属性数组, count, attr)
                table.insert(竖属性数组, count, has_y)
                table.insert(列号数组, count, str_col)
                table.insert(类型数组, count, str_type)
                table.insert(类型字符串, count, str_attr or str_name)

                -- 写出需要的数据
                table.insert(列数数组, count, int_col)
            end
        else
        end
    end

    return true
end

--hide=true
local function excel_读取数据_sheet表头解析(boolean_调整顺序)
    local int_当前容差 = 0
    local int_col = 1
    while int_当前容差 < int_max容差 do
        local result = excel_读取数据_属性注册(int_col, boolean_调整顺序)
        if result then
            int_当前容差 = 0
        else
            int_当前容差 = int_当前容差 + 1
        end
        int_col = int_col + 1
    end
end

local function excel_读取数据_生成数据表_单格attr(t, attr, index, v, boolean_带横杠, array_count)
    local key = attr[index]
    if key == '{X}' then
        if type(v) == 'table' then
            for new_key, new_v in npairs(v) do
                attr[index] = new_key
                excel_读取数据_生成数据表_单格attr(t, attr, index, new_v, boolean_带横杠, array_count)
            end
        end
        -- 删除数组后面多余的数据
        local count
        if attr[index] == '{X}' then
            count = 0
        else
            count = attr[index]
        end
        for i = count + 1, count + 10, 1 do
            attr[index] = i
            excel_读取数据_生成数据表_单格attr(t, attr, index, nil, boolean_带横杠, array_count)
        end

        attr[index] = '{X}'
    elseif key == '{Y}' then
        if array_count then
            attr[index] = array_count
            excel_读取数据_生成数据表_单格attr(t, attr, index, v, boolean_带横杠, array_count)
        end
        attr[index] = '{Y}'
    elseif index == #attr then
        if boolean_带横杠 == true then
            key = '__' .. key
        end

        t[key] = v
    else
        if t[key] == nil then
            t[key] = {}
        end
        excel_读取数据_生成数据表_单格attr(t[key], attr, index + 1, v, boolean_带横杠, array_count)
    end
end

--hide=true
local function excel_读取数据_生成数据表_单格(t, attr, str_type, old_v, str_name, has_y)
    local f = excel_写入函数_可支持类型[str_type]
    if f then
        local new_v = nil
        if old_v and old_v ~= '-' then
            new_v = f(old_v)
        end

        local has_write = t['$has_write$'] or {}
        if has_write[str_name] then
            if has_y then
                -- 是竖属性，可以写
                excel_读取数据_生成数据表_单格attr(t, attr, 1, new_v, excel_写入函数_是否带杠[str_type], t['$array_count$'])
                has_write[str_name] = has_write[str_name] + 1
            end
        else
            -- 数据还没有写过，直接写
            excel_读取数据_生成数据表_单格attr(t, attr, 1, new_v, excel_写入函数_是否带杠[str_type], t['$array_count$'])
            has_write[str_name] = 1
        end

        t['$has_write$'] = has_write
    end
end

--hide=true
local function excel_读取数据_生成数据表_单行(t, int_row, id_row)
    -- 先处理一下name属性
    if #属性数组 >= 1 then
        excel_读取数据_生成数据表_单格(t, 属性数组[1], 类型数组[1], 数据查询表[列号数组[1] .. (id_row or int_row)], 类型字符串[1])
    end

    local o_target = G.call('数组_Find', o_any_all, 'name', t.name)
    if #o_target > 0 and o_target[1].name then
        -- 是已有数据，覆盖
        deepcopy_default(t_原始数据, o_target[1], {})
        t = o_target[1]
    elseif t.name then
        -- 新数据，添加
        table.insert(o_any_all, t)
    end
    
    -- 记录Y索引
    t['$array_count$'] = (t['$array_count$'] or 0) + 1

    -- 继续追加数据修改
    for i = 2,#属性数组,1 do
        local attr = 属性数组[i]
        local has_y = 竖属性数组[i]
        local str_col = 列号数组[i]
        local str_type = 类型数组[i]
        local str_name = 类型字符串[i]

        excel_读取数据_生成数据表_单格(t, attr, str_type, 数据查询表[str_col .. int_row], str_name, has_y)
    end

    return t
end

--hide=true
local function excel_读取数据_生成数据表()
    local result_t = {}

    local int_当前容差 = 1
    local int_row = 4
    while int_当前容差 <= int_max容差 do
        local id = 数据查询表['A' .. int_row]
        if id ~= nil and id ~= '-' then
            int_当前容差 = 1

            local nt = {}
            deepcopy_default(t_原始数据, nt, {})
            nt = excel_读取数据_生成数据表_单行(nt, int_row)
            table.insert(result_t, nt)
        else
            int_当前容差 = int_当前容差 + 1

            local nt = {}
            deepcopy_default(t_原始数据, nt, {})
            nt = excel_读取数据_生成数据表_单行(nt, int_row, int_row - int_当前容差 + 1)
            table.insert(result_t, nt)
        end
        int_row = int_row + 1
    end

    return result_t
end

--hide=true
local function excel_读取建立映射(o_sheetData_表格数据, boolean_是否转置)
    if boolean_是否转置 then
        for _,data in npairs(o_sheetData_表格数据) do
            数据查询表[xy2yx(data.r)] = data.v
        end
    else
        for _,data in npairs(o_sheetData_表格数据) do
            数据查询表[data.r] = data.v
        end
    end

end

--hide=true
--ret=o_excel
t['excel_读取数据'] = function(o_excel_当前数据)
    local string_文件名称 = o_excel_当前数据.文件名称
    local string_sheet名称 = o_excel_当前数据.sheet名称
    local string_默认值文件名称 = o_excel_当前数据.默认值文件名称
    local string_默认值sheet名称 = o_excel_当前数据.默认值sheet名称
    local string_o表名称 = o_excel_当前数据.o表名称

    if string_o表名称 == nil then
        return 
    end

    -- 数据初始化
    excel_init(string_o表名称)

    -- 读取默认值表
    if string_默认值文件名称 == nil or string_默认值sheet名称 == nil then
    else
        local o_sheetData_表格数据 = excel_读取数据_sheet数据读取(string_默认值文件名称, string_默认值sheet名称)
        excel_读取建立映射(o_sheetData_表格数据, o_excel_当前数据.是否转置)
        excel_读取数据_sheet表头解析(true)

        -- 开始设置默认值
        excel_读取数据_生成数据表_单行(t_原始数据, 4)
    end

    -- 丢弃无用数据
    do
        数据查询表 = {}
        属性数组 = {}
        竖属性数组 = {}
        列号数组 = {}
        列数数组 = {}
        类型数组 = {}
        类型字符串 = {}
    end

    -- 读取数值表
    if string_文件名称 == nil or string_sheet名称 == nil then
    else
        if o_excel_当前数据.是否全托 then
            o_clear(string_o表名称)
        end

        local o_sheetData_表格数据 = excel_读取数据_sheet数据读取(string_文件名称, string_sheet名称)
        excel_读取建立映射(o_sheetData_表格数据, o_excel_当前数据.是否转置)
        excel_读取数据_sheet表头解析(true)

        -- 开始读取表格
        local 待写入o表列表 = excel_读取数据_生成数据表()

        -- 数据后续加工
        if o_excel_当前数据.导入后额外处理 then
            待写入o表列表 = G.call(o_excel_当前数据.导入后额外处理, 待写入o表列表)
        end

        map(待写入o表列表, del_emptytable)

        o_save(string_o表名称)
    end
end

--hide=true
--ret=o_excel
t['excel_读取多个数据'] = function(o_excel_当前数据, _i_excel_数据列表)
    if _i_excel_数据列表 then
        for _,v in npairs(_i_excel_数据列表) do
            G.call('excel_读取数据', G.QueryName(v))
        end
    end
end

local function excel_写出数据_生成字符串_table填充()
    local max = 1
    for index,t in npairs(__string_result) do
        if t then
            -- 获取excel最大长度
            max = math.max(max, #t, t.n)
        end
    end
    for index,t in npairs(__string_result) do
        if t then
            t.n = max
        else
            t = {}
            t.n = max
        end

        for key,v in npairs(t) do
            if v then
            else
                t[key] = '-'
            end
        end
    end
end

local function excel_写出数据_生成字符串_table(int_col, int_row, v)
    if __string_result[int_row] then
    else
        __string_result[int_row] = {}
        __string_result.n = math.max(int_row, __string_result.n or 0)
    end

    local t = __string_result[int_row]
    t[int_col] = v
    t.n = math.max(int_col, t.n or 0)
end

local function excel_写出数据_生成字符串_单格attr(t, attr, index, boolean_带横杠, f, int_col, int_row)
    local key = attr[index]
    if key == '{X}' then
        local result = {}
        for count = 1, G.call('编辑器数组_获取长度', t), 1 do
            attr[index] = count
            local array_v = excel_写出数据_生成字符串_单格attr(t, attr, index, boolean_带横杠, nil, int_col, int_row)
            table.insert(result, array_v)
        end
        if #result > 0 then
            excel_写出数据_生成字符串_table(int_col, int_row, f(result))
        end
        attr[index] = '{X}'
    elseif key == '{Y}' then
        for count = 1, G.call('编辑器数组_获取长度', t), 1 do
            attr[index] = count
            excel_写出数据_生成字符串_单格attr(t, attr, index, boolean_带横杠, f, int_col, int_row + count - 1)
        end
        attr[index] = '{Y}'
    elseif index == #attr then
        if boolean_带横杠 == true then
            key = '__' .. key
        end
        if t[key] ~= nil then
            if f then
                excel_写出数据_生成字符串_table(int_col, int_row, f(t[key]))
            else
                return t[key]
            end
        end
    else
        if t[key] == nil then
            return
        end
        return excel_写出数据_生成字符串_单格attr(t[key], attr, index + 1, boolean_带横杠, f, int_col, int_row)
    end
end

--hide=true
local function excel_写出数据_生成字符串_单格(t, attr, str_type, int_col, int_row)
    local f = excel_写出函数_可支持类型[str_type]
    if f then
        local boolean_带横杠 = excel_写入函数_是否带杠[str_type]

        local result = excel_写出数据_生成字符串_单格attr(t, attr, 1, boolean_带横杠, f, int_col, int_row)
    end
end

--hide=true
local function excel_写出数据_生成字符串_单行(t, int_row)
    for i = 1, #属性数组, 1 do
        local attr = 属性数组[i]
        local int_col = 列数数组[i]
        local str_type = 类型数组[i]

        excel_写出数据_生成字符串_单格(t, attr, str_type, int_col, int_row)
    end
end

--hide=true
local function excel_写出数据_生成字符串(_o_any_values)
    for k,v in npairs(_o_any_values) do
        excel_写出数据_生成字符串_单行(v, #__string_result + 1)
    end

    excel_写出数据_生成字符串_table填充()
    return writefunc_arrayify(function (v) return v end, {",", "\n"})(__string_result)
end

--hide=true
local function excel_写出表头_生成字符串(int_row)
    local _string_result = {}

    local int_当前容差 = 0
    local int_col = 1
    while int_当前容差 < int_max容差 do
        local v = 数据查询表[int2let(int_col) .. int_row]
        if v then
            int_当前容差 = 0
        else
            v = ''
            int_当前容差 = int_当前容差 + 1
        end

        table.insert(_string_result, v)
        int_col = int_col + 1
    end

    return table.concat(_string_result, ',')
end


--hide=true
--ret=o_excel
t['excel_写出数据'] = function(o_excel_当前数据)
    local string_文件名称 = o_excel_当前数据.文件名称
    local string_sheet名称 = o_excel_当前数据.sheet名称
    local string_o表名称 = o_excel_当前数据.o表名称

    -- 数据初始化
    excel_init(string_o表名称)

    if string_o表名称 == nil then
        return 
    end

    -- 读取默认值表
    if string_文件名称 == nil or string_sheet名称 == nil then
    else
        local o_sheetData_表格数据 = excel_读取数据_sheet数据读取(string_文件名称, string_sheet名称)
        excel_读取建立映射(o_sheetData_表格数据, o_excel_当前数据.是否转置)
        excel_读取数据_sheet表头解析(false)

        if o_excel_当前数据.导出前额外处理 then
            o_any_all = G.call(o_excel_当前数据.导出前额外处理, o_any_all)
        end

        local counts = {}
        for _,v in npairs(o_any_all) do
            for k,t in pairs(v) do
                if type(t) == 'table' then
                    counts[k] = math.max(counts[k] or 0, #t)
                end
            end
        end
        G.show_table(counts)

        local _string_待写入数据 = excel_写出数据_生成字符串(o_any_all)
        
        csv_save(string_o表名称, _string_待写入数据, 'w+')
    end
end

t['excel_test'] = function()
    G.addUI('v_zpczzz')

end
