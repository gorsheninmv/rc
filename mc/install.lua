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

-- Check if the mc directory exists 
-- If the directory does not exist it will be create it
local home_dir = os.getenv("HOME")
local config_dir = home_dir.."/.config/"
local mc_config_dir = config_dir.."mc/"

local is_ex = exists(config_dir)

if not is_ex then
	os.execute("mkdir "..config_dir)
end

is_ex = exists(mc_config_dir)

if is_ex then
	os.execute("rm -r "..mc_config_dir)
end

local pwd = os.getenv("PWD")
os.execute("ln -s "..pwd.." "..config_dir)

