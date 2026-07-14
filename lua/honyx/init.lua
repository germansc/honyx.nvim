-- Honyx colorscheme
-- A minimal colorscheme blending warm honey-gold accents with deep onyx blacks.

local M = {}
local config = require("honyx.config")
local palette = require("honyx.palette")
local theme = require("honyx.theme")

function M.setup(opts)
	local cfg = config.merge(config.defaults(), opts)

	vim.g.colors_name = "honyx"

	vim.cmd.highlight("clear")
	vim.cmd.syntax("reset")

	vim.o.termguicolors = true

	local highlights = theme.build(cfg, palette)

	for group, spec in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, spec)
	end
end

return M
