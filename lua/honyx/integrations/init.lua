local utils = require("honyx.utils")

local integrations = {
	require("honyx.integrations.nvimtree"),
}

local M = {}

function M.load(palette)
	local highlights = {}
	for _, mod in ipairs(integrations) do
		highlights = utils.merge(highlights, mod.get(palette))
	end
	return highlights
end

return M
