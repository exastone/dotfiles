-- stone-helpers.lua

local wezterm = require "wezterm"
local my_colours = require("stone-colours")
-- This is the module table that we will export
local stone_helpers = {}

-- Provide info to right-side status bar about active key table, leader activation
function stone_helpers.status_info(window)
  local info_table = {}

  local activeKeyTable = window:active_key_table()
  local leaderIsActive = window:leader_is_active()

  if activeKeyTable then
    activeKeyTable = "Table: " .. activeKeyTable
    table.insert(info_table, { Background = { Color = "#253C73" } })
    table.insert(info_table, { Foreground = { Color = "#e5ded6" } })
    table.insert(info_table, { Text = " " .. activeKeyTable .. " " })
  end
  if leaderIsActive then
    table.insert(info_table, { Background = { Color = "#253C73" } })
    table.insert(info_table, { Foreground = { Color = "#e5ded6" } })
    table.insert(info_table, { Text = " <LEADER>" })
  end

  window:set_right_status(wezterm.format(info_table))
end

function stone_helpers.action_callback(callback)
  local event_id = "..." -- the function generates a unique event id
  wezterm.on(event_id, callback)
  return wezterm.action.EmitEvent(event_id)
end

function stone_helpers.toggle_opacity(window)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.4
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end

function stone_helpers.toggle_blur(window)
  local overrides = window:get_config_overrides() or {}
  if not overrides.macos_window_background_blur then
    overrides.macos_window_background_blur = 16
  else
    overrides.macos_window_background_blur = nil
  end
  window:set_config_overrides(overrides)
end

-- Get system appearance and return colour table based on system appearance value
function stone_helpers.scheme_for_appearance(appearance)
  -- local overrides = window:get_config_overrides() or {}
  if appearance:find "Dark" then
    print("Dark mode detected")
    return (my_colours.color_schemes["Dark Scheme"])
  else
    print("Light mode detected")
    return (my_colours.color_schemes["Light Scheme"])
  end
end

-- return our module table
return stone_helpers


-- toggle background window opacity
--[[ function stone_helpers.toggle_opacity(window)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.8
    overrides.window_background_gradient = {
      colors = { "#253B7A", "#ffffff" },
      -- Specifices a Linear gradient starting in the top left corner.
      orientation = { Linear = { angle = -45.0 } },
    }
  else
    overrides.window_background_opacity = nil
    overrides.window_background_gradient = nil
  end
  window:set_config_overrides(overrides)
end ]]
