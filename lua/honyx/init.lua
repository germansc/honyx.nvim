-- Honyx colorscheme
-- A minimal colorscheme blending warm honey-gold accents with deep onyx blacks.

local M = {}
local palette = require("honyx.palette")

local config = {
	transparent = false,
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
	-- Only transparent toggle for now.
	config = vim.tbl_deep_extend("force", config, opts or {})

	vim.g.colors_name = "honyx"

	vim.cmd.highlight("clear")
	vim.cmd.syntax("reset")

	vim.o.termguicolors = true

	local p = vim.deepcopy(palette)

	local bg0 = config.transparent and "NONE" or p.bg
	local bg1 = config.transparent and "NONE" or p.bg_alt

	-- Common UI groups
	set("Normal", { fg = p.fg, bg = bg0 })
	set("NormalFloat", { fg = p.fg, bg = bg1 })
	set("FloatBorder", { fg = p.border, bg = bg1 })
	set("FloatTitle", { fg = p.blue, bg = bg1 })
	set("ColorColumn", { bg = bg1 })
	set("Conceal", { fg = p.muted })
	set("CursorLine", { bg = bg1 })
	set("CursorColumn", { bg = bg1 })
	set("CursorLineNr", { fg = p.fg, bg = bg1 })
	set("Directory", { fg = p.blue })
	set("EndOfBuffer", { fg = p.bg })
	set("ErrorMsg", { fg = p.red })
	set("WinSeparator", { fg = p.border })
	set("Folded", { fg = p.muted, bg = bg1 })
	set("FoldColumn", { fg = p.muted, bg = bg0 })
	set("SignColumn", { fg = p.muted, bg = bg0 })
	set("IncSearch", { fg = p.bg, bg = p.honey_light, bold = true })
	set("LineNr", { fg = p.comment, bg = bg0 })
	set("MatchParen", { fg = p.honey_light, bg = p.bg_highlight, bold = true })
	set("ModeMsg", { fg = p.fg })
	set("MoreMsg", { fg = p.blue })
	set("NonText", { fg = p.border })
	set("Pmenu", { fg = p.muted, bg = bg1 })
	set("PmenuSel", { fg = p.bg, bg = p.honey_light })
	set("PmenuSbar", { bg = p.bg_highlight })
	set("PmenuThumb", { bg = p.border })
	set("Question", { fg = p.blue })
	set("Search", { fg = p.bg, bg = p.blue, bold = true })
	set("SpecialKey", { fg = p.muted })
	set("StatusLine", { fg = p.fg_alt, bg = bg1 })
	set("StatusLineNC", { fg = p.muted, bg = bg1 })
	set("TabLine", { fg = p.muted, bg = bg1 })
	set("TabLineFill", { bg = bg1 })
	set("TabLineSel", { fg = p.honey, bg = p.bg_highlight })
	set("Title", { fg = p.honey })
	set("Visual", { bg = p.bg_visual })
	set("WarningMsg", { fg = p.honey })
	set("Whitespace", { fg = p.border })
	set("WildMenu", { fg = p.bg, bg = p.honey })
	set("Delimiter", { fg = p.muted })

	-- Legacy syntax
	set("SpellBad", { undercurl = true })
	set("Comment", { fg = p.comment, italic = true })
	set("Constant", { fg = p.fg_alt })
	set("String", { fg = p.green })
	set("Character", { fg = p.green })
	set("Number", { fg = p.honey })
	set("Boolean", { fg = p.honey })
	set("Float", { fg = p.honey })
	set("Identifier", { fg = p.fg })
	set("Function", { fg = p.honey_dark })
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
	set("Type", { fg = p.honey_light })
	set("StorageClass", { fg = p.honey_light })
	set("Structure", { fg = p.honey_light })
	set("Typedef", { fg = p.honey_light })
	set("Special", { fg = p.honey })
	set("SpecialComment", { fg = p.fg_alt, italic = true })
	set("Underlined", { fg = p.blue, underline = true })
	set("Ignore", { fg = p.comment })
	set("Error", { fg = p.red })
	set("Todo", { fg = p.honey, bg = p.bg_alt, italic = true })
	set("gitHashAbbrev", { fg = p.honey_light })

	set("DiagnosticError", { fg = p.red })
	set("DiagnosticWarn", { fg = p.honey })
	set("DiagnosticInfo", { fg = p.blue })
	set("DiagnosticHint", { fg = p.blue })
	set("DiagnosticOk", { fg = p.green })
	set("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
	set("DiagnosticUnderlineWarn", { sp = p.honey, undercurl = true })
	set("DiagnosticUnderlineInfo", { sp = p.blue, undercurl = true })
	set("DiagnosticUnderlineHint", { sp = p.blue, undercurl = true })

	set("Added", { fg = p.blue })
	set("Changed", { fg = p.honey })
	set("Removed", { fg = p.red })
	set("DiffAdd", { fg = p.blue, bg = p.bg_alt })
	set("DiffChange", { fg = p.honey, bg = p.bg_alt })
	set("DiffDelete", { fg = p.red, bg = p.bg_alt })
	set("DiffText", { fg = p.honey_light, bg = p.bg_highlight })

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

	-- Basic NvimTree Integration:
	set("NvimTreeNormal", { fg = p.fg, bg = bg1 })
	set("NvimTreeNormalFloat", { fg = p.fg, bg = bg1 })
	set("NvimTreeEndOfBuffer", { fg = p.bg_alt, bg = bg1 })
	set("NvimTreeWinSeparator", { fg = p.border, bg = bg1 })

	set("NvimTreeRootFolder", { fg = p.honey, bold = true })
	set("NvimTreeFolderName", { fg = p.blue })
	set("NvimTreeEmptyFolderName", { fg = p.muted })
	set("NvimTreeIndentMarker", { fg = p.border })

	set("NvimTreeSpecialFile", { fg = p.honey_light, underline = true })
	set("NvimTreeImageFile", { fg = p.fg_alt })
	set("NvimTreeSymlink", { fg = p.blue })
	set("NvimTreeExecFile", { fg = p.green })

	set("NvimTreeGitDirty", { fg = p.honey })
	set("NvimTreeGitNew", { fg = p.green })
	set("NvimTreeGitDeleted", { fg = p.red })
end

return M
