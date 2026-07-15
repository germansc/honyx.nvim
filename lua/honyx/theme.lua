local utils = require("honyx.utils")
local integrations = require("honyx.integrations")

local M = {}

local function apply_style(highlights, groups, style)
	if not style or next(style) == nil then
		return
	end

	for _, group in ipairs(groups) do
		highlights[group] = utils.merge(highlights[group], style)
	end
end

local function apply_overrides(highlights, overrides)
	for group, spec in pairs(overrides or {}) do
		highlights[group] = utils.merge(highlights[group] or {}, spec)
	end
end

function M.build(config, p)
	local highlights = {
		Normal = { fg = p.fg, bg = p.bg },
		NormalFloat = { fg = p.fg, bg = p.bg_alt },
		FloatBorder = { fg = p.border, bg = p.bg_alt },
		FloatTitle = { fg = p.blue, bg = p.bg_alt },
		ColorColumn = { bg = p.bg_alt },
		Conceal = { fg = p.muted },
		CursorLine = { bg = p.bg_alt },
		CursorColumn = { bg = p.bg_alt },
		CursorLineNr = { fg = p.fg, bg = p.bg_alt },
		Directory = { fg = p.blue },
		EndOfBuffer = { fg = p.onyx },
		ErrorMsg = { fg = p.red },
		WinSeparator = { fg = p.border },
		Folded = { fg = p.muted, bg = p.bg_alt },
		FoldColumn = { fg = p.muted, bg = p.bg },
		SignColumn = { fg = p.muted, bg = p.bg },
		IncSearch = { fg = p.onyx, bg = p.honey_light, bold = true },
		LineNr = { fg = p.comment, bg = p.bg },
		MatchParen = { fg = p.honey_light, bg = p.bg_highlight, bold = true },
		ModeMsg = { fg = p.fg },
		MoreMsg = { fg = p.blue },
		NonText = { fg = p.border },
		Pmenu = { fg = p.muted, bg = p.bg_alt },
		PmenuSel = { fg = p.onyx, bg = p.honey_light },
		PmenuSbar = { bg = p.bg_highlight },
		PmenuThumb = { bg = p.border },
		Question = { fg = p.blue },
		Search = { fg = p.onyx, bg = p.blue, bold = true },
		SpecialKey = { fg = p.muted },
		StatusLine = { fg = p.fg_alt, bg = p.bg_alt },
		StatusLineNC = { fg = p.muted, bg = p.bg_alt },
		TabLine = { fg = p.muted, bg = p.bg_alt },
		TabLineFill = { bg = p.bg_alt },
		TabLineSel = { fg = p.blue, bg = p.bg_highlight },
		Title = { fg = p.honey },
		Visual = { bg = p.bg_visual },
		WarningMsg = { fg = p.honey },
		Whitespace = { fg = p.border },
		WildMenu = { fg = p.onyx, bg = p.honey_dark },
		Delimiter = { fg = p.muted },

		SpellBad = { undercurl = true, sp = "NONE" },
		Comment = { fg = p.comment, italic = true },
		Constant = { fg = p.fg_alt },
		String = { fg = p.green },
		Character = { fg = p.green },
		Number = { fg = p.honey_dark },
		Boolean = { fg = p.honey_dark },
		Float = { fg = p.honey_dark },
		Identifier = { fg = p.fg },
		Function = { fg = p.honey },
		Statement = { fg = p.muted },
		Conditional = { fg = p.muted },
		Repeat = { fg = p.muted },
		Label = { fg = p.muted },
		Operator = { fg = p.muted },
		Keyword = { fg = p.muted },
		Exception = { fg = p.red },
		PreProc = { fg = p.muted },
		Include = { fg = p.muted },
		Define = { fg = p.muted },
		Macro = { fg = p.muted },
		PreCondit = { fg = p.muted },
		Type = { fg = p.honey_light },
		StorageClass = { fg = p.honey_light },
		Structure = { fg = p.honey_light },
		Typedef = { fg = p.honey_light },
		Special = { fg = p.honey },
		SpecialComment = { fg = p.fg_alt, italic = true },
		Underlined = { fg = p.blue, underline = true },
		Ignore = { fg = p.comment },
		Error = { fg = p.red },
		Todo = { fg = p.honey, bg = p.onyx_alt, italic = true },
		gitHashAbbrev = { fg = p.honey_light },

		DiagnosticError = { fg = p.red },
		DiagnosticWarn = { fg = p.honey_dark },
		DiagnosticInfo = { fg = p.blue },
		DiagnosticHint = { fg = p.blue },
		DiagnosticOk = { fg = p.green },
		DiagnosticUnderlineError = { sp = p.red, undercurl = true },
		DiagnosticUnderlineWarn = { sp = p.honey, undercurl = true },
		DiagnosticUnderlineInfo = { sp = p.blue, undercurl = true },
		DiagnosticUnderlineHint = { sp = p.blue, undercurl = true },

		Added = { fg = p.blue },
		Changed = { fg = p.honey },
		Removed = { fg = p.red },
		DiffAdd = { fg = p.blue, bg = p.onyx_alt },
		DiffChange = { fg = p.honey, bg = p.onyx_alt },
		DiffDelete = { fg = p.red, bg = p.onyx_alt },
		DiffText = { fg = p.honey_light, bg = p.bg_highlight },

		CurSearch = { link = "IncSearch" },
		CursorIM = { link = "CursorLine" },
		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
		DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
		DiagnosticFloatingHint = { link = "DiagnosticHint" },
		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticSignWarn = { link = "DiagnosticWarn" },
		DiagnosticSignInfo = { link = "DiagnosticInfo" },
		DiagnosticSignHint = { link = "DiagnosticHint" },
		DiagnosticVirtualTextError = { link = "DiagnosticError" },
		DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
		DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
		DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

		["@comment"] = { link = "Comment" },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@string"] = { link = "String" },
		["@string.escape"] = { link = "Special" },
		["@character"] = { link = "Character" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { link = "Identifier" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		["@function.call"] = { link = "Function" },
		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@operator"] = { link = "Operator" },
		["@type"] = { link = "Type" },
		["@type.builtin"] = { link = "Type" },
		["@constructor"] = { link = "Type" },
		["@property"] = { link = "Identifier" },
		["@field"] = { link = "Identifier" },
		["@parameter"] = { link = "Identifier" },
		["@punctuation"] = { link = "Delimiter" },
		["@punctuation.bracket"] = { link = "Delimiter" },
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@tag"] = { link = "Type" },
		["@tag.attribute"] = { link = "Identifier" },
		["@markup.heading"] = { link = "Title" },
		["@markup.link"] = { link = "Underlined" },
		["@markup.raw"] = { link = "String" },
	}

	highlights = utils.merge(highlights, integrations.load(p))

	apply_style(highlights, { "Comment", "SpecialComment" }, config.styles and config.styles.comments)
	apply_style(highlights, { "Function" }, config.styles and config.styles.functions)
	apply_style(highlights, {
		"Statement",
		"Conditional",
		"Repeat",
		"Label",
		"Keyword",
		"PreProc",
		"Include",
		"Define",
		"Macro",
		"PreCondit",
	}, config.styles and config.styles.keywords)

	apply_overrides(highlights, config.overrides)

	return highlights
end

return M
