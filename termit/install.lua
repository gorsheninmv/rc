-- Check if a faile or directory exists in this path
function exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end


--[[Directories]]--
local home_dir = os.getenv("HOME")
local config_dir = home_dir.."/.config/"
local termit_config_dir = config_dir.."termit/"
--[[---]]--


--[[.config]]--
local is_ex = exists(config_dir)

if not is_ex then
	os.execute("mkdir "..config_dir)
end
--[[---]]--


--[[termit]]--
local err

is_ex, err = exists(termit_config_dir)
if err == "Not a directory" then
	print ("Force exit!")
	do return end
end

if is_ex then
	os.execute("rm -r "..termit_config_dir)
end
[[---]]--


--[[Create symlink]]--
local pwd = os.getenv("PWD")
os.execute("ln -s "..pwd.." "..config_dir)
--[[---]]--


--[[Delete global colormaps file]]--
print("Delete global colormaps file? (y/n)")
local r = io.read()

if r == "y" then
	os.execute("sudo rm /etc/xdg/colormaps.lua")
end
--[[---]]--

print(Script Completed!)
