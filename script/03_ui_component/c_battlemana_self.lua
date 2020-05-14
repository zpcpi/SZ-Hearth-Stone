--[[300d

]]

local G = require "gf"
local t = G.com()

t.prop = 
{
	{name = '最大值', type = 'int', ctrl = 'dragint'},
	{name = '当前值', type = 'int', ctrl = 'dragint'},
	{name = '锁定值', type = 'int', ctrl = 'dragint'},
	{name = '下回锁定值', type = 'int', ctrl = 'dragint'},
	{name = '预览值', type = 'int', ctrl = 'dragint'},
	{name = '预览锁定值', type = 'int', ctrl = 'dragint'},
}

function t:init()
    self.功能区 = self.obj.getChildByName('功能区')
    self.布局点 = self.功能区.getChildByName('布局点')
    self.水晶模板 = self.布局点.getChildByName('水晶模板')
    self.法力值数值 = self.功能区.getChildByName('法力值数值')

    self.水晶list = {}
    self.水晶list_next = {}

    self.水晶_startx = self.水晶模板.x
    self.水晶_starty = self.水晶模板.y
    self.水晶_px = self.水晶模板.width * 0.075 + 4
    self.水晶_py = self.水晶模板.height * 0.075 + 8

    self.等待计算 = false

    if G.is_editor then
    else
        self:水晶_init()

        self.set_最大值 = function(com, old_value) com:need_flash('最大值', old_value) end
        self.set_当前值 = function(com, old_value) com:need_flash('当前值', old_value) end
        self.set_锁定值 = function(com, old_value) com:need_flash('锁定值', old_value) end
        self.set_下回锁定值 = function(com, old_value) com:need_flash('下回锁定值', old_value) end
        self.set_预览值 = function(com, old_value) com:need_flash('预览值', old_value) end
        self.set_预览锁定值 = function(com, old_value) com:need_flash('预览锁定值', old_value) end
    end
end

function t:水晶_init()
    for i = 1, 10, 1 do
        local 水晶obj = G.Clone(self.水晶模板)
        -- 水晶obj.visible = true
        self.水晶list[i] = 水晶obj
        self.布局点.addChild(水晶obj)

        水晶obj.x = self.水晶_startx + (i - 1) * self.水晶_px

        -- 锁定水晶
        水晶obj = G.Clone(self.水晶模板)
        -- 水晶obj.visible = true
        self.水晶list_next[i] = 水晶obj
        self.布局点.addChild(水晶obj)
        水晶obj.x = self.水晶_startx + (i - 1) * self.水晶_px
        水晶obj.y = self.水晶_starty - self.水晶_py
    end
end

function t:水晶值计算()
    -- FIXME: 临时实现
    self.最大值 = G.call('角色_获取水晶数据', '我方', '最大值')
    self.当前值 = G.call('角色_获取水晶数据', '我方', '当前值')

    local 最大值 = self.最大值 or 0
    local 当前值 = self.当前值 or 0
    local 锁定值 = self.锁定值 or 0
    local 隐藏值 = 0
    local 临时值 = 0
    local 已用值 = 0
    local 预览值 = self.预览值 or 0
    local 下回锁定值 = self.下回锁定值 or 0
    local 预览锁定值 = self.预览锁定值 or 0
    local 下回剩余值 = 0

    -- 当前值 预览值 已用值 锁定值 临时值
    --               预览锁定值 下回锁定值

    -- 当前锁定值不会大于最大值
    if 锁定值 > 最大值 then
        锁定值 = 最大值
    end

    -- 优先保证锁定值不变
    if (当前值 + 锁定值) > MANA_MAX_COUNT then
        隐藏值 = 当前值 + 锁定值 - MANA_MAX_COUNT
        当前值 = MANA_MAX_COUNT - 锁定值
    end

    if (当前值 + 锁定值) > 最大值 then
        -- 说明得到了临时值
        临时值 = 当前值 + 锁定值 - 最大值
        当前值 = 当前值 - 临时值
    else
        已用值 = 最大值 - 当前值 - 锁定值
    end

    if 预览值 <= (self.当前值 or 0) then
        -- 说明法力值还有剩
    else
        预览值 = (self.当前值 or 0)
    end

    -- 扣除多余被隐藏的水晶
    预览值 = 预览值 - 隐藏值
    if 预览值 < 0 then
        预览值 = 0
    end
    if 预览值 <= 临时值 then
        -- 在临时值里面扣
        临时值 = 临时值 - 预览值
    else
        -- 在总和里面扣
        当前值 = 当前值 + 临时值 - 预览值
        临时值 = 0
    end

    if 下回锁定值 > (最大值 + 1) then
        下回锁定值 = 最大值 + 1
    end

    if 下回锁定值 > MANA_MAX_COUNT then
        下回锁定值 = MANA_MAX_COUNT
    end

    if (预览锁定值 + 下回锁定值) > MANA_MAX_COUNT then
        预览锁定值 = MANA_MAX_COUNT - 下回锁定值
    end

    下回剩余值 = 最大值 + 1 - 下回锁定值 - 预览锁定值
    if (下回剩余值 + 下回锁定值 + 预览锁定值) > MANA_MAX_COUNT then
        下回剩余值 = MANA_MAX_COUNT - 下回锁定值 - 预览锁定值
    end

    return 当前值, 预览值, 已用值, 锁定值, 临时值, 下回剩余值, 预览锁定值, 下回锁定值
end

function t:水晶状态计算()
    local 当前值, 预览值, 已用值, 锁定值, 临时值, 下回剩余值, 预览锁定值, 下回锁定值 = self:水晶值计算()

    local 水晶state = {}
    local 水晶state_next = {}

    -- 当前回合的
    for i = 1, 当前值, 1 do
        水晶state[i] = '正常'
    end
    for i = 1, 已用值, 1 do
        table.insert(水晶state, '已用')
    end
    for i = 1, 锁定值, 1 do
        table.insert(水晶state, '锁定')
    end
    for i = 1, 临时值, 1 do
        table.insert(水晶state, '正常')
    end
    if 临时值 > 0 then
        for i = 1, 预览值, 1 do
            -- 插入到最后面
            table.insert(水晶state, '预览')
        end
    else
        for i = 1, 预览值, 1 do
            -- 插入到最后面
            table.insert(水晶state, (当前值 + 1), '预览')
        end
    end
    for i = (#水晶state + 1), MANA_MAX_COUNT, 1 do
        水晶state[i] = '隐藏'
    end

    -- 下一回合的
    for i = 1, 下回剩余值, 1 do
        水晶state_next[i] = '隐藏'
    end
    for i = (下回剩余值 + 1), (下回剩余值 + 预览锁定值), 1 do
        水晶state_next[i] = '预览锁定'
    end
    for i = (下回剩余值 + 预览锁定值 + 1), (下回剩余值 + 预览锁定值 + 下回锁定值), 1 do
        水晶state_next[i] = '锁定'
    end
    for i = (下回剩余值 + 预览锁定值 + 下回锁定值 + 1), MANA_MAX_COUNT, 1 do
        水晶state_next[i] = '隐藏'
    end

    return 水晶state, 水晶state_next
end

function t:need_flash(attr, old_value)
    -- FIXME: 临时改为全局脏标记
    -- self.等待计算 = true
    G.manaDirtyFlag = true
end

function t:update()
    -- FIXME: 临时改为全局脏标记
    -- if self.等待计算 == true then
    --     self.等待计算 = false
    if G.manaDirtyFlag then
        G.manaDirtyFlag = false

        local 水晶state, 水晶state_next = self:水晶状态计算()
        local ui_item

        -- 水晶显示设置
        for i, state in ipairs(水晶state) do
            ui_item = self.水晶list[i]
            if state == '正常' then
                ui_item.visible = true
                ui_item.alpha = 255
                ui_item.img = 0x560b0001
            elseif state == '隐藏' then
                ui_item.visible = false
            elseif state == '已用' then
                ui_item.visible = true
                ui_item.alpha = 120
                ui_item.img = 0x560b0001
            elseif state == '锁定' then
                ui_item.visible = true
                ui_item.alpha = 255
                ui_item.img = 0x560b000c
            elseif state == '预览' then
                ui_item.visible = true
                ui_item.alpha = 255
                ui_item.img = 0x560b000f
            end
        end

        for i, state in ipairs(水晶state_next) do
            ui_item = self.水晶list_next[i]

            if state == '隐藏' then
                ui_item.visible = false
            elseif state == '锁定' then
                ui_item.visible = true
                ui_item.img = 0x560b000c
            elseif state == '预览锁定' then
                ui_item.visible = true
                ui_item.img = 0x560b000e
            end
        end

        -- 文本显示设置
        self.法力值数值.text = math.floor(self.当前值 or 0) .. '/' .. math.floor(self.最大值 or 0)
    end
end


return t