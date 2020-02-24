--[[401f

]]
local G = require "gf"
local L = {}
local t = G.api

--type=debug
--hide=true
--private=false
t['profile_start'] = function ()
    -- 这一套只能用于一个 thread，目前架构不是很实用，换下面的实现方式 start_profile
    if not G.isOnProfiling then
        if G.profileData == nil then
            G.profileData = {} 
        end
        G.isOnProfiling = true
        print ('profile : start!')
        if G.profiler == nil then
            G.profiler = require "gfprofile"
        end
        G.profiler:onStart()
    else
        G.isOnProfiling = false
        if G.profiler then
            G.profiler:onStop()
            print ('profile : end!')
        else
            print ('profile : failed!')
        end
    end
end

--type=debug
--hide=true
--private=false
t['profile_end'] = function ()
    -- 写文件
    if G.profileData then
        local pData = {}
        for funcName, funcData in pairs(G.profileData) do
            funcData.func_name = funcName
            table.insert(pData, funcData)
        end
        table.sort(pData, function(a, b)
            return a.total_time > b.total_time
        end)
 
        local file = io.open('HearthStoneProfile.csv', 'w')
        local title = string.format('TotalTime,AverageTime,CallCount,Module,Function\n')
        file:write(title)
        for _, report in ipairs(pData) do
            -- calculate percent
            if report.call_count > 0 then
                local avgtime = report.total_time * 1.0 / report.call_count
                local info = string.format("%0.3f,%0.3f,%d,%s\n", report.total_time, avgtime, report.call_count, report.func_name)
                file:write(info)
            end
        end
        file:close()
        print('profile_end write over')
    else
        print ('please call `profile_begin` first!')
    end
    -- END 
    G.profileData = nil
end