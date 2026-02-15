local wz = require("wezterm")

local light_scheme = 'Tokyo Night Light (Gogh)'
local dark_scheme = 'Tokyo Night (Gogh)'

local M = {}

wz.on('toggle-color-scheme', function(window)
  local overrides = window:get_config_overrides() or {}
  if overrides.color_scheme == dark_scheme then
    overrides.color_scheme = light_scheme
    wz.log_info("set light")
  else
    overrides.color_scheme = dark_scheme
    wz.log_info("set dark")
  end
  window:set_config_overrides(overrides)
end)

local keys = {
    {
      key = 'o',
      mods = 'LEADER',
      action = wz.action({ EmitEvent = 'toggle-color-scheme' }),
    },
}

M.setup = function (config)
  for i = 1, #keys do
      table.insert(config.keys, keys[i])
  end
end

return M

