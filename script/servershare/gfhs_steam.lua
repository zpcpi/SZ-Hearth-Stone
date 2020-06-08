local GF = require('gfbase')
local STEAM_VER = true

function GF.InitSteamDll()
    if not STEAM_VER then 
        return
    end
    print('--== InitSteamDll')
    if GF.Steam_Init then
        GF.Steam_Init()
        local steamCallback = {
            OnLobbyCreated = GF.OnLobbyCreated,
            OnLobbyPersonaStateChange = GF.OnLobbyPersonaStateChange,
            OnLobbyDataUpdate = GF.OnLobbyDataUpdate,
            OnLobbyChatUpdate = GF.OnLobbyChatUpdate,
        }
        GF.Steam_SetLobbyCallback(steamCallback)
        print('--== InitSteamDll Complete')
    else
        print('--== Cannot find steam interface, may be GApp version wrong')
    end
end

function GF.OnLobbyCreated(steamLobbyID, result)
    print('[OnLobbyCreated]', steamLobbyID, result)
end

function GF.OnLobbyPersonaStateChange(steamID, changeFlag)
    print('[OnLobbyPersonaStateChange]', steamID, changeFlag)
end

function GF.OnLobbyDataUpdate(steamLobbyID, steamID, isSuccess)
    print('[OnLobbyDataUpdate]', steamLobbyID, steamID, isSuccess)
end

function GF.OnLobbyChatUpdate(steamLobbyID, steamIDUserChanged, steamIDMakingChange, chatMemberStateChange)
    print('[OnLobbyChatUpdate]', steamLobbyID, steamIDUserChanged, steamIDMakingChange, chatMemberStateChange)
end