-- stone-key-tables.lua

local wezterm = require "wezterm"
local act = wezterm.action
local my_helpers = require("stone-helpers")

-- This is the module table that we will export
local stone_key_tables = {
    copy_mode = {

        -- Cancel the mode by pressing escape
        { key = "Escape",     mods = "NONE",  action = act.CopyMode "Close" },

        -- Character movement
        { key = "h",          mods = "NONE",  action = act.CopyMode "MoveLeft" },
        { key = "LeftArrow",  mods = "NONE",  action = act.CopyMode "MoveLeft" },
        { key = "j",          mods = "NONE",  action = act.CopyMode "MoveDown" },
        { key = "DownArrow",  mods = "NONE",  action = act.CopyMode "MoveDown" },
        { key = "k",          mods = "NONE",  action = act.CopyMode "MoveUp" },
        { key = "UpArrow",    mods = "NONE",  action = act.CopyMode "MoveUp" },
        { key = "l",          mods = "NONE",  action = act.CopyMode "MoveRight" },
        { key = "RightArrow", mods = "NONE",  action = act.CopyMode "MoveRight" },

        -- Word movement
        { key = "LeftArrow",  mods = "ALT",   action = act.CopyMode "MoveBackwardWord", },
        { key = "RightArrow", mods = "ALT",   action = act.CopyMode "MoveForwardWord", },
        { key = "b",          mods = "NONE",  action = act.CopyMode "MoveBackwardWord", },
        { key = "w",          mods = "NONE",  action = act.CopyMode "MoveForwardWord", },
        { key = "v",          mods = "NONE",  action = act.CopyMode { SetSelectionMode = "Cell" }, },
        { key = "v",          mods = "CTRL",  action = act.CopyMode { SetSelectionMode = "Block" }, },
        { key = ";",          mods = "ALT",   action = act.CopyMode "MoveToSelectionOtherEndHoriz", },
        { key = ";",          mods = "NONE",  action = act.CopyMode "ClearSelectionMode", },
        { key = "F",          mods = "SHIFT", action = act.CopyMode { JumpBackward = { prev_char = false } }, },
        { key = "u",          mods = "CTRL",  action = wezterm.action.CopyMode "ClearPattern" },
        -- Copy to clipboard and send callback to set status message
        {
            key = "y",
            mods = "NONE",
            action = act.Multiple {
                act.CopyTo("Clipboard"),
                my_helpers.action_callback(function(window)
                    window:set_right_status(wezterm.format {
                        { Text = "Copied to Clipboard" },
                    })
                end),
            },
        },

    },
    search_mode = {

        { key = "Escape", mods = "NONE",  action = wezterm.action.CopyMode "Close" },
        { key = "Enter",  mods = "NONE",  action = wezterm.action.CopyMode "NextMatch" },
        { key = "Enter",  mods = "SHIFT", action = wezterm.action.CopyMode "PriorMatch" },
        -- Cycles between: case-sensitive, ignore-case, regex
        { key = "r",      mods = "CTRL",  action = wezterm.action.CopyMode "CycleMatchType" },
        { key = "u",      mods = "CTRL",  action = wezterm.action.CopyMode "ClearPattern" },
    },
    split = {
        {
            key = "DownArrow", action = wezterm.action.SplitPane { direction = "Down" },
        },
        {
            key = "UpArrow", action = wezterm.action.SplitPane { direction = "Up" },
        },
        {
            key = "LeftArrow", action = wezterm.action.SplitPane { direction = "Left" },
        },
        {
            key = "RightArrow", action = wezterm.action.SplitPane { direction = "Right" },
        },

    },
    --[[ Defines the keys that are active in our resize mode.
         Since we're likely to want to make multiple adjustments,
         we made the activation one_shot=false. We therefore need
         to define a key assignment for getting out of this mode.
         'resize_pane' here corresponds to the name="resize_pane" in
         the key assignments above.]]
    resize = {
        { key = "LeftArrow",  action = act.AdjustPaneSize { "Left", 1 } },
        { key = "h",          action = act.AdjustPaneSize { "Left", 1 } },
        { key = "RightArrow", action = act.AdjustPaneSize { "Right", 1 } },
        { key = "l",          action = act.AdjustPaneSize { "Right", 1 } },
        { key = "UpArrow",    action = act.AdjustPaneSize { "Up", 1 } },
        { key = "k",          action = act.AdjustPaneSize { "Up", 1 } },
        { key = "DownArrow",  action = act.AdjustPaneSize { "Down", 1 } },
        { key = "j",          action = act.AdjustPaneSize { "Down", 1 } },

        -- Show panel selection pop-up
        { key = "p",          action = wezterm.action.PaneSelect { alphabet = "", mode = "Activate" } },

        -- Reset Font Size
        { key = "0",          action = wezterm.action.ResetFontSize },
        -- Increase Font Size
        { key = "=",          action = wezterm.action.IncreaseFontSize },
        -- Decrease Font Size
        { key = "-",          action = wezterm.action.DecreaseFontSize },

        -- Cancel the mode by pressing escape
        { key = "Escape",     action = "PopKeyTable" },
    },
    -- Defines the keys that are active in our activate-pane mode.
    -- 'activate_pane' here corresponds to the name="activate_pane" in
    -- the key assignments above.
    activate_pane = {
        { key = "LeftArrow",  action = act.ActivatePaneDirection "Left" },
        { key = "h",          action = act.ActivatePaneDirection "Left" },
        { key = "RightArrow", action = act.ActivatePaneDirection "Right" },
        { key = "l",          action = act.ActivatePaneDirection "Right" },
        { key = "UpArrow",    action = act.ActivatePaneDirection "Up" },
        { key = "k",          action = act.ActivatePaneDirection "Up" },
        { key = "DownArrow",  action = act.ActivatePaneDirection "Down" },
        { key = "j",          action = act.ActivatePaneDirection "Down" },

        -- Rotate Panes
        { key = "|",          action = wezterm.action.RotatePanes "CounterClockwise", },

        -- Show panel selection pop-up
        { key = "p",          action = wezterm.action.PaneSelect { alphabet = "", mode = "Activate" } },

    },

    -- Quick Actions
    quick_actions = {
        { key = "Escape", action = "PopKeyTable" },
        { key = "1",      action = wezterm.action_callback(my_helpers.toggle_opacity), },
        { key = "2",      action = wezterm.action_callback(my_helpers.toggle_blur), },

    }
}
-- return table
return stone_key_tables
