local GF = require('gfbase')
function GF.show_table(t, ofs,boolean_hideinst)
	local print_r_cache={}
	local str
    local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			str = indent.."*"..tostring(t)
			GF.common_print(str, ofs)
		else
            print_r_cache[tostring(t)]=true
			if (GF.IsTable(t)) and ((boolean_hideinst and t['root'] == nil) or boolean_hideinst ~= true) then
				local tempt = {}
				for pos,val in pairs(t) do
					table.insert(tempt,{pos,val})
				end
				local comp = function(a,b)
					return tostring(a[1]) < tostring(b[1])
				end
				table.sort(tempt,comp)
				for k,v in ipairs(tempt) do
					local pos,val = v[1] or '',v[2] or ''
					if pos ~= '拥有者' then
						if type(pos) == 'string' then 
							pos = '\'' .. pos .. '\''
						end
						if (GF.IsTable(val)) then
							if (print_r_cache[tostring(val)]) then
								str = indent.."["..tostring(pos).."] => *"..tostring(val)
								GF.common_print(str, ofs)
							else
								str = indent.."["..tostring(pos).."] => "..tostring(val).." {"
								GF.common_print(str, ofs)
								sub_print_r(val,indent..string.rep(" ",string.len(tostring(pos))+8))
								str = indent..string.rep(" ",string.len(tostring(pos))+6).."}"
								GF.common_print(str, ofs)
							end
						elseif (type(val)=="string") then
							str = indent.."["..tostring(pos)..'] => "'..val..'"'
							GF.common_print(str, ofs)
						else
							str = indent.."["..tostring(pos).."] => "..tostring(val)
							GF.common_print(str, ofs)
						end
					end
                end
			else
				str = indent..tostring(t)
                GF.common_print(str, ofs)
            end
        end
    end
	if GF.IsTable(t) then
		str = tostring(t).." {"
        GF.common_print(str, ofs)
		sub_print_r(t,"  ")
		str = "}"
        GF.common_print(str, ofs)
    else
        sub_print_r(t,"  ")
	end
	GF.common_print('', ofs)
end