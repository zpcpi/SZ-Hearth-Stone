local os_time = os.time
local json  = require "cjson.c"
local MP = {}

function MP.tostring(root)
    if root == nil then
        return "nil"
    elseif type(root) == "number" then
        return tostring(root)
    elseif type(root) == "string" then
        return root
    end

    local line = "".."\n{\n"
    local function is_str(s)
        if type(s) == "string" then
            return "\"" .. s .. "\""
        end
        return s
    end
    local function define_print(_tab,str)
        str = str .. "    "
        for k,v in pairs(_tab) do
            if type(v) == "table" then
                line = line .. str.. is_str(k) .." = {".."\n"
                define_print(v,str)
                line = line .. str.."}" .."\n"
            else
                line = line .. str .. tostring(is_str(k)) .. " = " .. tostring(is_str(v)) .. "\n"
            end
        end
    end
    define_print(root," ")
    line = line.."}\n"
    print(line)
    -- return line.."}\n"
end

function MP.create(http_post, userid, errorLog, attr)
	MP.created = 1
	MP.cb_list = MP.cb_list or {}
	MP.next_time = 0
	MP.http_post = http_post
	MP.pusher_method = 'PusherService.GetPush'
	MP.pusher_params = {
		userid = tostring(userid),
		channel = tostring(userid),
		version = 0,
		waitsec = 0, 			--权宜之计 后面要改成10s或更长
		attrib = {
			create_time = attr.create_time,
			level = attr.level,
			zone = tostring(attr.zone),
			server = tostring(attr.server)
		}
	}
	MP.post_lock = false
	MP.pusher_version = 0
	MP.errorLog = errorLog
end

function MP.register_cb(type, cb)
	if not MP.cb_list then
		MP.cb_list = {}
	end
	MP.cb_list[type] = cb
end

function MP.lock_post()
	MP.post_lock = true
end

function MP.unlock_post()
	MP.post_lock = false
end

function MP.check_lock()
	return not MP.post_lock
end

function MP.dispatch(msg)
	if msg and msg.msgs then
		for i=1, #msg.msgs do
			if msg.msgs[i].version > MP.pusher_version then
				MP.pusher_version = msg.msgs[i].version
				MP.pusher_params.version = MP.pusher_version
			end
			local cb = MP.cb_list[msg.msgs[i].type]
			-- print(MP.tostring(json.decode(msg.msgs[i].value)))
			if cb then
				local ok, message= pcall(cb, json.decode(msg.msgs[i].value))
				if not ok then
					MP.errorLog('execu callback error', msg.msgs[i].type, message)
				end
			else
				MP.errorLog('no callback for msg', msg.msgs[i].type, msg.msgs[i].value)
			end
		end
	end 
	MP.unlock_post()
end

function MP.update()
	if os_time() > MP.next_time and MP.check_lock() then
		MP.next_time = os_time() + 10
		MP.lock_post()
		MP.http_post(MP.pusher_method, MP.pusher_params, MP.dispatch)
	end
	
	--简单的超时处理
	if os_time() - MP.next_time > 60 then
		MP.unlock_post()
	end
end

return MP

