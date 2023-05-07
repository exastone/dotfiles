-- stone-colours.lua
--[[ imported by stone-helpers.lua to dynamically set colour scheme ]]
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
			copy_mode_active_highlight_bg = { Color = "#52ad70" },
			copy_mode_inactive_highlight_bg = { Color = "#ffad70" },
			tab_bar = {
				background = "#0c1426",
				inactive_tab_edge = "#e5ded6",
				active_tab = { bg_color = "#253C73", fg_color = "#e5ded6", },
				inactive_tab = { bg_color = "#132145", fg_color = "#808080", },
				inactive_tab_hover = { bg_color = "#1D3354", fg_color = "#909090", italic = false, },
				new_tab = { bg_color = "#000000", fg_color = "#808080", },
				new_tab_hover = { bg_color = "#253C73", fg_color = "#e5ded6", italic = false, },
			},

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
			copy_mode_inactive_highlight_bg = { Color = "#ffad70" },
			tab_bar = {
				background = "#4A4A4A",
				inactive_tab_edge = "#e5ded6",
				active_tab = { bg_color = "#244CB3", fg_color = "#ECEFF4", },
				inactive_tab = { bg_color = "#253C73", fg_color = "#A6A8AB", },
				inactive_tab_hover = { bg_color = "#1D3354", fg_color = "#909090", italic = false, },
				new_tab = { bg_color = "#A6A8AB", fg_color = "#1D3354", },
				new_tab_hover = { bg_color = "#C6C8CC", fg_color = "#253C73", italic = false, },
			},

			quick_select_label_bg = { Color = "#0c1426" },
			quick_select_label_fg = { Color = "#F970CD" },
			quick_select_match_bg = { Color = "#0c1426" },
			quick_select_match_fg = { Color = "#ECD444" },

		}
	},
}

return stone_colours
