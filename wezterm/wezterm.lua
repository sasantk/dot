-- Pull in the wezterm API

local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
wezterm.on('gui-startup', function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- config.disable_default_key_bindings = true

config.keys = {
	-- This will create a new split and run your default program inside it
	{ key = 'F9', mods = 'OPT', action = wezterm.action.ShowTabNavigator },
	{
		key = 'r',
		mods = 'CMD|SHIFT',
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = 'c',
		mods = 'CMD',
		action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
	},
	{ key = 'v',  mods = 'CMD', action = act.PasteFrom 'Clipboard' },
	{
		key = 'd',
		mods = 'CMD',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
	{
		key = 'D',
		mods = 'CMD',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	},

	{ key = 'q', mods = 'CMD',        action = wezterm.action.QuitApplication },
	{ key = '[', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
	{ key = ']', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
	{
		key = 'r',
		mods = 'CMD|CTRL',
    action = act.RotatePanes 'CounterClockwise',
	},
	{
		key = 'R',
		mods = 'CMD|CTRL',
    action = act.RotatePanes 'Clockwise',
	},
	{
		key = 'h',
		mods = 'CMD|CTRL',
		action = act.AdjustPaneSize { 'Left', 5 },
	},
	{
		key = 'l',
		mods = 'CMD|CTRL',
		action = act.AdjustPaneSize { 'Right', 5 },
	},
	{
		key = 'k',
		mods = 'CMD|CTRL',
		action = act.AdjustPaneSize { 'Up', 5 },
	},
	{
		key = 'j',
		mods = 'CMD|CTRL',
		action = act.AdjustPaneSize { 'Down', 5 },
	},
	{
		key = 'h',
		mods = 'CMD',
		action = act.ActivatePaneDirection 'Left',
	},
	{
		key = 'l',
		mods = 'CMD',
		action = act.ActivatePaneDirection 'Right',
	},
	{
		key = 'k',
		mods = 'CMD',
		action = act.ActivatePaneDirection 'Up',
	},
	{
		key = 'j',
		mods = 'CMD',
		action = act.ActivatePaneDirection 'Down',
	},
	{ key = 'x', mods = 'CMD', action = act.CloseCurrentPane { confirm = false } },
	-- Create a new tab in the same domain as the current pane.
	-- This is usually what you want.
	{
		key = 't',
		mods = 'CMD',
		action = act.SpawnTab 'CurrentPaneDomain',
	},
	{ key = 'w', mods = 'CMD', action = act.CloseCurrentTab { confirm = false } },
	-- Create a tab in a named domain
	{
		key = 't',
		mods = 'SHIFT|ALT',
		action = act.SpawnTab {
			DomainName = 'unix',
		},
	},
   {
    key = 'z',
    mods = 'CMD',
    action = wezterm.action.TogglePaneZoomState,
  },
  { key = 's', mods = 'CTRL|CMD', action = act.PaneSelect },
  { key = 'K', mods = 'CMD', action = act.ScrollByPage(-0.5) },
  { key = 'J', mods = 'CMD', action = act.ScrollByPage(0.5) },
}
config.native_macos_fullscreen_mode = true
-- config.use_fancy_tab_bar = true
-- config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.use_dead_keys = false
config.scrollback_lines = 999999999
config.color_scheme = 'Catppuccin Macchiato'
-- config.color_scheme = 'Wryan'
-- config.color_scheme = 'Afterglow'
-- config.color_scheme = 'Dehydration'
config.default_prog = { '/opt/homebrew/bin/bash', '-l' }
-- config.default_prog = { '/opt/homebrew/bin/fish', '-l' }
-- config.default_prog = { '/opt/homebrew/bin/bash'}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.pane_select_font_size=36
-- config.macos_window_background_blur = 20
-- config.window_background_opacity = 0.3
-- config.text_background_opacity = 0.5

-- For example, changing the color scheme:
-- eg : config.color_scheme = 'AdventureTime'
-- and finally, return the configuration to wezterm
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }


config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

config.mouse_bindings = {
  {
      event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },

  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
    {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'CTRL',
    action = act.IncreaseFontSize,
  },

  -- Scrolling down while holding CTRL decreases the font size
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'CTRL',
    action = act.DecreaseFontSize,
  },
}

return config
