local wz = require("wezterm")

local config = wz.config_builder()
config.font = wz.font("FiraCode Nerd Font Mono", { weight = "DemiBold" })
config.font_size = 11
config.color_scheme = "Tokyo Night Light (Gogh)"
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.keys = {
  {
    key = "|",
    mods = "LEADER|SHIFT",
    action = wz.action.SplitHorizontal { },
  },
  {
    key = "-",
    mods = "LEADER",
    action = wz.action.SplitVertical { },
  },
  {
    key = "x",
    mods = "LEADER",
    action = wz.action.CloseCurrentPane { confirm = true },
  },
  {
    key = "h",
    mods = "LEADER",
    action = wz.action.ActivatePaneDirection "Left",
  },
  {
    key = "l",
    mods = "LEADER",
    action = wz.action.ActivatePaneDirection "Right",
  },
  {
    key = "k",
    mods = "LEADER",
    action = wz.action.ActivatePaneDirection "Up",
  },
  {
    key = "j",
    mods = "LEADER",
    action = wz.action.ActivatePaneDirection "Down",
  },
  {
    key = "e",
    mods = "LEADER",
    action = wz.action.PromptInputLine {
      description = "Enter new name for tab",
      action = wz.action_callback(function(window, _, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  { key = "t",
    mods = "LEADER",
    action = wz.action.ShowTabNavigator
  },
  {
    key = "c",
    mods = "LEADER",
    action = wz.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = 'm',
    mods = 'LEADER',
    action = wz.action.ShowLauncher
  },
}

require('theme').setup(config)

local tabline = wz.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    theme = 'GruvboxDark',
    tabs_enabled = true,
  },
  sections = {
    tab_active = {},
    tab_inactive = {},
  },

})
tabline.apply_to_config(config)

return config

