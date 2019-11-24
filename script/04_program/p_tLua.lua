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
t['tLua_ADD'] = function (result, ...)
    for i = 1, select('#', ...), 1 do
        result = result + select(i, ...)
    end
    return result
end

t['tLua_SUB'] = function (result, ...)
    for i = 1, select('#', ...), 1 do
        result = result - select(i, ...)
    end
    return result
end

t['tLua_MULT'] = function (result, ...)
    for i = 1, select('#', ...), 1 do
        result = result * select(i, ...)
    end
    return result
end

t['tLua_DIV'] = function (result, ...)
    for i = 1, select('#', ...), 1 do
        result = result / select(i, ...)
    end
    return result
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
local toboolean = function(v)
    if v == 'true' then
        return true
    elseif v == 'false' then
        return false
    else
        return tag_s('nil')
    end
end
local type_str = function()
    return (alpha + unicode + S'_.() ')^0
end
local type_number = function()
    local digits = digit^1
    local mp = S'+-'
    local dot = P'.'
    local exp = S'eE'
    return (maybe(mp) * digits * maybe(dot*digits) * maybe(exp*maybe(mp)*digits)) / tonumber
end
local tovariable = function(t)
    local var = t.variable
    local pos = t.pos

    if var and type(var) == 'string' and pos then
        t[var] = var .. '_' .. pos
    end
    return t
end
local tovariable_arg = function(var)
    if var then

    end
    print(var)
end

-- grammar
local Gr = {'tLua',
    t_begin = kw'{',
    t_end = kw'}',

    expression = V'expression_if' + 
                 V'expression_while' + 
                 V'expression_repeat' + 
                 V'expression_block' + 
                 V'expression_function' + 
                 V'atom_list',

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
    expression_function = list_ex('function', {
        {tag = 'variables_arg', patt = V't_begin' * list(V'expression_variable_arg') * V't_end'},
        {tag = 'variables', patt = V't_begin' * list(V't_begin' * V'expression_variable' * V't_end') * V't_end'},
        {tag = 'action', patt = V'atom', count = -1},
    }),
    expression_variable = list_ex(nil, {
        {tag = 'variable', patt = V'Name', no_split = true},
        {tag = 'value', patt = V'atom', count = -1},
    })/tovariable,
    expression_variable_arg = Ct(Cg(Cp(), "pos") * Cg(Cc('arg'), 'tag') * Cg(V'Name', 'variable'))/tovariable,

    Name      = str_kw(-V"Reserved" * C(V"Ident")),
    Reserved  = V"Keywords" * -V"IdRest",
    Keywords  = P"+" + "-" + "*" + "/" + "if" + "while" + 
                "repeat" + "block" + "function",
    Ident     = V"IdStart" * V"IdRest"^0,
    IdStart   = alpha + P"_" + unicode,
    IdRest    = alnum + P"_" + unicode,

    expression_wait = P'',

    atom_list = list(V'atom'),
    atom = str_kw(V'atom_op') +
           V'atom_number' +
           V'atom_bool' +
           V'atom_str' +
           V'tLua' +
           tag_s('nil'),

    atom_op = P'+'/'tLua_ADD' + 
              P'-'/'tLua_SUB' +
              P'*'/'tLua_MULT' +
              P'/'/'tLua_DIV',
    atom_number = type_number(),
    atom_bool = (kw('true') + kw('false'))/toboolean,
    atom_str = str_kw(C(type_str())),


    tLua = V't_begin' * V'expression' * V't_end',
}

t['tLua_parse'] = function (exp)
    local ast, label, sfail = match(Gr, exp)
    print(ast, label, sfail)
    G.show_table(ast)
    return ast
end


local code = {}
local tabc = 0
local tl = function(v)
    table.insert(code, v)
end
local tlt = function(v)
    table.insert(code, string.rep('\t', tabc) .. v)
end
local value_iter
local func_iter
local table_iter
local code_iter
local function api_test(name)
    return t[name]
end

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
        tl(v)
    else
        tl('')
    end
end

func_iter = function (func, ...)
    tl('t["' .. func .. '"](')
    for i = 1, select('#', ...), 1 do
        if i > 1 then
            tl(',')
        end
        value_iter(select(i, ...))
    end
    tl(')')
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

code_iter = function (ast)
    if ast.tag then
        if ast.tag == 'nil' then
            tl('nil')
        elseif ast.tag == 'if' then
            tl('(function ()\n')
                tabc = tabc + 1
                tlt('if(') value_iter(ast['condition']) tl(')then\n')
                    tabc = tabc + 1
                    tlt('return ') value_iter(ast['if_action']) tl('\n')
                tabc = tabc - 1
                if ast['else_action'] then
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
            tl('(function(')
            for k,v in ipairs(ast['variables_arg'] or {}) do
                if k > 1 then
                    tl(',' .. v[v['variable']])
                else
                    tl(v[v['variable']])
                end
            end
            tl(')\n')
                tabc = tabc + 1
                for k,v in ipairs(ast['variables'] or {}) do
                    tlt('local ' .. v[v['variable']] .. ' = ') value_iter(v['value']) tl('\n')
                end
                tlt('return ') value_iter(ast.action) tl('\n')
            tabc = tabc - 1
            tlt('end)')
        end
    elseif api_test(ast[1]) then
        func_iter(table.unpack(ast))
    else
        table_iter(table.unpack(ast))
    end
end

t['tLua_code'] = function(ast)
    code = {}
    assert(type(ast) == "table")

    tl('function ()\n')
        tabc = 1
        tlt('local G = require "gf"\n')
        tlt('local t = G.api\n')
        tlt('return ')
        code_iter(ast)
        tabc = 0
    tlt('\nend\n')

    G.show_table(table.concat(code, ''))
    return table.concat(code, '')
end