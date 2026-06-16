-- Lualine theme for the Honyx colorscheme.

local p = require("honyx.palette")

local normal_a = { fg = p.bg, bg = p.honey, gui = "bold" }
local normal_b = { fg = p.fg_alt, bg = p.bg_highlight }
local normal_c = { fg = p.muted, bg = p.bg_alt }

local insert_a = { fg = p.bg, bg = p.blue, gui = "bold" }
local visual_a = { fg = p.bg, bg = p.honey_light, gui = "bold" }
local replace_a = { fg = p.bg, bg = p.red, gui = "bold" }
local command_a = { fg = p.bg, bg = p.green, gui = "bold" }

local inactive_a = { fg = p.comment, bg = p.bg_alt }
local inactive_c = { fg = p.comment, bg = p.bg_alt }

return {
	normal = {
		a = normal_a,
		b = normal_b,
		c = normal_c,
	},
	insert = {
		a = insert_a,
		b = normal_b,
		c = normal_c,
	},
	visual = {
		a = visual_a,
		b = normal_b,
		c = normal_c,
	},
	replace = {
		a = replace_a,
		b = normal_b,
		c = normal_c,
	},
	command = {
		a = command_a,
		b = normal_b,
		c = normal_c,
	},
	inactive = {
		a = inactive_a,
		b = inactive_c,
		c = inactive_c,
	},
}
