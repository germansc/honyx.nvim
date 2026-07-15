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
	local user_opts = type(raw_opts) == "table" and raw_opts or {}
	local user_config = {
		styles = to_table(user_opts.styles),
		overrides = to_table(user_opts.overrides),
	}

	if user_opts.transparent ~= nil then
		user_config.transparent = not not user_opts.transparent
	end

	return utils.merge(DEFAULTS, user_config)
end

return M
