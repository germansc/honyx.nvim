local M = {}

M.onyx = "#0f0f10"
M.onyx_alt = "#1a1a1c"

-- M.bg key is resolved and set to either M.onyx or "NONE" on M.resolve.
-- M.bg_alt key is resolved and set to either M.onyx_alt or "NONE" on M.resolve.
M.bg_highlight = "#22262b"
M.bg_visual = "#2a2f35"

M.border = "#30353c"
M.muted = "#808590"
M.comment = "#606367"

M.fg = "#F5F5FF"
M.fg_alt = "#c8cad4"

M.honey = "#efc983"
M.honey_light = "#f3d8a5"
M.honey_dark = "#d4aa6e"

M.green = "#78dbb8"
M.blue = "#9ab8d4"
M.red = "#D96868"

--- Resolve transparency and return a palette with semantic bg/bg_alt keys.
function M.resolve(config)
	return vim.tbl_extend("force", M, {
		bg = config.transparent and "NONE" or M.onyx,
		bg_alt = config.transparent and "NONE" or M.onyx_alt,
	})
end

return M
