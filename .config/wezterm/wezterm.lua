local wezterm = require("wezterm")
local act = wezterm.action

local my_key_bindings = require("stone-key-bindings")
local my_key_table = require("stone-key-tables")
local my_helpers = require("stone-helpers")

-- shows LEADER and active key table in right-side status
wezterm.on("update-right-status", function(window)
  my_helpers.status_info(window)
end)

-- toggle background window opacity
wezterm.on("toggle-opacity", function(window)
  my_helpers.toggle_opacity(window)
end)

-- `wezterm.on` is a function for defining event handlers
-- `on` takes 2 arguments: on("event-name", <call-back function>)
-- `update-right-status` is an event is periodically fired specified by `status_update_interval`
-- value which is defaut 1000 ms
wezterm.on("trigger-me", function(window, pane)
  -- `window:set_right_status` is a method of window that can be used to display content
  --  to the right of the tabs on the tab bar
  window:set_right_status(wezterm.time.now():format("%H:%M:%S"))
end)

--[[      Start of main table     ]]
return {
  command_palette_font_size = 14,
  command_palette_fg_color = "#D8DEE9",
  command_palette_bg_color = "rgba(19, 33, 69, 0.85)",

  -- Dynamically set colors based on system appearance
  colors = my_helpers.scheme_for_appearance(wezterm.gui.get_appearance()),

  --[[ User defined keybindings;
  wezterm default is extensive and will likely clash with interactive terminal
  programs like helix & vim. ]]
  keys = my_key_bindings,

  -- from "stone-key-tables.lua":
  -- contains tables for copy_mode, search_mode, split, resize, activate_pane
  key_tables = my_key_table,

  -- Disable wezterm default keybindings
  disable_default_key_bindings = true,
  -- Activate LEADER
  leader = { key = "phys:Space", mods = "CTRL", timeout_milliseconds = 1500 },
  -- Built-in colour scheme can be selected via:
  -- color_scheme = "nightfox",
  -- note: color_scheme takes precidence over colors = {}

  -- this is the default
  status_update_interval = 1000,
  -- if this is not set this there is an annoying behaviour that
  -- changing text size affects windows size
  adjust_window_size_when_changing_font_size = false,
  -- Terminal font size
  font_size = 14.0,
  -- Terminal line height
  line_height = 1.0,
  -- if window_background_opacity = 1.0 on macos there is a weird rendering issue
  window_background_opacity = 0.9,
  -- debug_key_events = true,

  exit_behavior = "Hold",
  -- set this to empty to remove default
  -- i'd rather be asked to confirm before closing
  skip_close_confirmation_for_processes_named = {},
  -- Options: 2, 2.0, "2px" (pixels) || "2pt" (DPI Scaling) || others you won't use
  cursor_thickness = 2,
  underline_thickness = 2,
  -- Options: SteadyBlock (default), BlinkingBlock, SteadyUnderline
  --  BlinkingUnderline, SteadyBar, BlinkingBar
  default_cursor_style = "BlinkingBlock",
  -- Blink rate in ms
  cursor_blink_rate = 800,
  -- Options of easing functions: Linear, Constant,
  --  Ease, EaseIn, EaseOut, EaseInOut
  --  CubicBezier e.g. `cursor_blink_ease_in = {CubicBezier={0.0, 0.0, 0.58, 1.0}}`
  cursor_blink_ease_in = "Linear",
  cursor_blink_ease_out = "Linear",
  -- used to adjust the "smoothness" blinking animations (effects power consumption)
  -- animation_fps = 10,

  -- Fancy Styling for tab bar (button-like tabs)
  -- Default is true
  use_fancy_tab_bar = false,
  -- Max width that a tab name can consume
  -- Only applicable when using retro tab bar (ignored with fancy tab bar)
  tab_max_width = 30,
  -- default is false
  -- tab_bar_at_bottom = false,

  -- Initial size of new window
  initial_rows = 50,
  initial_cols = 120,
  -- Number of scrollback lines to keep in the buffer
  scrollback_lines = 3500,
  -- Show scroll bar in window (default is false)
  -- enable_scroll_bar = true,

  -- Default: true
  -- hide_mouse_cursor_when_typing = false,

  -- Default
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },
  window_decorations = "RESIZE",
  window_frame = {
    -- Tab bar font size
    font_size = 14,
    -- The overall background color of the tab bar when:
    -- window is focused
    active_titlebar_bg = "#0C1426",
    -- window is not focused
    inactive_titlebar_bg = "#232323",
    -- note: only applicable when `use_fancy_tab_bar = true`

    border_left_width = "2",
    border_right_width = "2",
    border_bottom_height = "2",
    border_top_height = "2",
    border_left_color = "#abb2bf",
    border_right_color = "#abb2bf",
    border_bottom_color = "#abb2bf",
    border_top_color = "#abb2bf",
  },
  window_padding = { left = 4, right = 4, top = 0, bottom = 0 },

  -- User defined launcher menu entires
  launch_menu = {
    -- {
    --   label = "Split Pane Right",
    --   args = {  },
    -- },
  },
}
