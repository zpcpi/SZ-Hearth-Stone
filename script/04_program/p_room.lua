--[[6665

]]
local G = require "gf"
local L = {}
local t = G.api
local lsocket = require("socket.core")

t['房间_更新玩家信息'] = function(o_room_player_玩家)
    local o_misc = G.misc()
    local boolean_处理完毕 = false
    if o_misc.房间玩家列表 == nil then 
        o_misc.房间玩家列表 = {}
    end
    for index, o_room_player in ipairs(o_misc.房间玩家列表) do 
        if G.call('房间_是否是同一玩家', o_room_player, o_room_player_玩家) then 
            if G.call('房间_是否是同一玩家', G.call('系统_获取当前玩家信息'), o_room_player_玩家) then 
                G.call('系统_更新当前玩家信息', o_room_player_玩家)
            end
            o_misc.房间玩家列表[index] = o_room_player_玩家
            boolean_处理完毕 = true
            break
        end
    end
    if not boolean_处理完毕 then 
        table.insert(o_misc.房间玩家列表, o_room_player_玩家)
    end
    if G.call('网络通用_能否广播') then 
        G.call('网络通用_广播消息', '房间_更新玩家信息', o_room_player_玩家)
    end
end

t['房间_删除玩家信息'] = function(o_room_player_玩家)
    local o_misc = G.misc()
    if o_misc.房间玩家列表 == nil then 
        return
    end
    for index, o_room_player in ipairs(o_misc.房间玩家列表) do 
        if G.call('房间_是否是同一玩家', o_room_player, o_room_player_玩家) then 
            if G.call('房间_是否是同一玩家', G.call('系统_获取当前玩家信息'), o_room_player_玩家) then 
                return
            end
            table.remove(o_misc.房间玩家列表, index)
            return
        end
    end
end

t['房间_获取玩家信息列表'] = function()
    return G.misc().房间玩家列表 or {}
end

t['房间_是否是同一玩家'] = function(o_room_player_玩家1, o_room_player_玩家2)
    if type(o_room_player_玩家1) ~= 'table' or type(o_room_player_玩家2) ~= 'table' then 
        return false
    end
    for _, key in ipairs(PLAYER_ONLY_KEY_LIST) do 
        if o_room_player_玩家1[key] ~= o_room_player_玩家2[key] then 
            return false
        end
    end
    return true
end

t['房间_清空玩家列表'] = function()
    G.misc().房间玩家列表 = {}
    if G.call('网络通用_能否广播') then 
        G.call('网络通用_广播消息', '房间_删除玩家信息', G.call('系统_获取当前玩家信息'))
    end
end

t['房间_是否满足开始条件'] = function()
    local o_misc = G.misc()

    if type(o_misc.房间玩家列表) ~= 'table' then 
        G.call('系统_输出信息', '人数不足， 无法开始游戏！')
        return false
    end
    local o_deck_卡组 = G.call('对决_获取对决卡组')
    if not G.call('收藏_卡组是否有效', o_deck_卡组) then 
        G.call('系统_输出信息', '需要选择一副有效卡组')
        return false
    end
    if G.misc().对决类型 == '1v1' then 
        return #o_misc.房间玩家列表 == 2
    elseif G.misc().对决类型 == '2v2' then 
        return #o_misc.房间玩家列表 == 4
    else
        G.call('系统_输出信息', '请选择游戏模式')
        return false
    end
end

t['房间_是否所有玩家准备就绪'] = function()
    local o_misc = G.misc()

    if type(o_misc.房间玩家列表) ~= 'table' then 
        return false
    end
    for _, any_玩家信息 in ipairs(o_misc.房间玩家列表) do 
        if any_玩家信息.准备就绪 ~= true and any_玩家信息.是主机 ~= true then 
            return false
        end
    end
    return true
end

t['房间_相对身份获取玩家信息'] = function(estr_player_相对身份)
    local estr_absolute_id_type_绝对身份 = G.call('房间_获取绝对身份', estr_player_相对身份)
    return G.call('房间_绝对身份获取玩家信息', estr_absolute_id_type_绝对身份)
end

t['房间_绝对身份获取玩家信息'] = function(estr_absolute_id_type_绝对身份)
    local any_玩家信息列表 = G.call('房间_获取玩家信息列表')
    for _, any_玩家信息 in ipairs(any_玩家信息列表) do 
        if any_玩家信息.绝对身份 == estr_absolute_id_type_绝对身份 then 
            return any_玩家信息
        end
    end
    return nil
end

t['房间_获取绝对身份'] = function(estr_player_相对身份, estr_player_对照相对身份)
    local any_当前玩家信息 = G.call('系统_获取当前玩家信息')
    local estr_absolute_id_type_本地玩家绝对身份 = any_当前玩家信息.绝对身份

    local l2a_mapping
    local a2l_mapping
    if G.misc().对决类型 == '1v1' then 
        l2a_mapping = PLAYER_MAPPING_L2A_1v1
        a2l_mapping = PLAYER_MAPPING_A2L_1v1
    elseif G.misc().对决类型 == '2v2' then 
        l2a_mapping = PLAYER_MAPPING_L2A_2v2
        a2l_mapping = PLAYER_MAPPING_A2L_2v2
    else
        goto next
    end

    do
        local estr_absolute_id_type_对照玩家绝对身份
        local estr_absolute_id_type_查找玩家绝对身份
        if estr_player_对照相对身份 then
            estr_absolute_id_type_对照玩家绝对身份 = (l2a_mapping[estr_absolute_id_type_本地玩家绝对身份] or {})
                                                                [estr_player_对照相对身份]
        else
            estr_absolute_id_type_对照玩家绝对身份 = estr_absolute_id_type_本地玩家绝对身份
        end

        if estr_absolute_id_type_对照玩家绝对身份 then
            estr_absolute_id_type_查找玩家绝对身份 = (l2a_mapping[estr_absolute_id_type_对照玩家绝对身份] or {})
                                                                [estr_player_相对身份]
        else
            goto next
        end

        return estr_absolute_id_type_查找玩家绝对身份
    end

    ::next::
    G.call('提示_添加提示', '无法找到绝对身份! ' .. tostring(estr_player_相对身份, estr_player_对照相对身份))
    return ''
end

t['房间_获取相对身份'] = function(estr_absolute_id_type_绝对身份)
    local any_当前玩家信息 = G.call('系统_获取当前玩家信息')
    local estr_absolute_id_type_本地玩家绝对身份 = any_当前玩家信息.绝对身份
    
    local l2a_mapping
    local a2l_mapping
    if G.misc().对决类型 == '1v1' then 
        a2l_mapping = PLAYER_MAPPING_A2L_1v1
    elseif G.misc().对决类型 == '2v2' then 
        a2l_mapping = PLAYER_MAPPING_A2L_2v2
    else
        goto next
    end

    do
        local estr_player_相对身份 = (a2l_mapping[estr_absolute_id_type_本地玩家绝对身份] or {})
                                                 [estr_absolute_id_type_绝对身份]
        if estr_player_相对身份 then
            return estr_player_相对身份
        end
    end

    ::next::
    G.call('提示_添加提示', '无法找到相对身份! ' .. tostring(estr_absolute_id_type_绝对身份))
    return ''
end

t['房间_身份阵营关系'] = function(estr_absolute_id_type_绝对身份1, estr_absolute_id_type_绝对身份2)
    local l2a_mapping
    if G.misc().对决类型 == '1v1' then 
        l2a_mapping = PLAYER_MAPPING_L2A_1v1
    elseif G.misc().对决类型 == '2v2' then 
        l2a_mapping = PLAYER_MAPPING_L2A_2v2
    else
        goto next
    end

    if (l2a_mapping[estr_absolute_id_type_绝对身份1]['我方'] == estr_absolute_id_type_绝对身份2) or
       (l2a_mapping[estr_absolute_id_type_绝对身份1]['友方1'] == estr_absolute_id_type_绝对身份2) then
        return '我方'
    else
        return '敌方'
    end

    ::next::
end

t['房间_是否同一阵营_绝对身份'] = function(estr_absolute_id_type_绝对身份1, estr_absolute_id_type_绝对身份2)
    if estr_absolute_id_type_绝对身份1 == estr_absolute_id_type_绝对身份2 then 
        return true
    elseif estr_absolute_id_type_绝对身份1 == '红1' and estr_absolute_id_type_绝对身份2 == '红2' or
    estr_absolute_id_type_绝对身份1 == '红2' and estr_absolute_id_type_绝对身份2 == '红1' or
    estr_absolute_id_type_绝对身份1 == '蓝1' and estr_absolute_id_type_绝对身份2 == '蓝2' or
    estr_absolute_id_type_绝对身份1 == '蓝2' and estr_absolute_id_type_绝对身份2 == '蓝1' then 
        return true
    else
        return false
    end
end

t['房间_是否同一阵营_相对身份'] = function(estr_player_相对身份1, estr_player_相对身份2)
    if estr_player_相对身份1 == estr_player_相对身份2 then 
        return true
    elseif estr_player_相对身份1 == '我方' and estr_player_相对身份2 == '友方' or
    estr_player_相对身份1 == '友方' and estr_player_相对身份2 == '我方' then 
        return true
    else
        return false
    end
end

t['房间_当前玩家准备'] = function()
    local any_当前玩家信息 = G.call('系统_获取当前玩家信息')
    any_当前玩家信息.准备就绪 = not any_当前玩家信息.准备就绪
    G.call('房间_更新玩家信息', any_当前玩家信息)
end

t['房间_分配绝对身份'] = function()
    local any_玩家信息列表 = G.call('房间_获取玩家信息列表')
    local _any_可用身份列表 = {}
    if G.misc().对决类型 == '1v1' then 
        _any_可用身份列表 = {'红1', '蓝1'}
    elseif G.misc().对决类型 == '2v2' then 
        _any_可用身份列表 = {'红1', '蓝1', '红2', '蓝2'}
    end
    for i = 1, #any_玩家信息列表 do 
        local int_随机数 = G.random(1, #_any_可用身份列表)
        any_玩家信息列表[i].绝对身份 = table.remove(_any_可用身份列表, int_随机数)
    end
    for i = 1, #any_玩家信息列表 do 
        G.call('房间_更新玩家信息', any_玩家信息列表[i])
    end
end

--hide=true
t['房间_退出房间'] = function()
    G.call('房间_清空玩家列表')
    if type(G.socketList) == 'table' then 
        for i = #G.connectList, 1, -1 do 
            local socket = table.remove(G.connectList, i)
            if socket then 
                socket:close()
            end
        end
    end
    G.connectList = nil
    G.tcpServerSocket = nil
    G.tcpClientSocket = nil
end
