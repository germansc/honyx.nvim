local M = {}

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

function M.merge(base, overrides)
	if not overrides then
		return base
	end

	local result = {}
	for k, v in pairs(base) do
		result[k] = v
	end

	for k, v in pairs(overrides) do
		if type(v) == "table" and type(base[k]) == "table" then
			result[k] = M.merge(base[k], v)
		else
			result[k] = v
		end
	end
	return result
end

return M
