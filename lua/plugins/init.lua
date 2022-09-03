local paths = require 'utils.paths'
local data_dir, modules_dir = paths.data_dir, paths.modules_dir
local nvim_compiled = data_dir .. 'lua/nvim_compiled.lua'

local packer = nil

local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
	self.repos = {}

	local tmp = vim.split(fn.globpath(modules_dir, '*/plugins.lua'), '\n')
	for _, f in ipairs(tmp) do
		-- Add plugins into self.repos
		-- with register_plugin
		require(string.match(f, 'lua/(.+).lua$'))
	end
end

function Packer:load_packer()
	if not packer then
		cmd [[packadd packer.nvim]]
		packer = require('packer')
	end

	packer.init({
		display = {
			open_fn = function()
				return require 'packer.util'.float({ border = 'rounded' })
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
		compile_path = nvim_compiled,
		auto_clean = true,
		compile_on_sync = true,
	})
	packer.reset()

	local use = packer.use

	self:load_plugins()
	use({ 'wbthomason/packer.nvim', opt = true })
	for _, repo in ipairs(self.repos) do
		use(repo)
	end
end

function Packer:init_ensure_plugins()
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

		uv.fs_mkdir(data_dir .. 'lua', 511, function()
			assert("make compile path dir faield")
		end)
		self:load_packer()
		packer.sync()
	end
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		if not packer then
			Packer:load_packer()
		end
		return packer[key]
	end,
})

function plugins.ensure_plugins()
	Packer:init_ensure_plugins()
end

function plugins.register_plugin(repo)
	return function(opts)
		opts = opts or {}
		if not opts[1] or fn.isdirectory(fn.expand(opts[1])) == 0 then opts[1] = repo end
		if type(opts.setup) == "string" then
			opts.setup = "lazy'" .. opts.setup .. "'"
		end
		if opts.setup then opts.opt = true end

		table.insert(Packer.repos, opts)
	end
end

-- function plugins.compile_notify()
--   plugins.compile()
--   vim.notify('Compile Done!','info',{ title = 'Packer' })
-- end

function plugins.auto_compile()
	local file = vim.fn.expand('%:p')
	if not file:match(paths.vim_path) then
		return
	end

	if file:match('plugins.lua') or file:match('configs.lua') then
		plugins.clean()
	end
	plugins.compile()
	notify('Recompiled Succesfully', 'info', { title = 'Packer' })
	require('nvim_compiled')
end

function plugins.load_compile()
	if vim.fn.filereadable(nvim_compiled) == 1 then
		require('nvim_compiled')
	else
		notify('Run PackerSync or PackerCompile', 'info', { title = 'Packer' })
	end

	local cmds = {
		'Compile',
		'Install',
		'Update',
		'Sync',
		'Clean',
		'Status',
	}
	for _, cmd in ipairs(cmds) do
		api.nvim_create_user_command('Packer' .. cmd, function()
			require('plugins')[fn.tolower(cmd)]()
		end, {})
	end

	local PackerHooks = vim.api.nvim_create_augroup('PackerHooks', {})
	vim.api.nvim_create_autocmd('User', {
		pattern = 'PackerCompileDone',
		callback = function()
			vim.notify('Compile Done!', vim.log.levels.INFO, { title = 'Packer' })
		end,
		group = PackerHooks,
	})
end

return plugins
