-- stone-colours.lua
--[[ imported by stone-helpers.lua
	used by stone_helpers.scheme_for_appearance(appearance)
	to dynamically set colour scheme ]]
local stone_colours = {
	color_schemes = {
		["Dark Scheme"] = {
			-- Terminal background colour
			background = "#0c1426",
			foreground = "#D8DEE9",
			ansi = {
				"#000000",
				"#FE6D73",
				"#7FB685",
				"#FFCA14",
				"#2A63B8",
				"#FE97E1",
				"#3DA19F",
				"#D8DEE9"
			},
			brights = {
				"#8ba2af",
				"#FD788B",
				"#32936F",
				"#F4CC67",
				"#68A9FF",
				"#F970CD",
				"#3BA8A6",
				"#ffffff",
			},
			split = "#275DAD",
			-- copy_mode_active_highlight_bg = { Color = '#52ad70' },
			copy_mode_active_highlight_bg = { Color = "#52ad70" },
			-- copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
			-- this doesn't seem to work?
			copy_mode_inactive_highlight_bg = { Color = "#ffad70" },
			tab_bar = {
				-- The colour of the strip that goes along the top of the window
				-- does not apply when `use_fancy_tab_bar = true,`
				background = "#0c1426",

				-- The color of the inactive tab bar edge/divider
				-- only applies to fancy tab bar style
				inactive_tab_edge = "#e5ded6",


				-- Active tab setting are for the focused tab in the window
				active_tab = {
					-- Background colour for focused tab label
					bg_color = "#253C73",

					-- Text colour for focused tab label
					fg_color = "#e5ded6",

					-- Font weight for focused tab label
					-- Options: "Half", "Normal" (default), "Bold"
					intensity = "Normal",

					-- Underline for focused tab label
					-- Options: "None" (default), "Single", "Double"
					underline = "None",

					-- Italics for focused tab label
					-- Options: true, false (default)
					italic = false,

					-- Strikethrough for focused tab label
					-- Options: true, false (default)
					strikethrough = false,
				},

				-- Inactive tabs are unfocused tabs
				-- Options for `active_tab` are applicable to `inactive_tab`
				inactive_tab = {
					bg_color = "#132145",
					fg_color = "#808080",
				},

				-- Alternate styling when the mouse pointer hovers over inactive tabs
				-- Options for `active_tab` are applicable to `inactive_tab_hover`
				inactive_tab_hover = {
					bg_color = "#1D3354",
					fg_color = "#909090",
					italic = false,
				},

				-- The new tab button that let you create new tabs
				-- Options for `active_tab` are applicable to `new_tab`
				new_tab = {
					bg_color = "#000000",
					fg_color = "#808080",
				},

				-- Alternate styling when the mouse pointer moves over the new tab button
				-- Options for `active_tab` are applicable to `new_tab_hover`
				new_tab_hover = {
					bg_color = "#253C73",
					fg_color = "#e5ded6",
					italic = false,
				},
			},
			-- Colors for copy_mode and quick_select
			-- available since: 20220807-113146-c2fee766
			-- In copy_mode, the color of the active text is:
			-- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
			-- 2. selection_* otherwise
			-- copy_mode_active_highlight_bg = { Color = '#000000' },
			-- use `AnsiColor` to specify one of the ansi color palette values
			-- (index 0-15) using one of the names "Black", "Maroon", "Green",
			--  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
			-- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
			-- copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
			-- copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
			-- copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

			quick_select_label_bg = { Color = "#0c1426" },
			quick_select_label_fg = { Color = "#F970CD" },
			quick_select_match_bg = { Color = "#0c1426" },
			quick_select_match_fg = { Color = "#ECD444" },
		},
		["Light Scheme"] = {
			-- Terminal background colour
			background = "#4A4A4A",
			foreground = "#ECEFF4",
			ansi = {
				"#000000",
				"#FE6D73",
				"#0fff97",
				"#F1fF5A",
				"#1789FC",
				"#C6BFFF",
				"#7FD1B9",
				"#d2d2d2",
			},
			brights = {
				"#000000",
				"#FFAAAA",
				"#CCF5AC",
				"#FFCA14",
				"#9AC4F8",
				"#E2ADF2",
				"#55D6C2",
				"#ffffff",
			},
			split = "#ADD9F4",

			copy_mode_active_highlight_bg = { Color = "#FF0000" },
			copy_mode_active_highlight_fg = { Color = "#FFFFFF" },
			-- copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
			-- this doesn't seem to work?
			copy_mode_inactive_highlight_bg = { Color = "#ffad70" },
			tab_bar = {
				-- The colour of the strip that goes along the top of the window
				-- does not apply when `use_fancy_tab_bar = true,`
				background = "#4A4A4A",

				-- The color of the inactive tab bar edge/divider
				-- only applies to fancy tab bar style
				inactive_tab_edge = "#e5ded6",


				-- Active tab setting are for the focused tab in the window
				active_tab = {
					-- Background colour for focused tab label
					bg_color = "#244CB3",

					-- Text colour for focused tab label
					fg_color = "#ECEFF4",

					-- Font weight for focused tab label
					-- Options: "Half", "Normal" (default), "Bold"
					intensity = "Normal",

					-- Underline for focused tab label
					-- Options: "None" (default), "Single", "Double"
					underline = "None",

					-- Italics for focused tab label
					-- Options: true, false (default)
					italic = false,

					-- Strikethrough for focused tab label
					-- Options: true, false (default)
					strikethrough = false,
				},

				-- Inactive tabs are unfocused tabs
				-- Options for `active_tab` are applicable to `inactive_tab`
				inactive_tab = {
					bg_color = "#253C73",
					fg_color = "#A6A8AB",
				},

				-- Alternate styling when the mouse pointer hovers over inactive tabs
				-- Options for `active_tab` are applicable to `inactive_tab_hover`
				inactive_tab_hover = {
					bg_color = "#1D3354",
					fg_color = "#909090",
					italic = false,
				},

				-- The new tab button that let you create new tabs
				-- Options for `active_tab` are applicable to `new_tab`
				new_tab = {
					bg_color = "#A6A8AB",
					fg_color = "#1D3354",
				},

				-- Alternate styling when the mouse pointer moves over the new tab button
				-- Options for `active_tab` are applicable to `new_tab_hover`
				new_tab_hover = {
					bg_color = "#C6C8CC",
					fg_color = "#253C73",
					italic = false,
				},
			},

			quick_select_label_bg = { Color = "#0c1426" },
			quick_select_label_fg = { Color = "#F970CD" },
			quick_select_match_bg = { Color = "#0c1426" },
			quick_select_match_fg = { Color = "#ECD444" },

		}
	},
}

return stone_colours
