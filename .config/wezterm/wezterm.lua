local wezterm = require("wezterm")
local act = wezterm.action

local my_key_bindings = require("stone-key-bindings")
local my_key_tables = require("stone-key-tables")
local my_helpers = require("stone-helpers")

-- Display "LEADER" and "<active key table>" in right-side status
wezterm.on("update-right-status", function(window)
  my_helpers.status_info(window)
end)

-- Test function used for debugging, trigger with CTRL+E
wezterm.on("trigger-me", function(window, pane)
  window:set_right_status(wezterm.time.now():format("%H:%M:%S"))
end)

--[[      Main table     ]]
return {
  command_palette_font_size = 14,
  command_palette_fg_color = "#D8DEE9",
  command_palette_bg_color = "rgba(19, 33, 69, 0.85)",

  --[[ Dynamically set colors based on system appearance ]]
  colors = my_helpers.scheme_for_appearance(wezterm.gui.get_appearance()),
  --[[ User defined keybindings ]]
  keys = my_key_bindings,
  --[[ User defined key tables: copy_mode, search_mode, split, resize, activate_pane ]]
  key_tables = my_key_tables,

  disable_default_key_bindings = true,
  -- Activate LEADER
  leader = { key = "phys:Space", mods = "CTRL", timeout_milliseconds = 1500 },
  adjust_window_size_when_changing_font_size = false,
  font_size = 14.0,
  window_background_opacity = 0.9,
  -- Undecided if I like background blur
  -- macos_window_background_blur = 4,
  exit_behavior = "Hold",
  skip_close_confirmation_for_processes_named = {},
  cursor_thickness = 2,
  underline_thickness = 2,
  default_cursor_style = "BlinkingBlock",
  use_fancy_tab_bar = false,
  tab_max_width = 30,
  -- Initial size of new window
  initial_rows = 50,
  initial_cols = 120,
  scrollback_lines = 3500,
  window_decorations = "RESIZE",
  window_frame = {
    -- Tab bar font size
    font_size = 14,
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
  launch_menu = {},
}
