local fn, opt = vim.fn, vim.opt
local stdpath = fn.stdpath
local utils = require('utils')

local lazypath = stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

utils.leader_map()

require"lazy".setup {
	root = stdpath("data") .. "/lazy", -- directory where plugins will be installed
	spec = {{ import = "plugins" }},
	lockfile = stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	defaults = {
		version = nil
	},
	install = {
		missing = true,
	},
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		-- get a notification when new updates are found
		-- disable it as it's too annoying
		notify = false,
		-- check for updates every day
		frequency = 86400
	},
	change_detection = {
		enabled = true,
		notify = false
	},
	performance = {
		cache = {
			enabled = true
		}
	},
	state = stdpath("state") .. "/lazy/state.json" -- state info for checker and other things
}

require("autocmds")
require("maps")
require("options")
