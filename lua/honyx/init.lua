-- Honyx colorscheme
-- A minimal colorscheme blending warm honey-gold accents with deep onyx blacks.

local M = {}
local config = require("honyx.config")
local palette = require("honyx.palette")
local theme = require("honyx.theme")

--- Apply highlight groups to Neovim.
--- Pure side effects: clears previous syntax, sets env, calls nvim_set_hl.
local function apply(highlights)
	vim.g.colors_name = "honyx"

	vim.cmd.highlight("clear")
	vim.cmd.syntax("reset")

	vim.o.termguicolors = true

	for group, spec in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, spec)
	end
end

--- Configure and apply the Honyx colorscheme.
--- @param opts? { transparent?: boolean, styles?: table, overrides?: table }
function M.setup(opts)
	local cfg = config.build(opts)
	local highlights = theme.build(cfg, palette)
	apply(highlights)
end

return M
