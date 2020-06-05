local GF = require('gfbase')
local STEAM_VER = false

function GF.InitSteamDll()
    if not STEAM_VER then 
        return
    end
    print('--== Load SteamDllHearthStone')
    GF.steamDll = GF.open_dll('SteamDllHearthStone')

    print('--== SDHS_Init')
    local initFunc = GF.procaddress(GF.steamDll, 'SDHS_Init', 0)
    initFunc()
end

function GF.CreateLobby()
    if not STEAM_VER then 
        return
    end
    print('--== SDHS_CreateLobby')
    local createLobbyFunc = GF.procaddress(GF.steamDll, 'SDHS_CreateLobby', 0)
    createLobbyFunc()

    print('--== SDHS_SetCreateLobbyCallback')
    local setCreateLobbyCallbackFunc = GF.procaddress(GF.steamDll, 'SDHS_SetCreateLobbyCallback', 0)
    setCreateLobbyCallbackFunc(function() print('True') end, function() print('False') end)
end