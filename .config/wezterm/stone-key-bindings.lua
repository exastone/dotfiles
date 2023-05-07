-- stone-key-bindings.lua
-- user defined key binding
-- imported by wezterm.lua config

local wezterm = require "wezterm"
local act = wezterm.action

local stone_key_bindings = {

	-- test trigger
	{
		key = "E",
		mods = "CTRL",
		action = act.EmitEvent("trigger-me"),
	},

	-- Activate Command Palette
	{
		key = "P",
		mods = "SUPER|SHIFT",
		action = wezterm.action.ActivateCommandPalette,
	},

	-- Used before Command Palette was introduced
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ShowLauncher
	},

	-- Ctrl+Space, followed by 'r' will put us in resize
	-- mode until we cancel that mode.
	-- this mode handles pane resize and font resizing
	{
		key = "|",
		mods = "LEADER",
		action = act.ActivateKeyTable {
			name = "split",
		},
	},

	-- Ctrl+Space, followed by 'r' will put us in resize
	-- mode until we cancel that mode.
	-- this mode handles pane resize and font resizing
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable {
			name = "resize",
			one_shot = false,
		},
	},

	-- Ctrl+Space, followed by 'a' will put us in activate-pane
	-- mode until we press some other key or until 1 second (1000ms)
	-- of time elapses
	{
		key = "a",
		mods = "LEADER",
		action = act.ActivateKeyTable {
			name = "activate_pane",
			timeout_milliseconds = 2000,
		},
	},

	-- Paste from system clipboard
	{
		key = "v",
		mods = "SUPER",
		action = act.PasteFrom("Clipboard")
	},

	-- Paste from primary selection
	{
		key = "p",
		mods = "SUPER",
		action = act.PasteFrom("PrimarySelection")
	},

	-- Copy to system clipboard
	{
		key = "c",
		mods = "SUPER",
		action = act.CopyTo("Clipboard")
	},

	-- Enter copy mode
	{
		key = "c",
		mods = "LEADER",
		action = act.ActivateCopyMode
	},

	-- Enter Quick Select
	{ key = "q",          mods = "LEADER", action = act.QuickSelect },

	-- Trigger search
	{ key = "f",          mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },
	-- { key = "s", mods = "LEADER", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },

	-- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
	{ key = "LeftArrow",  mods = "OPT",    action = wezterm.action.SendKey { key = "b", mods = "ALT", }, },
	{ key = "RightArrow", mods = "OPT",    action = wezterm.action.SendKey { key = "f", mods = "ALT" }, },


	-- A program can be started when the split is created by specifing the
	-- program name in `command = { args = { < program_name > } },`
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane {
			direction = "Right",
			command = { args = {} },
			size = { Percent = 50 },
		},
	},

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
	{ key = "w",          mods = "SHIFT|SUPER", action = wezterm.action.CloseCurrentPane { confirm = true } },

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

	-- Toggle background window opacity
	{ key = "o",          mods = "LEADER",      action = act.EmitEvent "toggle-opacity" },

	-- Clear scrollback buffer & viewport
	{ key = "K",          mods = "SUPER|SHIFT", action = act.ClearScrollback "ScrollbackAndViewport" },

}

return stone_key_bindings




--[[        Other Examples       ]]
--[[ Example of using SpawnCommandInNewTab
	{
		key = 'J',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.SpawnCommandInNewTab {
			args = { 'sh', '-c', wezterm.shell_join_args { 'ls', '-al' } .. '; sleep 1' },
		},
	}, ]]
--[[
	{
		key = 'DownArrow',
		mods = 'SHIFT|ALT|CTRL',
		action = wezterm.action.SplitPane {
			command = {
				args = {},
				domain = 'CurrentPaneDomain'
			},
			direction = 'Down',
			size = { Percent = (50) },
			top_level = false
		}
	},]]
-- Example of action.Multiple enabling the ability to perform multi-action cmds
-- {
--   key = 'LeftArrow',
--   action = wezterm.action.Multiple {
--     wezterm.action.SendKey { key = 'l' },
--     wezterm.action.SendKey { key = 'e' },
--     wezterm.action.SendKey { key = 'f' },
--     wezterm.action.SendKey { key = 't' },
--   },
-- },
