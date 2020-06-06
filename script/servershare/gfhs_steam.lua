local GF = require('gfbase')
local STEAM_VER = true

function GF.InitSteamDll()
    if not STEAM_VER then 
        return
    end
    print('--== InitSteamDll')
    if GF.Steam_Init then
        GF.Steam_Init()
        print('--== InitSteamDll Complete')
    else
        print('--== Cannot find steam interface, may be GApp version wrong')
    end
end
