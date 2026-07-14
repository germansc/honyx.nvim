--- Auto-discovers and loads plugin integration highlight modules.
---
--- To add a new integration:
---   create a `lua/honyx/integrations/<name>.lua` with `M.get(palette)`.
local utils = require("honyx.utils")

local M = {}

--- @type table<string, { get: fun(palette: table): table }>
local integration_modules = {}
local loaded = false

--- Find all integration modules by scanning `lua/honyx/integrations/`
--- across every entry in `runtimepath`.
--- @return string[] sorted integration names (without .lua extension)
local function discover()
	local seen = {}
	for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
		local files = vim.fn.globpath(rtp .. "/lua/honyx/integrations", "*.lua", false, true)
		for _, file in ipairs(files) do
			local name = vim.fn.fnamemodify(file, ":t:r")
			if name ~= "init" then
				seen[name] = true
			end
		end
	end
	local result = {}
	for name in pairs(seen) do
		table.insert(result, name)
	end
	table.sort(result)
	return result
end

--- Load and merge all discovered integration highlights.
---
--- @param palette table  Resolved palette (bg/bg_alt already reflect transparency).
---                       Passed by `theme.build()` after applying `bg0`/`bg1`.
--- @return table  Merged highlight groups from every integration module.
function M.load(palette)
	if not loaded then
		for _, name in ipairs(discover()) do
			local ok, mod = pcall(require, "honyx.integrations." .. name)
			if ok and mod.get then
				integration_modules[name] = mod
			end
		end
		loaded = true
	end

	local highlights = {}
	for _, mod in pairs(integration_modules) do
		highlights = utils.merge(highlights, mod.get(palette))
	end
	return highlights
end

return M
