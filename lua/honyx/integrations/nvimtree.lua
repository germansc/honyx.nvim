local M = {}

function M.get(p)
	return {
		NvimTreeNormal = { fg = p.fg, bg = p.bg_alt },
		NvimTreeNormalFloat = { fg = p.fg, bg = p.bg_alt },
		NvimTreeEndOfBuffer = { fg = p.bg_alt, bg = p.bg_alt },
		NvimTreeWinSeparator = { fg = p.border, bg = p.bg_alt },
		NvimTreeRootFolder = { fg = p.honey, bold = true },
		NvimTreeFolderName = { fg = p.blue },
		NvimTreeEmptyFolderName = { fg = p.muted },
		NvimTreeIndentMarker = { fg = p.border },
		NvimTreeSpecialFile = { fg = p.honey_light, underline = true },
		NvimTreeImageFile = { fg = p.fg_alt },
		NvimTreeSymlink = { fg = p.blue },
		NvimTreeExecFile = { fg = p.green },
		NvimTreeGitDirty = { fg = p.honey },
		NvimTreeGitNew = { fg = p.green },
		NvimTreeGitDeleted = { fg = p.red },
	}
end

return M
