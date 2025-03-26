local wz = require("wezterm")

local config = wz.config_builder()
config.font = wz.font("FiraCode Nerd Font Mono")
config.font_size = 11
config.color_scheme = "PaperColorLight (Gogh)"
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
      action = wz.action_callback(function(window, pane, line)
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
    key = "x",
    mods = "LEADER",
    action = wz.action.CloseCurrentTab { confirm = true },
  },
  { 
    key = 'm',
    mods = 'LEADER',
    action = wz.action.ShowLauncher
  },
  { 
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wz.action.ActivateTabRelative(-1),
  },
  { 
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wz.action.ActivateTabRelative(1),
  },
}

for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = wz.action.ActivateTab(i - 1),
  })
end

if wz.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
end

local bar = wz.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)

return config

