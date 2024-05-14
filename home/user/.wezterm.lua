local wezterm = require 'wezterm'
local config = wezterm.config_builder()
-- BEGIN

config.bold_brightens_ansi_colors = "No"
config.pane_focus_follows_mouse = true
config.font = wezterm.font { family = "Source Code Pro" }
config.use_fancy_tab_bar = false

local palette = {
  ansi = {
    blackish = "#424242",
    reddish = "#b85c57",
    greenish = "#57864e",
    brownish = "#8f7634",
    blueish = "#2a8dc5",
    purpleish = "#8888c7",
    tealish = "#6aa7a8",
    greyish = "#999957",
  },
  brights = {
    blackish = "#b7b19c",
    reddish = "#f2acaa",
    greenish = "#98ce8f",
    brownish = "#eeeea7",
    blueish = "#a6dcf8",
    purpleish = "#d0d0f7",
    tealish = "#b0eced",
    greyish = "#ffffec",
  },
}

config.colors = {
  ansi = {
    palette.ansi.blackish,
    palette.ansi.reddish,
    palette.ansi.greenish,
    palette.ansi.brownish,
    palette.ansi.blueish,
    palette.ansi.purpleish,
    palette.ansi.tealish,
    palette.ansi.greyish,
  },
  brights = {
    palette.brights.blackish,
    palette.brights.reddish,
    palette.brights.greenish,
    palette.brights.brownish,
    palette.brights.blueish,
    palette.brights.purpleish,
    palette.brights.tealish,
    palette.brights.greyish,
  },

  foreground = palette.ansi.blackish,
  background = palette.brights.greyish,

  cursor_bg = palette.ansi.brownish,
  cursor_fg = palette.brights.greyish,

  selection_fg = palette.ansi.greyish,
  selection_bg = palette.ansi.blackish,

  scrollbar_thumb = palette.ansi.tealish,
  split = palette.brights.greenish,

  indexed = {
    [187] = "#eaebdb",
    [193] = "#effeec",
    [194] = "#eefeff",
    [195] = "#e2f1f8",
    [238] = "#424242",
  },

  compose_cursor = palette.brights.brownish,

  copy_mode_active_highlight_bg = { Color = palette.brights.brownish },
  copy_mode_active_highlight_fg = { Color = palette.ansi.blackish },
  copy_mode_inactive_highlight_bg = { Color = palette.brights.brownish },
  copy_mode_inactive_highlight_fg = { Color = palette.ansi.blackish },

  quick_select_label_bg = { Color = palette.brights.blueish },
  quick_select_label_fg = { Color = palette.ansi.blackish },
  quick_select_match_bg = { Color = palette.brights.purpleish },
  quick_select_match_fg = { Color = palette.ansi.blackish },

  -- tab bar
  tab_bar = {
    background = palette.brights.tealish,
    active_tab = {
      bg_color = palette.ansi.purpleish,
      fg_color = palette.brights.greyish,
    },
    inactive_tab = {
      bg_color = palette.brights.tealish,
      fg_color = palette.ansi.blackish,
      intensity = 'Half',
    },
    inactive_tab_hover = {
      bg_color = palette.brights.blueish,
      fg_color = palette.ansi.blackish,
    },
    new_tab = {
      bg_color = palette.brights.blueish,
      fg_color = palette.ansi.blackish,
    },
    new_tab_hover = {
      bg_color = palette.brights.blueish,
      fg_color = palette.ansi.blackish,
    },
  },
}

config.default_prog = { '/usr/bin/zsh', '-l' }

config.launch_menu = {
  {
    label = 'shell',
    args = { 'zsh', '-l' },
  },
  {
    args = { 'htop' },
  },
  {
    label = 'edit config',
    args = { 'nvim', '.wezterm.lua', },
    cwd = os.getenv("HOME"),
  },
}

config.leader = { key = 'g', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}



-- END
return config
