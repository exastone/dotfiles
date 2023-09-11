-- stone-helpers.lua

local wezterm = require "wezterm"
local my_colours = require("stone-colours")
local stone_helpers = {}

-- Provide info to right-side status bar about leader & key table activations
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

-- Get system appearance and return colour table based on system appearance value
function stone_helpers.scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return (my_colours.color_schemes["Dark Scheme"])
  else
    return (my_colours.color_schemes["Light Scheme"])
  end
end

return stone_helpers
