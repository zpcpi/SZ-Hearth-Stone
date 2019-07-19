--[[3004

]]

local G = require "gf"
local t = G.com()

function t:init()
    self.hostPort = self.obj.getChildByName('HostPort').getChildByName('text')
    self.connectIP = self.obj.getChildByName('ConnectIP').getChildByName('text')
    self.connectPort = self.obj.getChildByName('ConnectPort').getChildByName('text')

    self.hostButton = self.obj.getChildByName('HostButton')
    self.connectButton = self.obj.getChildByName('ConnectButton')

    self.selfIPText = self.obj.getChildByName('SelfIP')

    self.chat = self.obj.getChildByName('Chat').getChildByName('text')
    self.chatButton = self.obj.getChildByName('ChatButton')
end

function t:click(tar)
    if tar == self.chatButton then 
        G.call('Net_SendMsg', self.chat.text)
    elseif tar == self.hostButton then 
        G.start_program('Net_CreateHost', self.hostPort.text)
    elseif tar == self.connectButton then 
        G.start_program('Net_TryConnectHost', self.connectIP.text, self.connectPort.text)
    end
end

return t