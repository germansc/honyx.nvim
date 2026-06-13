-- Honyx colorscheme
-- A minimal colorscheme blending warm honey-gold accents with deep onyx blacks.

local M = {}

local config = {
	transparent = false,
}

local palette = {
	bg = "#0f0f10",
	bg_alt = "#1a1a1c",
	bg_highlight = "#22262b",
	bg_visual = "#2a2f35",

	border = "#30353c",
	muted = "#808590",
	comment = "#606367",

	fg = "#F5F5FF",
	fg_alt = "#c8cad4",

	honey = "#efc983",
	honey_dim = "#f3d8a5",
	honey_dark = "#d4aa6e",

	green = "#78dbb8",
	blue = "#9ab8d4",
	red = "#FF7070",
}

-- Helpers
local function set(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

local function link(group, target)
	set(group, { link = target })
end

-- This is some kind of comment in this style of stuff.
function M.setup(opts)
	-- Extend the configuration table and override with custom options.
	config = vim.tbl_deep_extend("force", config, opts or {})

	vim.g.colors_name = "honyx"

	vim.cmd.highlight("clear")
	vim.cmd.syntax("reset")

	vim.o.termguicolors = true

	local p = palette

	p.bg = config.transparent and "NONE" or p.bg
	p.bg_float = config.transparent and "NONE" or p.bg_alt

	-- Common UI groups
	set("Normal", { fg = p.fg, bg = p.bg })
	set("NormalFloat", { fg = p.fg, bg = p.bg_alt })
	set("FloatBorder", { fg = p.border, bg = p.bg_alt })
	set("FloatTitle", { fg = p.honey, bg = p.bg_alt })
	set("ColorColumn", { bg = p.bg_alt })
	set("Conceal", { fg = p.muted })
	set("CursorLine", { bg = p.bg_alt })
	set("CursorColumn", { bg = p.bg_alt })
	set("CursorLineNr", { fg = p.fg, bg = p.bg_alt })
	set("Directory", { fg = p.honey })
	set("EndOfBuffer", { fg = p.bg })
	set("ErrorMsg", { fg = p.red })
	set("WinSeparator", { fg = p.border })
	set("Folded", { fg = p.muted, bg = p.bg_alt })
	set("FoldColumn", { fg = p.muted, bg = p.bg })
	set("SignColumn", { fg = p.muted, bg = p.bg })
	set("IncSearch", { fg = p.bg, bg = p.honey })
	set("LineNr", { fg = p.comment, bg = p.bg })
	set("MatchParen", { fg = p.honey_dim, bg = p.bg_highlight, bold = true })
	set("ModeMsg", { fg = p.fg })
	set("MoreMsg", { fg = p.honey })
	set("NonText", { fg = p.border })
	set("Pmenu", { fg = p.fg, bg = p.bg_alt })
	set("PmenuSel", { fg = p.fg, bg = p.bg_highlight })
	set("PmenuSbar", { bg = p.bg_highlight })
	set("PmenuThumb", { bg = p.border })
	set("Question", { fg = p.honey })
	set("Search", { fg = p.bg, bg = p.honey_dim })
	set("SpecialKey", { fg = p.border })
	set("StatusLine", { fg = p.fg_alt, bg = p.bg_alt })
	set("StatusLineNC", { fg = p.muted, bg = p.bg_alt })
	set("TabLine", { fg = p.muted, bg = p.bg_alt })
	set("TabLineFill", { bg = p.bg_alt })
	set("TabLineSel", { fg = p.honey, bg = p.bg_highlight })
	set("Title", { fg = p.honey })
	set("Visual", { bg = p.bg_visual })
	set("WarningMsg", { fg = p.honey })
	set("Whitespace", { fg = p.border })
	set("WildMenu", { fg = p.bg, bg = p.honey })

	-- Legacy syntax
	set("Comment", { fg = p.comment, italic = true })
	set("Constant", { fg = p.fg_alt })
	set("String", { fg = p.green })
	set("Character", { fg = p.green })
	set("Number", { fg = p.honey })
	set("Boolean", { fg = p.honey })
	set("Float", { fg = p.honey })
	set("Identifier", { fg = p.fg })
	set("Function", { fg = p.honey })
	set("Statement", { fg = p.muted })
	set("Conditional", { fg = p.muted })
	set("Repeat", { fg = p.muted })
	set("Label", { fg = p.muted })
	set("Operator", { fg = p.muted })
	set("Keyword", { fg = p.muted })
	set("Exception", { fg = p.red })
	set("PreProc", { fg = p.muted })
	set("Include", { fg = p.muted })
	set("Define", { fg = p.muted })
	set("Macro", { fg = p.muted })
	set("PreCondit", { fg = p.muted })
	set("Type", { fg = p.honey_dim })
	set("StorageClass", { fg = p.muted })
	set("Structure", { fg = p.honey })
	set("Typedef", { fg = p.honey })
	set("Special", { fg = p.fg_alt })
	set("SpecialComment", { fg = p.comment, italic = true })
	set("Underlined", { fg = p.blue, underline = true })
	set("Ignore", { fg = p.comment })
	set("Error", { fg = p.red })
	set("Todo", { fg = p.honey, bg = p.bg_alt, italic = true })

	set("DiagnosticError", { fg = p.red })
	set("DiagnosticWarn", { fg = p.honey })
	set("DiagnosticInfo", { fg = p.blue })
	set("DiagnosticHint", { fg = p.blue })
	set("DiagnosticOk", { fg = p.green })
	set("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
	set("DiagnosticUnderlineWarn", { sp = p.honey, undercurl = true })
	set("DiagnosticUnderlineInfo", { sp = p.blue, undercurl = true })
	set("DiagnosticUnderlineHint", { sp = p.blue, undercurl = true })

	set("DiffAdd", { fg = p.green, bg = p.bg_alt })
	set("DiffChange", { fg = p.honey, bg = p.bg_alt })
	set("DiffDelete", { fg = p.red, bg = p.bg_alt })
	set("DiffText", { fg = p.honey_dim, bg = p.bg_highlight })

	link("CurSearch", "IncSearch")
	link("CursorIM", "CursorLine")
	link("DiagnosticFloatingError", "DiagnosticError")
	link("DiagnosticFloatingWarn", "DiagnosticWarn")
	link("DiagnosticFloatingInfo", "DiagnosticInfo")
	link("DiagnosticFloatingHint", "DiagnosticHint")
	link("DiagnosticSignError", "DiagnosticError")
	link("DiagnosticSignWarn", "DiagnosticWarn")
	link("DiagnosticSignInfo", "DiagnosticInfo")
	link("DiagnosticSignHint", "DiagnosticHint")
	link("DiagnosticVirtualTextError", "DiagnosticError")
	link("DiagnosticVirtualTextWarn", "DiagnosticWarn")
	link("DiagnosticVirtualTextInfo", "DiagnosticInfo")
	link("DiagnosticVirtualTextHint", "DiagnosticHint")

	-- Tree-sitter Syntax
	link("@comment", "Comment")
	link("@constant", "Constant")
	link("@constant.builtin", "Constant")
	link("@string", "String")
	link("@string.escape", "Special")
	link("@character", "Character")
	link("@number", "Number")
	link("@boolean", "Boolean")
	link("@variable", "Identifier")
	link("@variable.builtin", "Identifier")
	link("@function", "Function")
	link("@function.builtin", "Function")
	link("@function.call", "Function")
	link("@keyword", "Keyword")
	link("@keyword.function", "Keyword")
	link("@operator", "Operator")
	link("@type", "Type")
	link("@type.builtin", "Type")
	link("@constructor", "Type")
	link("@property", "Identifier")
	link("@field", "Identifier")
	link("@parameter", "Identifier")
	link("@punctuation", "Delimiter")
	link("@punctuation.bracket", "Delimiter")
	link("@punctuation.delimiter", "Delimiter")
	link("@tag", "Type")
	link("@tag.attribute", "Identifier")
	link("@markup.heading", "Title")
	link("@markup.link", "Underlined")
	link("@markup.raw", "String")

	set("Delimiter", { fg = p.muted })
end

return M
