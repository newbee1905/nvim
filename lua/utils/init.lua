utils = {}

function utils:shallow_copy(orig)
	local copy
	if type(orig) == 'table' then
		copy = {}
		for i = 1, #orig do
			copy[i] = orig[i]
		end
	else -- number, string, etc.
		copy = org
	end
	return copy
end

return utils
