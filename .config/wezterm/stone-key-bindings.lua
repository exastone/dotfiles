-- stone-key-bindings.lua
-- user defined key binding
-- imported by wezterm.lua config

local wezterm = require "wezterm"
local act = wezterm.action

local stone_key_bindings = {

	-- test trigger
	{ key = "E", mods = "CTRL",        action = act.EmitEvent("trigger-me"), },

	-- Activate Command Palette
	{ key = "P", mods = "SUPER|SHIFT", action = wezterm.action.ActivateCommandPalette, },

	-- Used before Command Palette was introduced
	{ key = "P", mods = "CTRL|SHIFT",  action = wezterm.action.ShowLauncher },

	-- Ctrl+Space, followed by '|' will put us in split mode
	-- until split action is performed or cancel/escape
	{
		key = "|",
		mods = "LEADER",
		action = act.ActivateKeyTable {
			name = "split",
		},
	},

	-- LEADER + 'r' will put us in resize mode untilL cancel/escape.
	-- Mode handles pane resize & font resizing
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable {
			name = "resize",
			one_shot = false,
		},
	},

	-- LEADER + 'a' will put us in activate_pane mode
	-- until we press some other key or until 2s (2000ms) elapses
	{
		key = "a",
		mods = "LEADER",
		action = act.ActivateKeyTable {
			name = "activate_pane",
			timeout_milliseconds = 2000,
		},
	},

	-- Copy to system clipboard
	{ key = "c",          mods = "SUPER",       action = act.CopyTo("Clipboard") },

	-- Enter copy mode
	{ key = "c",          mods = "LEADER",      action = act.ActivateCopyMode },

	-- Enter Quick Select
	{ key = "q",          mods = "LEADER",      action = act.QuickSelect },

	-- Trigger search
	{ key = "f",          mods = "LEADER",      action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "f",          mods = "SUPER",       action = act.Search("CurrentSelectionOrEmptyString") },

	-- Paste from system clipboard
	{ key = "v",          mods = "SUPER",       action = act.PasteFrom("Clipboard") },

	-- Paste from primary selection
	{ key = "p",          mods = "SUPER",       action = act.PasteFrom("PrimarySelection") },

	-- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
	{ key = "LeftArrow",  mods = "OPT",         action = wezterm.action.SendKey { key = "b", mods = "ALT", }, },
	{ key = "RightArrow", mods = "OPT",         action = wezterm.action.SendKey { key = "f", mods = "ALT" }, },

	-- Navigate Tabs
	{ key = "[",          mods = "SUPER",       action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]",          mods = "SUPER",       action = wezterm.action.ActivateTabRelative(1) },

	-- Reload Config
	{ key = "r",          mods = "SHIFT|SUPER", action = wezterm.action.ReloadConfiguration },

	-- Show Debug Overlay
	{ key = "L",          mods = "SHIFT|SUPER", action = wezterm.action.ShowDebugOverlay },

	-- Spawn New Window
	{ key = "N",          mods = "SHIFT|SUPER", action = wezterm.action.SpawnWindow },

	-- Spawn Tab (default domain)
	{ key = "t",          mods = "SHIFT|SUPER", action = wezterm.action.SpawnTab "DefaultDomain" },

	-- Spawn New Application Window
	{ key = "n",          mods = "SHIFT|SUPER", action = wezterm.action.SpawnWindow },

	-- Close Current Pane
	{ key = "w",          mods = "SHIFT|SUPER", action = wezterm.action.CloseCurrentPane },

	-- Scroll Page Up/Down
	{ key = "PageUp",     mods = "SHIFT",       action = wezterm.action.ScrollByPage(-1) },
	{ key = "PageDown",   mods = "SHIFT",       action = wezterm.action.ScrollByPage(1) },

	-- Reorder Tab
	{ key = "PageUp",     mods = "SHIFT|SUPER", action = wezterm.action.MoveTabRelative(-1) },
	{ key = "PageDown",   mods = "SHIFT|SUPER", action = wezterm.action.MoveTabRelative(1) },
	{ key = "LeftArrow",  mods = "LEADER",      action = act.ActivatePaneDirection "Left" },
	{ key = "RightArrow", mods = "LEADER",      action = act.ActivatePaneDirection "Right" },
	{ key = "UpArrow",    mods = "LEADER",      action = act.ActivatePaneDirection "Up" },
	{ key = "DownArrow",  mods = "LEADER",      action = act.ActivatePaneDirection "Down" },

	-- Clear scrollback buffer & viewport
	{ key = "K",          mods = "SUPER|SHIFT", action = act.ClearScrollback "ScrollbackAndViewport" },

}

return stone_key_bindings
