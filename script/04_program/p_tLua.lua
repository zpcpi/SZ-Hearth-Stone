--[[4016

]]
local G = require "gf"
local L = {}
local t = G.api

--=================================================
--=================================================
--=================================================
--atom
--=================================================
--=================================================
--=================================================
-- +-*/
local function op_iter(f, a, b, ...)
    if b ~= nil then
        return op_iter(f, f(a,b), ...)
    else
        return a
    end
end
local function comp_op_iter(f, result, a, b, ...)
    if result and (b ~= nil) then
        return comp_op_iter(f, f(a,b), b, ...)
    end
    return result
end

t['tLua_ADD'] = function (...)
    local iter = function (a,b)
        return a+b
    end
    return op_iter(iter, ...) or 0
end

t['tLua_SUB'] = function (...)
    local iter = function (a,b)
        return a-b
    end
    return op_iter(iter, ...) or 0
end

t['tLua_MULT'] = function (...)
    local iter = function (a,b)
        return a*b
    end
    return op_iter(iter, ...) or 0
end

t['tLua_DIV'] = function (...)
    local iter = function (a,b)
        return a/b
    end
    return op_iter(iter, ...) or 0
end

t['tLua_EXACT_DIV'] = function (...)
    local iter = function (a,b)
        return a//b
    end
    return op_iter(iter, ...) or 0
end

t['tLua_MOD'] = function (...)
    local iter = function (a,b)
        return a%b
    end
    return op_iter(iter, ...) or 0
end

t['tLua_EQUAL'] = function (...)
    local iter = function (a,b)
        return a==b
    end
    return comp_op_iter(iter, true, ...)
end

t['tLua_GT'] = function (...)
    local iter = function (a,b)
        return a>b
    end
    return comp_op_iter(iter, true, ...)
end

t['tLua_LT'] = function (...)
    local iter = function (a,b)
        return a<b
    end
    return comp_op_iter(iter, true, ...)
end

t['tLua_GE'] = function (...)
    local iter = function (a,b)
        return a>=b
    end
    return comp_op_iter(iter, true, ...)
end

t['tLua_LE'] = function (...)
    local iter = function (a,b)
        return a<=b
    end
    return comp_op_iter(iter, true, ...)
end

t['tLua_AND'] = function (...)
    for i = 1, select('#', ...), 1 do
        if select(i, ...) then
        else
            return false
        end
    end
    return true
end

t['tLua_OR'] = function (...)
    local count = select('#', ...)
    for i = 1, count, 1 do
        if select(i, ...) then
            return true
        end
    end
    return (count == 0) and true or false
end

t['tLua_NOT'] = function (...)
    return not t['tLua_AND'](...)
end

t['tLua_TABLE'] = function (...)
    return {...}
end

t['tLua_APPEND'] = function (t1, t2)
    local t = {}
    for k,v in ipairs(t1 or {}) do
        table.insert(t, v)
    end
    for k,v in ipairs(t2 or {}) do
        table.insert(t, v)
    end
    return t
end

local function reverse(t, idx, ...)
    local result = {}
    for i = 1, select('#', ...), 1 do
        local v = (select(i, ...) or {})[idx]
        if v ~= nil then
            table.insert(result, v)
        else
            return t
        end
    end
    table.insert(t, result)
    return reverse(t, idx + 1, ...)
end
t['tLua_MAP'] = function (func, ...)
    local t = reverse({}, 1, ...)
    for k,v in ipairs(t) do
        t[k] = func(table.unpack(v))
    end
    return t
end

local t_filter = t['array_filter']
t['tLua_FILTER'] = function (func, t)
    return t_filter(t, func)
end

t['tLua_FOLDL'] = function (func, base, t)
    for k,v in ipairs(t) do
        base = func(base, v)
    end
    return base
end

t['tLua_FOLDR'] = function (func, base, t)
    for i = #t, 1, -1 do
        base = func(t[i], base)
    end
    return base
end

--=================================================
--=================================================
--=================================================
--wait
--=================================================
--=================================================
--=================================================

local tLua_listener_list = {}
local create_listener_name = function (event)
    local count = (tLua_listener_list[event] or 0) + 1
    tLua_listener_list[event] = count

    return '|#tLua_listener#|#' .. event .. '#|' .. count
end

t['tLua_add_listener'] = function (o_order_info_当前指令信息, earg_注册事件, func_执行函数, cond, prior, group)
    if earg_注册事件 and type(earg_注册事件[1]) == 'string' then
        local event_name = earg_注册事件[1]
        local key = create_listener_name(event_name)
        t[key] = function ()
            G.removeListener(key, event_name)
            t[key] = nil
            return func_执行函数()
        end
        G.addListener(key, earg_注册事件, cond, prior, group)
        return key
    end
end

--=================================================
--=================================================
--=================================================
local lpeg = require "lpeg"
lpeg.locale(lpeg)

local P, S, R, V, B = lpeg.P, lpeg.S, lpeg.R, lpeg.V, lpeg.B
local C, Carg, Cb, Cc = lpeg.C, lpeg.Carg, lpeg.Cb, lpeg.Cc
local Cf, Cg, Cmt, Cp, Cs, Ct = lpeg.Cf, lpeg.Cg, lpeg.Cmt, lpeg.Cp, lpeg.Cs, lpeg.Ct
local Lc, T = lpeg.Lc, lpeg.T

local alpha, digit, alnum, lower, upper = lpeg.alpha, lpeg.digit, lpeg.alnum, lpeg.lower, lpeg.upper
--[[
    "punct"
    "graph"
    "print"
    "cntrl"
]]
local unicode = lpeg.unicode
local xdigit = lpeg.xdigit
local space = lpeg.space

local match = lpeg.match

local sp = space + P'\n'
local quote = P'"' + P"'"
local split = P','
local kw = function(patt)
    return sp^0 * P(patt) * sp^0
end
function empty(p)
    return C(p)/''
end
local str_kw = function(patt)
    local q1 = P'"'
    local q2 = P"'"
    patt = P(patt)

    return (q1 * patt * q1) + (q2 * patt * q2)
end
local list = function(patt)
    patt = P(patt)
    return Ct(patt * (kw(split) * patt)^0)
end
local tag = function(tag, patt)
    patt = P(patt)
    return Ct(Cg(Cp(), "pos") * Cg(Cc(tag), 'tag') * patt)
end
local tag_s = function(tag)
    return Ct(Cg(Cp(), "pos") * Cg(Cc(tag), 'tag'))
end
local list_ex = function(key, tags)
    local patt
    if key then
        patt = Cg(Cp(), "pos") * Cg(Cc(key), 'tag') * str_kw(key)
    else
        patt = Cg(Cp(), "pos")
    end
    local sp = kw(split)
    for k,v in ipairs(tags) do
        local p
        if v.tag then
            p = Cg(v.patt, v.tag)
        else
            p = v.patt
        end
        if v.no_split then
        else
            p = sp * p
        end
        if v.count then
            p = p^v.count
        end
        patt = patt * p
    end
    return Ct(patt)
end
local maybe = function(patt)
    return P(patt)^-1
end
local type_str = function()
    return (alnum + unicode + S'_.() ')^0
end
local type_number = function()
    local digits = digit^1
    local mp = S'+-'
    local dot = P'.'
    local exp = S'eE'
    return (maybe(mp) * digits * maybe(dot*digits) * maybe(exp*maybe(mp)*digits)) / tonumber
end
local type_hex = function()
    local digits = (digit + S'abcdefABCDEF')^1
    local hex = P'0x'
    return (hex * digits) / tonumber
end
local string_apitest = function(name)
    if type(t[name]) == 'function' then
        return {
            value = 't["' .. name .. '"]',
            tag = 'funcname',
        }
    elseif type(G[name]) == 'function' then
        return {
            value = 'G.' .. name,
            tag = 'funcname',
        }
    end
    return false
end
local string_gapitest = function(ast)
    local name = ast.variable
    if type(t[name]) == 'function' then
        return {
            value = name,
            tag = 'gname',
        }
    end
    return false
end
local tovariable = function(t)
    local var = t.variable
    local pos = t.pos

    if var and type(var) == 'string' and pos then
        local api = string_apitest(var)
        if api then
            return api
        else
            t[var] = var .. '_' .. pos
        end
    end
    return t
end

-- grammar
local Gr = {'tLua',
    t_begin = kw'{',
    t_end = kw'}',

    expression = V'expression_if' + 
                 V'expression_while' + 
                 V'expression_repeat' + 
                 V'expression_block' + 
                 V'expression_anonfunction' + 
                 V'expression_listener' + 
                 V'expression_set' + 
                 V'expression_table' + 
                 V'expression_append' + 
                 V'expression_apply' + 
                 V'expression_map' + 
                 V'expression_filter' + 
                 V'expression_foldl' + 
                 V'expression_foldr' + 
                 V'expression_gcall' + 
                 V'expression_funccall' + 
                 list(V'atom_tableset' + V'atom'),

    expression_if = list_ex('if', {
        {tag = 'condition', patt = V'atom'},
        {tag = 'if_action', patt = V'atom'},
        {tag = 'else_action', patt = V'atom', count = -1},
    }),
    expression_while = list_ex('while', {
        {tag = 'condition', patt = V'atom'},
        {tag = 'action', patt = V'atom'},
    }),
    expression_repeat = list_ex('repeat', {
        {tag = 'start', patt = V'atom'},
        {tag = 'end', patt = V'atom'},
        {tag = 'step', patt = V'atom'},
        {tag = 'action', patt = V'atom', count = -1},
    }),
    expression_block = list_ex('block', {
        {patt = V'atom', count = 1},
    }),
    expression_anonfunction = list_ex('function', {
        {tag = 'variables_arg', patt = V't_begin' * (list(V'expression_variable_arg') + Ct(Cc())) * V't_end'},
        {tag = 'variables', patt = V't_begin' * (list(V't_begin' * V'expression_variable' * V't_end') + Ct(Cc())) * V't_end'},
        {tag = 'action', patt = V'atom', count = -1},
    }),
    expression_variable = list_ex(nil, {
        {tag = 'variable', patt = V'Name', no_split = true},
        {tag = 'value', patt = V'atom', count = -1},
    })/tovariable,
    expression_variable_arg = Ct(Cg(Cp(), "pos") * Cg(Cc('arg'), 'tag') * Cg(V'Name', 'variable'))/tovariable,

    Name      = str_kw(-V"Reserved" * C(V"Ident")),
    Reserved  = V"Keywords" * -V"IdRest",
    Keywords  = P"+" + "-" + "*" + "/" + "//" + 
                "==" + ">" + "<" + ">=" + "<=" + 'and' + 'or' + 'not' + 
                "map" + 'append' + 'apply' + 'filter' + 'foldl' + 'foldr' + 
                "if" + "while" + "repeat" + "block" + "function" + 'set' + 'table' + 
                "listener" +
                "true" + "false",
    Ident     = V"IdStart" * V"IdMid"^0 * V"IdRest"^0,
    IdStart   = alpha + P"_" + unicode,
    IdMid     = alnum + P"_" + unicode + P".",
    IdRest    = alnum + P"_" + unicode,

    expression_listener = list_ex('listener', {
        {tag = 'earg', patt = V't_begin' * V'expression_listener_earg' * V't_end'},
        {tag = 'action_func', patt = V'expression_function'},
        {tag = 'condition_func', patt = V'expression_function' + tag_s('nil')},
        {tag = 'prior', patt = V'atom_number' + V'atom_var' + tag_s('nil')},
        {tag = 'group', patt = V'atom_str' + V'atom_var' + tag_s('nil')},
    }),
    expression_listener_earg = list_ex(nil, {
        {tag = 'event', patt = V'atom_str', no_split = true},
        {patt = V'atom', count = 0},
    }),

    expression_set = list_ex('set', {
        {tag = 'variable', patt = V'atom_var'},
        {tag = 'value', patt = V'atom', count = -1},
    }),

    expression_table = list_ex('table', {
        {patt = V'atom', count = 0},
    }),

    expression_append = list_ex('append', {
        {tag = 't1', patt = V'atom_list'},
        {tag = 't2', patt = V'atom_list'},
    }),

    expression_apply = list_ex('apply', {
        {tag = 'func', patt = V'expression_function'},
        {patt = V'atom', count = 0},
    }),

    expression_map = list_ex('map', {
        {tag = 'func', patt = V'expression_function'},
        {patt = V'atom_list', count = 1},
    }),

    expression_filter = list_ex('filter', {
        {tag = 'func', patt = V'expression_function'},
        {tag = 'tabl', patt = V'atom_list'},
    }),

    expression_foldl = list_ex('foldl', {
        {tag = 'func', patt = V'expression_function'},
        {tag = 'base', patt = V'atom'},
        {tag = 'tabl', patt = V'atom_list'},
    }),

    expression_foldr = list_ex('foldr', {
        {tag = 'func', patt = V'expression_function'},
        {tag = 'base', patt = V'atom'},
        {tag = 'tabl', patt = V'atom_list'},
    }),

    expression_funccall = list_ex(nil, {
        {tag = 'func', patt = V'expression_function', no_split = true},
        {patt = V'atom', count = 0},
    }),
    expression_function = ((V't_begin' * V'expression_anonfunction' * V't_end') + 
                           V'atom_op' + 
                           V'atom_var'
                          ),

    expression_gcall = list_ex(nil, {
        {tag = 'gfunc', patt = Ct(Cg(Cp(), "pos") * Cg(Cc('var'), 'tag') * Cg(V'Name', 'variable'))/string_gapitest, no_split = true},
        {patt = V'atom', count = 0},
    }),

    atom_tableset = Ct(Cg(Cp(), "pos") * 
                       Cg(Cc('tset'), 'tag') * 
                       (kw('[') * 
                        Cg(str_kw(C(type_str())) + V'atom_var', 'key') * 
                        kw(']') * 
                        kw('=') * 
                        Cg(V'atom', 'value'))
                    ),

    atom_list = (V't_begin' * (V'expression_table' + list(V'atom')) * V't_end') + V'atom_var',
    atom = V'atom_op' +
           V'atom_hex' +
           V'atom_number' +
           V'atom_bool' +
           V'atom_var' +
           V'atom_str' +
           V'tLua' +
           tag_s('nil'),

    atom_op = str_kw(P'+'/'tLua_ADD' + 
                     P'-'/'tLua_SUB' +
                     P'*'/'tLua_MULT' +
                     P'//'/'tLua_EXACT_DIV' +
                     P'/'/'tLua_DIV' +
                     P'%'/'tLua_MOD' +
                     P'=='/'tLua_EQUAL' + 
                     P'>'/'tLua_GT' + 
                     P'<'/'tLua_LT' + 
                     P'>='/'tLua_GE' + 
                     P'<='/'tLua_LE' + 
                     P'and'/'tLua_AND' + 
                     P'or'/'tLua_OR' + 
                     P'not'/'tLua_NOT' +

                     -- if
                     -- while
                     -- repeat
                     -- block

                     P'apply'/'call' +
                     P'table'/'tLua_TABLE' +
                     P'append'/'tLua_APPEND' +
                     P'map'/'tLua_MAP' +
                     P'filter'/'tLua_FILTER' +
                     P'foldl'/'tLua_FOLDL' +
                     P'foldr'/'tLua_FOLDR' +
                     P'listener'/'tLua_add_listener'

                     )/string_apitest,
    atom_number = type_number(),
    atom_hex = type_hex(),
    atom_bool = (kw('true') * tag_s('true')) + (kw('false') * tag_s('false')),
    atom_var = Ct(Cg(Cp(), "pos") * Cg(Cc('var'), 'tag') * Cg(V'Name', 'variable'))/tovariable,
    atom_str = str_kw(P'$' * C(type_str())),


    tLua = V't_begin' * V'expression' * V't_end',
}

t['tLua_parse'] = function (exp)
    local d = require '_data'
    local ast, label, sfail = match(Gr, exp)
    --print(ast, label, sfail)
    --G.show_table(ast)
    return ast
end

--=================================================
--=================================================
--=================================================
--code
--=================================================
--=================================================
--=================================================

local code = {}
local func = nil
local tabc = 0
local tl = function(v)
    table.insert(code, v)
end
local tlt = function(v)
    table.insert(code, string.rep('\t', tabc) .. v)
end
local value_iter
local func_iter
local localfunction_iter
local table_iter
local code_iter

value_iter = function (v)
    if type(v) == 'table' then
        code_iter(v)
    elseif type(v) == 'boolean' then
        if v == true then
            tl('true')
        elseif v == false then
            tl('false')
        end
    elseif type(v) == 'number' then
        tl(tostring(v))
    elseif type(v) == 'string' then
        tl('"' .. v .. '"')
    else
        tl('')
    end
end

func_iter = function (func, ...)
    value_iter(func) tl('(')
    for i = 1, select('#', ...), 1 do
        if i > 1 then
            tl(',')
        end
        value_iter(select(i, ...))
    end
    tl(')')
end

gfunc_iter = function (func, ...)
    tl('G.call(') value_iter(func['value'])
    for i = 1, select('#', ...), 1 do
        tl(',') value_iter(select(i, ...))
    end
    tl(')')
end

localfunction_iter = function (name, ast)
    if name then
        tlt('local function ' .. name .. ' (')
    else
        tl('(function(')
    end
    variable_iter.func_posh(ast)
    for k,v in ipairs(ast['variables_arg'] or {}) do
        variable_iter.variable_posh(v)
        if k > 1 then
            tl(',' .. v[v['variable']])
        else
            tl(v[v['variable']])
        end
    end
    tl(')\n')
        tabc = tabc + 1
        for k,v in ipairs(ast['variables'] or {}) do
            variable_iter.variable_posh(v)

            if type(v['value']) == 'table' and v['value'].tag == 'function' then
                local ast = v['value']
                localfunction_iter(v[v['variable']], ast)
            else
                tlt('local ' .. v[v['variable']] .. ' = ') value_iter(v['value']) tl('\n')
            end
        end
        tlt('return ') value_iter(ast.action) tl('\n')
    tabc = tabc - 1
    if name then
        tlt('end\n')
    else
        tlt('end)')
    end
    variable_iter.func_pop()
end

table_iter = function (...)
    tl('{')
    for i = 1, select('#', ...), 1 do
        if i > 1 then
            tl(',')
        end
        value_iter(select(i, ...))
    end
    tl('}')
end
variable_iter = {
    func_posh = function (ast)
        if func then
            local cur = {
                up = func,
                varlist = {},
            }
            func = cur
        else
            func = {
                up = nil,
                varlist = {},
            }
        end
    end,
    func_pop = function ()
        if func then
            local cur = func
            func = cur.up
            return cur
        end
    end,
    variable_posh = function (var)
        if func then
            local name = var.variable
            local real_name = var[name]
            func.varlist[name] = real_name
        end
    end,
    variable_get = function (var)
        local cur = func
        local name = var.variable
        while cur do
            if cur.varlist[name] then
                return cur.varlist[name]
            else
                cur = cur.up
            end
        end
    end,
}

code_iter = function (ast)
    if ast.tag then
        if ast.tag == 'nil' then
            tl('nil')
        elseif ast.tag == 'true' then
            tl('true')
        elseif ast.tag == 'false' then
            tl('false')
        elseif ast.tag == 'var' then
            local name = variable_iter.variable_get(ast)
            if name then
                tl(name)
            else
                tl(ast['variable'])
            end
        elseif ast.tag == 'tset' then
            tl('[') value_iter(ast['key']) tl('] = ') value_iter(ast['value'])
        elseif ast.tag == 'funcname' then
            tl(ast['value'])
        elseif ast.tag == 'if' then
            tl('(function ()\n')
                tabc = tabc + 1
                tlt('if(') value_iter(ast['condition']) tl(')then\n')
                    tabc = tabc + 1
                    tlt('return ') value_iter(ast['if_action']) tl('\n')
                tabc = tabc - 1
                if ast['else_action'] ~= nil then
                    tlt('else\n')
                        tabc = tabc + 1
                        tlt('return ') value_iter(ast['else_action']) tl('\n')
                    tabc = tabc - 1
                end
                tlt('end\n')
            tabc = tabc - 1
            tlt('end)()')
        elseif ast.tag == 'while' then
            tl('(function()\n')
                tabc = tabc + 1
                tlt('local _ = nil\n')
                tlt('while(') value_iter(ast['condition']) tl(')do\n')
                    tabc = tabc + 1
                    tlt('_ = ') value_iter(ast['action']) tl('\n')
                tabc = tabc - 1
                tlt('end\n')
                tlt('return _\n')
            tabc = tabc - 1
            tlt('end)()')
        elseif ast.tag == 'repeat' then
            tl('(function()\n')
                tabc = tabc + 1
                tlt('local _ = nil\n')
                tlt('for i = ') value_iter(ast['start']) tl(',') value_iter(ast['end']) tl(',') value_iter(ast['step']) tl(' do\n')
                    tabc = tabc + 1
                    tlt('_ = ') value_iter(ast['action']) tl('\n')
                tabc = tabc - 1
                tlt('end\n')
                tlt('return _\n')
            tabc = tabc - 1
            tlt('end)()')
        elseif ast.tag == 'block' then
            tl('(function()\n')
                tabc = tabc + 1
                tlt('local _ = nil\n')
                for k,v in ipairs(ast or {}) do
                    tlt('_ = ') value_iter(v) tl('\n')
                end
                tlt('return _\n')
            tabc = tabc - 1
            tlt('end)()')
        elseif ast.tag == 'function' then
            localfunction_iter(nil, ast)
        elseif ast.tag == 'listener' then
            tl('t["tLua_add_listener"](nil,{"' .. ast['earg']['event'] .. '"') 
            for k,v in ipairs(ast['earg'] or {}) do
                tl(',') value_iter(v)
            end
            tl('},') value_iter(ast['action_func']) 
            tl(',') value_iter(ast['condition_func'])
            tl(',') value_iter(ast['prior'])
            tl(',') value_iter(ast['group'])
            tl(')')
        elseif ast.tag == 'map' then
            tl('t["tLua_MAP"](') value_iter(ast['func'])
            for k,v in ipairs(ast or {}) do
                tl(',') value_iter(v)
            end
            tl(')')
        elseif ast.tag == 'filter' then
            tl('t["tLua_FILTER"](') value_iter(ast['func']) tl(',') value_iter(ast['tabl']) tl(')')
        elseif ast.tag == 'set' then
            local name = variable_iter.variable_get(ast['variable']) or ast['variable']
            tl('(function() ') tl(name) tl(' = ') value_iter(ast['value']) tl(' return ') tl(name) tl(' end)()')
        elseif ast.tag == 'table' then
            tl('{')
            for k,v in ipairs(ast or {}) do
                if k > 1 then
                    tl(',')
                end
                value_iter(v)
            end
            tl('}')
        elseif ast.tag == 'append' then
            tl('t["tLua_APPEND"](') value_iter(ast['t1']) tl(',') value_iter(ast['t2']) tl(')')
        elseif ast.tag == 'apply' then
            tl('G.call(') value_iter(ast['func'])
            for k,v in ipairs(ast or {}) do
                tl(',') value_iter(v)
            end
            tl(')')
        elseif ast.tag == 'foldl' then
            tl('t["tLua_FOLDL"](') value_iter(ast['func']) tl(',') value_iter(ast['base']) tl(',') value_iter(ast['tabl']) tl(')')
        elseif ast.tag == 'foldr' then
            tl('t["tLua_FOLDR"](') value_iter(ast['func']) tl(',') value_iter(ast['base']) tl(',') value_iter(ast['tabl']) tl(')')
        end
    elseif ast['gfunc'] then
        gfunc_iter(ast['gfunc'], table.unpack(ast))
    elseif ast['func'] then
        func_iter(ast['func'], table.unpack(ast))
    else
        table_iter(table.unpack(ast))
    end
end

t['tLua_code'] = function(ast)
    code = {}
    func = nil
    tabc = 0
    assert(type(ast) == "table")

    tl('function (self, info, card)\n')
        tabc = tabc + 1
        tlt('local G = require "gf"\n')
        tlt('local t = G.api\n')
        tlt('return ')
        code_iter(ast)
        tabc = tabc - 1
    tlt('\nend\n')

    --G.show_table(table.concat(code, ''))
    return table.concat(code, '')
end