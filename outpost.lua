local outpost = {}


-- Outpost Combat System - (Lusternia).
-- Project Start Date: 20th September 2020.

-- Core System Module


function LoadModules()
	local path = package.path
	local cpath = package.cpath
	local homedir = getMudletHomeDir()
	local luadir = string.format("%s/%s", homedir, [[?.lua]])
	local initdir = string.format("%s/%s", homedir, [[?/init.lua]])
	local sysdir = string.format("%s/%s", homedir.."/Outpost/Outpost-master", [[?.lua]])
        
	package.path = string.format("%s;%s;%s;%s", path, luadir, initdir, sysdir)
	package.cpath = string.format("%s;%s;%s;%s", cpath, luadir, initdir, sysdir)

	local m = SYSROOT_DEFINED and { 
		"aegis",
		"affs", 
		"bals", 
		--"bash",
		"beast", 
		"can",
		"chyron", 
		--"dbg",
		"defs",
		"EMCO",
		"fs", 
		"genrun", 
		"GMCP",
		"map",
		"ndb",
		"pve", 
		"pvp", 
		"qm", 
		"timer", 
		"ui",
		"utils"
	} or nil

	if not m then e:error("Fatal error: SYSROOT_DEFINED is nil. You should never see this!") return end

	for _, n in ipairs(m) do
		_G[n] = nil
		package.loaded[n] = nil
	end

	for _, n in ipairs(m) do
		local s, c = pcall(require, n)
		if not s then 
			display(c)
			debugc("Failed to load module: "..n..".lua.")
		end
		
		_G[n] = c

		e:echo("Module '"..n.."' loaded.")
	end

	package.path = path
	package.cpath = cpath

	raiseEvent("outpost done loading")
end


-- Check for package installation via sysInstallPackage

function outpost.outpostInstalled(_, fn)
	if fn == "outpost-test" then
		LoadModules()
	end
end


LoadModules()

return outpost