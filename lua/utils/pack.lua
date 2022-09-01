local cmd, fn, uv, defer_fn = vim.cmd, vim.fn, vim.loop, vim.defer_fn
local data_dir = require'global'.data_dir
local vim_path = require'global'.vim_path

local M = {}

local present, packer = pcall(require, 'packer')

if not present then
	local packer_dir = data_dir .. 'pack/packer/opt/packer.nvim'
	local state = uv.fs_stat(packer_dir)

	if not state then
		fn.system({
			'git',
			'clone',
			'https://github.com/wbthomason/packer.nvim',
			'--depth',
			'20',
			packer_dir,
		})

		uv.fs_mkdir(data_dir .. 'lua', 511 , function()
			assert("make compile path dir faield")
		end)
	end

	cmd [[packad packer.nvim]]
	present, packer = pcall(require, 'packer')

	if present then
		print('Packer cloned successfully.')
	else
		error("Couldn't clone packer !\nPacker path: " .. packer_dir .. '\n' .. packer)
	end
end

M.packer = packer

M.packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
		prompt_border = 'rounded',
	},
	git = {
		clone_timeout = 400,
	},
	profile = {
		enable = true,
  },
	package_root = data_dir .. 'pack',
	compile_path = data_dir .. 'lua/nvim_compiled.lua',
	auto_clean = true,
	compile_on_sync = true,
})

M.lazy = function(plugin, timer)
	if plugin then
		timer = timer or 0
		defer_fn(function()
			require'packer'.loader(plugin)
		end, timer)
	end
end

M.use = function(plugin)
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

return M
