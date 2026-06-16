-- Honyx colorscheme
-- A minimal colorscheme blending warm honey-gold accents with deep onyx blacks.

local M = {}
local palette = require("honyx.palette")
local theme = require("honyx.theme")

local config = {
	transparent = false,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
	},
	overrides = {},
}

-- This is some kind of comment in this style of stuff.
function M.setup(opts)
	-- Extend the configuration table with user styles and highlight overrides.
	config = vim.tbl_deep_extend("force", config, opts or {})

	vim.g.colors_name = "honyx"

	vim.cmd.highlight("clear")
	vim.cmd.syntax("reset")

	vim.o.termguicolors = true

	local highlights = theme.build(config, palette)

	for group, spec in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, spec)
	end
end

return M
