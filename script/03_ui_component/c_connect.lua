--[[3007

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.ipAddressText = self.obj.getChildByName('IPAddress')
    self.connectStatusText = self.obj.getChildByName('ConnectStatus')
    self.connectBtn = self.obj.getChildByName('Connect')
    self.cancelBtn = self.obj.getChildByName('Cancel')
    self.cancelConnectBtn = self.obj.getChildByName('CancelConnect')

    self.connectStatusText.visible = false
    self.cancelConnectBtn.visible = false
end

function t:click(tar)
    if tar == self.connectBtn then 
        self.ipAddressText.visible = false
        self.connectBtn.visible = false
        self.cancelBtn.visible = false

        self.connectStatusText.visible = true
        self.cancelConnectBtn.visible = true
        G.call('客机_连接主机', self.ipAddressText.text)
    elseif tar == self.cancelBtn then 
        G.removeUI('v_connect')
    elseif tar == self.cancelConnectBtn then 
        self.ipAddressText.visible = true
        self.connectBtn.visible = true
        self.cancelBtn.visible = true

        self.connectStatusText.visible = false
        self.cancelConnectBtn.visible = false
    end
end

function t:ShowInfo(info)
    self.connectStatusText.text = tostring(info)
end

return t