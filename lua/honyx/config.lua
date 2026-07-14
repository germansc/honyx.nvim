local utils = require("honyx.utils")

local M = {}

--- Return a table with the default configuration.
function M.defaults()
	return {
		transparent = false,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
		},
		overrides = {},
	}
end

--- Deep-merge two tables.
--- @param base table
--- @param overrides? table
--- @return table
function M.merge(base, overrides)
	return utils.merge(base, overrides)
end

return M
