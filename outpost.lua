module("outpost", package.seeall)


-- Outpost Combat System - (Lusternia).
-- Project Start Date: 20th September 2020.

-- Core System Module


function LoadModules()
	local path = package.path
	local cpath = package.cpath
	local homedir = getMudletHomeDir()
	local luadir = string.format("%s/%s", homedir, [[?.lua]])
	local initdir = string.format("%s/%s", homedir, [[?/init.lua]])
	local sysdir = string.format("%s/%s", "/home/synectic/src/outpost", [[?.lua]])
        
	package.path = string.format("%s;%s;%s;%s", path, luadir, initdir, sysdir)
	package.cpath = string.format("%s;%s;%s;%s", cpath, luadir, initdir, sysdir)

	local m = SYSROOT_DEFINED and { 
		"aegis",
		"affs", 
		"bals", 
		--"bash",
		"beast", 
		"core", 
		--"dbg",
		"EMCO",
		"fs", 
		"genrun", 
		"GMCP", 
		"pve", 
		"pvp", 
		--"qm", 
		"timer", 
		"ui" 
	} or nil

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

		echo("\nModule '"..n.."' loaded.")
	end

	package.path = path
	package.cpath = cpath

	raiseEvent("outpost done loading")
end

LoadModules()
