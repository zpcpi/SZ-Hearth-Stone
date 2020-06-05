local GF = require('gfbase')

function GF.InitSteamDll()
    do return end
    print('--== InitSteamDll')
    local steamDll = GF.open_dll('SteamDllHearthStone')
    local initFunc = GF.procaddress(steamDll, 'SDHS_Init', 0)
    initFunc()
end
