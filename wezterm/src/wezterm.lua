local wz = require("wezterm")

local config = wz.config_builder()
config.font = wz.font("FiraCode Nerd Font Mono", { weight = "DemiBold" })
config.font_size = 11
config.color_scheme = "Tokyo Night Light (Gogh)"
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.unix_domains = {
  {
    name = 'unix',
  },
}
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
    key = 'K',
    mods = 'SHIFT|ALT',
    action = wz.action.Multiple{
    	wz.action.MoveTabRelative(-1),
	wz.action.ShowTabNavigator,
    },
  },
  {
    key = 'J',
    mods = 'SHIFT|ALT',
    action = wz.action.Multiple{
    	wz.action.MoveTabRelative(1),
	wz.action.ShowTabNavigator,
    },
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
    action = wz.action.ShowTabNavigator,
  },
  {
    key = "c",
    mods = "LEADER",
    action = wz.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "m",
    mods = "LEADER",
    action = wz.action.ShowLauncher
  },
  {
    key = "a",
    mods = "LEADER",
    action = wz.action.AttachDomain 'unix',
  },
  {
    key = "d",
    mods = "LEADER",
    action = wz.action.DetachDomain { DomainName = "unix" },
  },
  {
    key = "$",
    mods = "LEADER|SHIFT",
    action = wz.action.PromptInputLine {
      description = "Enter new name for session",
      action = wz.action_callback(
        function(window, _, line)
          if line then
            wz.mux.rename_workspace(
              window:mux_window():get_workspace(),
              line
            )
          end
        end
      ),
    },
  },
  {
    key = "S",
    mods = "LEADER",
    action = wz.action.ShowLauncherArgs { flags = "WORKSPACES" },
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


local workspace_switcher = wz.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
-- workspace_switcher.apply_to_config(config)


return config

