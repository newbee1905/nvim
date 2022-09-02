return function(packer)
	return function(plugin)
		return function(opts)
			opts = opts or {}
			if not opts[1] or fn.isdirectory(fn.expand(opts[1])) == 0 then opts[1] = plugin end
			if type(opts.setup) == "string" then
				opts.setup = "lazy'"..opts.setup.."'"
			end
			if opts.setup then opts.opt = true end

			packer.use(opts)
		end
	end
end
