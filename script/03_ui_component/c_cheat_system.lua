--[[3002

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.作弊界面 = self.obj.getChildByName('作弊界面')
    self.作弊界面.visible = false

    self.初始面板 = self.作弊界面.getChildByName('initlist')
    self.作弊指令说明 = self.初始面板.getChildByName('说明')
    self.作弊指令提示 = self.初始面板.getChildByName('提示信息')
    self.作弊条目面板 = self.初始面板.getChildByName('作弊条目面板')
    self.作弊条目 = self.初始面板.getChildByName('作弊条目')
    self.作弊条目.visible = false
    self.已创建作弊条目 = false

    self.作弊指令历史面板 = self.作弊界面.getChildByName('cheatlist')
    self.作弊指令历史条目 = self.作弊指令历史面板.getChildByName('作弊指令')
    self.作弊指令历史条目.visible = false
    self.作弊指令历史条目列表 = {}

    self.作弊指令输入框 = self.作弊界面.getChildByName('输入框')
    self.作弊指令内容 = self.作弊指令输入框.getChildByName('cheat')
    self.作弊指令输入框.visible = true
    self.作弊指令内容.text = ''

    self.当前作弊历史索引 = 0
end

function t:keyDown(tar,info)
    local int_长度
    local key = string.byte(info)
    if self.作弊界面.visible then
        local table_cheatlist = G.misc().作弊指令列表
        if (key == 13) then --- 回车
            if self.作弊指令内容.text ~= "" then
                G.trig_event('作弊指令', self.作弊指令内容.text)
            end
            self:隐藏作弊界面()
        elseif G.KeyState(0x11) ~= 0 and key == 38 then ---- Ctrl + UP
            self.当前作弊历史索引 = self.当前作弊历史索引 - 1
            if self.当前作弊历史索引 < 1 then
                self.当前作弊历史索引 = 1
            end
            self.作弊指令内容.text = table_cheatlist[self.当前作弊历史索引]
            int_长度 = G.getStrLen(self.作弊指令内容.text)
            self.作弊指令内容.selectBegin = int_长度
            self.作弊指令内容.selectEnd = int_长度
        elseif G.KeyState(0x11) ~= 0 and key == 40 then ---- Ctrl + DOWN
            self.当前作弊历史索引 = self.当前作弊历史索引 + 1
            if self.当前作弊历史索引 > #table_cheatlist then
                self.当前作弊历史索引 = #table_cheatlist + 1
                self.作弊指令内容.text = ""
            else
                self.作弊指令内容.text = table_cheatlist[self.当前作弊历史索引]
                int_长度 = G.getStrLen(self.作弊指令内容.text)
                self.作弊指令内容.selectBegin = int_长度
                self.作弊指令内容.selectEnd = int_长度
            end
        elseif G.KeyState(0x11) ~= 0 and key == 37 then ---- Ctrl + LEFT
            self:作弊文本选取(self.作弊指令内容.selectBegin + 1, false)
        elseif G.KeyState(0x11) ~= 0 and key == 39 then ---- Ctrl + RIGHT
            self:作弊文本选取(self.作弊指令内容.selectEnd - 1, true)
        elseif G.KeyState(0x11) ~= 0 and key >= 48 and key <= 57 then ---- Ctrl + (1-9)
            local count = 0
            if key == 48 then
                -- 按下 0 意味着按下 10
                count = 10
            else
                count = key - 48
            end
            if table_cheatlist[count] ~= nil then
                G.trig_event('作弊指令', table_cheatlist[count])
                self:隐藏作弊界面()
            end
        end
    else
        if (key == 13) then --- 回车
            self:显示作弊界面()
        end
    end
end

function t:显示作弊界面()
    local int_作弊历史数量 = 0
    local o_misc_杂项 = G.misc()
    local _o_cheat_system_item

    self.作弊界面.visible = true
    if o_misc_杂项 and o_misc_杂项.作弊指令列表 then
        int_作弊历史数量 = #o_misc_杂项.作弊指令列表
    end
    self.当前作弊历史索引 = int_作弊历史数量 + 1
    self.作弊指令内容.text = ''
    self.作弊指令内容.selectBegin = -1
    self.作弊指令内容.selectEnd = -1

    if self.已创建作弊条目 == false then
        _o_cheat_system_item = G.DBTable('o_cheat_system_item')
        for k,v in ipairs(_o_cheat_system_item) do
            local ui_obj = G.Clone(self.作弊条目)
            ui_obj.getChildByName('text').text = v['showname'] or ''
            ui_obj.getChildByName('参数').text = v['默认参数'] or ''
            ui_obj.c_button.count = k
            self.作弊条目面板.getChildByName('content').addChild(ui_obj)
            ui_obj.visible = true
        end
        self.作弊条目.visible = false
        self.已创建作弊条目 = true
    end
    self.作弊指令内容.visible = true
    self.作弊指令说明.visible = true
    self.作弊指令提示.visible = true
    G.SetEditing(self.作弊指令内容)
end

function t:获取字符串真实位置(str, i)
    return G.getStrLen(string.sub(str, 1, i))
end

function t:作弊文本选取(int_select, boolean_是否向右)
    local text = self.作弊指令内容.text
    local int_长度 = G.getStrLen(text)
    local int_first = 1
    local int_last = 1
    local int_old = 1
    local int_temp
    if boolean_是否向右 then
        if int_select >= int_长度 then
            self.作弊指令内容.selectBegin = 0
            self.作弊指令内容.selectEnd = 0
            return
        end

        while true do
            int_first = string.find(text, " ", int_first)
            if int_first == nil then
                int_first = int_old
                int_first = G.getStrLen(string.sub(text, 1, int_first))
                int_last = int_长度
                break
            elseif self:获取字符串真实位置(text, int_first) <= int_select then
                int_old = int_first
                int_first = int_first + 1
            elseif self:获取字符串真实位置(text, int_first) > int_select then
                int_last = string.find(text, " ", int_first + 1)
                if int_last == nil then
                    int_last = int_长度
                else
                    int_last = G.getStrLen(string.sub(text, 1, int_last)) - 1
                end
                int_first = G.getStrLen(string.sub(text, 1, int_first))
                break
            end
        end
    else
        if int_select <= 0 then
            self.作弊指令内容.selectBegin = 0
            self.作弊指令内容.selectEnd = 0
            return
        end
        while true do
            int_last = string.find(text, " ", int_last)
            if int_last == nil then
                int_first = int_old
                int_first = G.getStrLen(string.sub(text, 1, int_first))
                int_last = int_长度
                break
            elseif self:获取字符串真实位置(text, int_last) <= int_select then
                int_temp = string.find(text, " ", int_last + 1)
                if not (int_temp and self:获取字符串真实位置(text, int_temp) <= int_select) then
                    int_first = G.getStrLen(string.sub(text, 1, int_old))
                    int_last = G.getStrLen(string.sub(text, 1, int_last)) - 1
                    break
                else
                    int_old = int_last
                    int_last = int_last + 1
                end
            elseif self:获取字符串真实位置(text, int_last) > int_select then
                self.作弊指令内容.selectBegin = 0
                self.作弊指令内容.selectEnd = 0
                return
            end
        end
    end
    if int_first == 1 and string.sub(text, 1, 1) ~= " " then
        int_first = 0
    end
    self.作弊指令内容.selectBegin = int_first
    self.作弊指令内容.selectEnd = int_last
end

function t:更新作弊指令历史ui()
    local o_misc_杂项 = G.misc()
    local num = #o_misc_杂项.作弊指令列表
    local max_obj = #self.作弊指令历史条目列表

    if num > max_obj then
        -- 全部显示
        for k,obj in ipairs(self.作弊指令历史条目列表) do
            obj.visible = true
        end
        -- 不够的创建
        for i = max_obj + 1, num, 1 do
            local new_obj = G.Clone(self.作弊指令历史条目)
            self.作弊指令历史面板.getChildByName('content').addChild(new_obj)
            table.insert(self.作弊指令历史条目列表, new_obj)
            new_obj.visible = true
            new_obj.c_button.count = i
        end
    else
        -- 部分显示
        for i = 1, num, 1 do
            self.作弊指令历史条目列表[i].visible = true
        end
        -- 后续隐藏
        for i = num + 1, max_obj, 1 do
            self.作弊指令历史条目列表[i].visible = false
        end
    end

    for i = 1, num, 1 do
        local vtc = self.作弊指令历史条目列表[i].getChildByName('text_count')
        vtc.text = i

        local vt = self.作弊指令历史条目列表[i].getChildByName('text')
        vt.text = o_misc_杂项.作弊指令列表[i]
    end
end

function t:click(tar)
    if tar.name == "作弊指令" then
        -- 是右边的输入过的条目
        local cmd = tar.getChildByName('text').text
        G.trig_event('作弊指令', cmd)
        G.SetEditing(self.作弊指令内容)
    elseif tar.name == "作弊条目" then
        -- 是左边的原始条目
        local _o_cheat_system_item = G.DBTable('o_cheat_system_item')
        local count = tar.c_button.count
        if count then
            local data = _o_cheat_system_item[count]
            local str_args = tar.getChildByName('参数').text
            local string_作弊指令 = data.执行函数
            if str_args ~= nil and str_args ~= '' then
                string_作弊指令 = string_作弊指令 .. ' ' .. str_args
            end
            G.trig_event('作弊指令', string_作弊指令)
            self:隐藏作弊界面()
        end
    else
        G.SetEditing(self.作弊指令内容)
    end
end

function t:rclick(tar)
    if tar.name == "作弊指令" then
        -- 是右边的输入过的条目
        -- 删除掉右键点击的条目
        table.remove(G.misc().作弊指令列表, tar.c_button.count)
        self:更新作弊指令历史ui()
    end
end

function t:隐藏作弊界面()
    G.SetEditing(nil)
    self.作弊界面.visible = false
end

return t
