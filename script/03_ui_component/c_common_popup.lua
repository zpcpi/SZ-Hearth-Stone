--[[3016

]]

local G = require "gf"
local t = G.com()

function t:init()
    if G.is_editor then 
        return
    end
    self.contentText = self.obj.getChildByName('Text')
    self.confirmCallbackFarg = nil
    self.confirmButton = self.obj.getChildByName('ConfirmButton')
    self.cancelButton = self.obj.getChildByName('CancelButton')
end

function t:setData(string_提示内容, farg_确认回调)
    self.contentText.text = tostring(string_提示内容)
    self.confirmCallbackFarg = farg_确认回调
end

function t:click(tar)
    if tar == self.confirmButton then 
        if type(self.confirmCallbackFarg) == 'table' then 
            G.start_program(self.confirmCallbackFarg)
        end 
        G.removeUI('v_common_popup')
    elseif tar == self.cancelButton then 
        G.removeUI('v_common_popup')
    end
end

return t