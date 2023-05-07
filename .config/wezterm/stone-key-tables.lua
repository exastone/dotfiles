-- stone-key-tables.lua

local wezterm = require "wezterm"
local act = wezterm.action

local stone_key_tables = {
    copy_mode = {
        -- Cancel/escape mode
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
        { key = "y",          mods = "NONE",  action = act.Multiple { { CopyTo = "PrimarySelection" }, }, },
        { key = "u",          mods = "CTRL",  action = wezterm.action.CopyMode "ClearPattern" },
    },

    --[[ Defines the keys/actions that are active in search_mode.
        Keybinding to active this mode is defined in stone-key-bindings module.
        Currently: LEADER + f || SUPER + f]]
    search_mode = {
        { key = "Escape", mods = "NONE",  action = wezterm.action.CopyMode "Close" },
        { key = "Enter",  mods = "NONE",  action = wezterm.action.CopyMode "NextMatch" },
        { key = "Enter",  mods = "SHIFT", action = wezterm.action.CopyMode "PriorMatch" },
        -- Cycles between: case-sensitive, ignore-case, regex
        { key = "r",      mods = "CTRL",  action = wezterm.action.CopyMode "CycleMatchType" },
        { key = "u",      mods = "CTRL",  action = wezterm.action.CopyMode "ClearPattern" },
    },

    --[[ Defines the keys/actions that are active in split mode.
        Keybinding to active this mode is defined in stone-key-bindings module.
        Currently: LEADER + | ]]
    split = {
        { key = "DownArrow",  action = wezterm.action.SplitPane { direction = "Down" }, },
        { key = "UpArrow",    action = wezterm.action.SplitPane { direction = "Up" }, },
        { key = "LeftArrow",  action = wezterm.action.SplitPane { direction = "Left" }, },
        { key = "RightArrow", action = wezterm.action.SplitPane { direction = "Right" }, },
    },

    --[[ Defines the keys/actions that are active in resize mode.
        Keybinding to active this mode is defined in stone-key-bindings module.
        Currently: LEADER + r ]]
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

    --[[ Defines the keys/actions that are active in activate_pane mode.
        Keybinding to active this mode is defined in stone-key-bindings module.
        Currently: LEADER + a ]]
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
}
return stone_key_tables
