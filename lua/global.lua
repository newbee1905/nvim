local paths = {}
local home    = os.getenv("HOME")
local path_sep = paths.is_windows and '\\' or '/'
local os_name = vim.loop.os_uname().sysname
local stdpath = vim.fn.stdpath

function paths:load_variables()
	self.is_mac      = os_name == 'Darwin'
	self.is_linux    = os_name == 'Linux'
	self.is_windows  = os_name == 'Windows'
	self.vim_path    = stdpath('config')
	self.cache_dir   = stdpath('cache') .. path_sep
	self.modules_dir = self.vim_path .. path_sep .. 'modules'
	self.path_sep = path_sep
	self.home = home
	self.data_dir = string.format('%s/site/', stdpath('data'))
	self.packer_dir = self.cache_dir .. 'packer_compiled' .. path_sep
end

paths:load_variables()

return paths
