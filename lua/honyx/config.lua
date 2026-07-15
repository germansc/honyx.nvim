local utils = require("honyx.utils")

local M = {}

local DEFAULTS = {
	transparent = false,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
	},
	overrides = {},
}

--- Coerce a raw value to a table.
local function to_table(v)
	return type(v) == "table" and v or {}
end

--- Build a validated config from user-supplied options.
--- @param raw_opts? table
--- @return table
function M.build(raw_opts)
	local opts = type(raw_opts) == "table" and raw_opts or {}
	local overrides = {
		styles = to_table(opts.styles),
		overrides = to_table(opts.overrides),
	}

	if opts.transparent ~= nil then
		overrides.transparent = not not opts.transparent
	end

	return utils.merge(DEFAULTS, overrides)
end

return M
