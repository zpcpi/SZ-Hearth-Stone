--[[4011

]]
local G = require "gf"
local L = {}
local t = G.api

t['com_set_value'] = function (com, attr, value)
    com[attr] = value
end


t['asdasd'] = function ()
    local rlib = G.call('Create_Randomlib', G.QueryName(0x100c0003))

    rlib:添加数据({1, 10})
    rlib:添加数据({2, 5})
    rlib:添加数据({3, 0})
    rlib:添加数据({4, 10})
    rlib:添加数据({5, 5})
    rlib:添加数据({6, 0})
    rlib:添加数据({7, 5})
    rlib:添加数据({8, 10})
    rlib:添加数据({9, 0})

    rlib.boolean_是否循环 = true

    rlib:初始化(false, true)

    local r = rlib(90000)
    local tt = {}
    for k,v in ipairs(r) do
        tt[v] = (tt[v] or 0) + 1
    end



    --G.show_table(r)
    G.show_table(tt)
end

t['zpc_test'] = function ()
    G.show_table(PLAYER_MAPPING_L2A)
    G.show_table(PLAYER_MAPPING_A2L)



end

t['zpc_test2'] = function (a)
    G.trig_event('asd', a)
end

--ret=o_excel
t['card数据处理'] = function(o_excel_xxxx)
    local function o_save(typedict_GetTable)
        local d = require "_data"
        local code = d._t_obj.save(d._t_obj.doc_file[typedict_GetTable], 2)
        local path = G.GetScriptPath(typedict_GetTable)
        G.WriteFile(path, code)
    end
    local cardlist = G.DBTable('o_card')

    for k,v in ipairs(cardlist) do
        if v['逻辑数据'] then
            local t = v['逻辑数据']

            if t['职业'] then
                t['职业xx'] = {
                    t['职业']
                }
                t['职业'] = nil
            end
        end
    end

    o_save('o_card')
    return o_excel_xxxx
end