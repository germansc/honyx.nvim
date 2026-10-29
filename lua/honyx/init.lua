-- Honyx colorscheme
-- A minimal colorscheme blending warm honey-gold accents with deep onyx blacks.

local M = {}
local config = require("honyx.config")
local palette = require("honyx.palette")
local theme = require("honyx.theme")

--- Apply highlight groups to Neovim.
--- Pure side effects: clears previous syntax, sets env, calls nvim_set_hl.
local function apply(highlights, cfg)
	vim.o.background = "dark"

	vim.cmd.highlight("clear")

	vim.o.termguicolors = true
	vim.g.colors_name = "honyx"

	for group, spec in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, spec)
	end

	if cfg.terminal_colors then
		for i, color in ipairs(palette.terminal) do
			vim.g["terminal_color_" .. (i - 1)] = color
		end
	end
end

local stored_config

local function render(cfg)
	local highlights = theme.build(cfg, palette.resolve(cfg))
	apply(highlights, cfg)
end

--- Configure and apply the Honyx colorscheme.
--- @param opts? { transparent?: boolean, terminal_colors?: boolean, styles?: table, overrides?: table }
function M.setup(opts)
	stored_config = config.build(opts)
	render(stored_config)
end

function M.load()
	render(stored_config or config.build())
end

return M
