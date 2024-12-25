-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.automatically_reload_config = false

-- This is where you actually apply your config choices

--config.default_domain = 'WSL:Debian'
--config.default_prog = { 'pwsh' }
--config.enable_wayland = false
config.front_end = 'WebGpu'
--config.use_ime = true

--config.color_scheme = 'Dark Pastel (Gogh)'
config.color_scheme = 'deep'
--config.color_scheme = 'Konsolas'
--config.color_scheme = 'Oxocarbon Dark (Gogh)'

--config.font = wezterm.font 'Bizin Gothic NF'
--config.font_size = 12.0
--config.initial_rows = 24
--config.initial_cols = 80
local pos_x = 180
local pos_y = 480
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 500
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
--config.hide_tab_bar_if_only_one_tab = true
--config.window_decorations = "RESIZE"

wezterm.on('update-right-status', function(window, pane)
  local res = {}
  local bg_color = "#333333"
  for _, b in ipairs(wezterm.battery_info()) do
    local battery = b.state_of_charge * 100
    if battery < 20 then
      table.insert(res, { Background = { Color = "red" } })
    elseif battery < 30 then
      table.insert(res, { Background = { Color = "darkorange" } })
    else
      table.insert(res, { Background = { Color = "darkgreen" } })
    end
    table.insert(res, { Text = string.format(' %.0f%% ', battery) })
    table.insert(res, { Background = { Color = bg_color } })
  end
  table.insert(res, { Text = wezterm.hostname() })
  table.insert(res, { Text = wezterm.strftime (' %Y-%m-%d(%a) %H:%M:%S')})
  window:set_right_status(wezterm.format(res))
end)
wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  return 'WezTerm'
end)
wezterm.on('gui-startup', function(cmd)
  local main_screen = wezterm.gui.screens().main
  local position = {
    x = pos_x,
    y = main_screen.height - pos_y,
    origin = 'MainScreen',
  }
  cmd = cmd or { position = position }
  wezterm.mux.spawn_window(cmd)
end)

local act = wezterm.action
config.leader = { key = 'q', mods = 'ALT', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = ' ',
    mods = 'CTRL',
    action = act.SendKey {
      key = ' ',
      mods = 'CTRL',
    },
  },
  {
    key = 'r',
    mods = 'LEADER',
    action = act.ReloadConfiguration,
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = act.SpawnTab {
      DomainName = 'local',
    },
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = act.ActivateTabRelative(1),
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = act.ActivateTabRelative(-1),
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitHorizontal {
      domain = 'CurrentPaneDomain'
    },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.SplitVertical {
      domain = 'CurrentPaneDomain'
    },
  },
  {
    key = 'a',
    mods = 'LEADER',
    action = act.PaneSelect,
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'r',
    mods = 'ALT',
    action = act.ReloadConfiguration,
  },
  {
    key = '[',
    mods = 'ALT',
    action = act.ActivateTabRelative(-1),
  },
  {
    key = ']',
    mods = 'ALT',
    action = act.ActivateTabRelative(1),
  },
  --{
  --  key = 't',
  --  mods = 'ALT',
  --  action = act.SpawnCommandInNewTab {
  --    args = { 'C:/Program Files/Git/bin/bash.exe' },
  --  },
  --  action = act.SpawnTab {
  --    DomainName = 'WSL:Debian',
  --  },
  --},
}

-- and finally, return the configuration to wezterm
return config
