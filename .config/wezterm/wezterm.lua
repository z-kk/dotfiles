-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

--config.default_domain = 'WSL:Debian'
--config.default_prog = { 'pwsh' }
--config.enable_wayland = false
config.front_end = 'WebGpu'

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

config.keys = {
    --{
    --    key = 't',
    --    mods = 'ALT',
    --    action = wezterm.action.SpawnCommandInNewTab {
    --        args = { 'pwsh.exe' },
    --        cwd = wezterm.home_dir .. "/winhome",
    --    },
    --    action = wezterm.action.SpawnTab {
    --        DomainName = 'WSL:Debian',
    --    },
    --},
}

-- and finally, return the configuration to wezterm
return config
