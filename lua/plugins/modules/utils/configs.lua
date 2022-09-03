local config = {}

function config.impatient() require 'impatient'.enable_profile() end

function config.undotree()
	local map = vim.keymap.set
	map('n', '<leader>u', '<CMD>UndotreeToggle<CR>')
end

function config.telescope()
	local map = vim.keymap.set

	local defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = " 	 ",
		selection_caret = "	",
		entry_prefix = "	",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		file_sorter = require "telescope.sorters".get_fuzzy_file,
		file_ignore_patterns = { "node_modules", "dist/static" },
		generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require "telescope.previewers".vim_buffer_cat.new,
		grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
		qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker,
	}

	map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
	map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>')
	map('n', '<leader>fb', '<CMD>Telescope buffers<CR>')
	map('n', '<leader>fh', '<CMD>Telescope help_tag<CR>')

	require 'telescope'.setup {
		defaults = defaults,
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			}
		}
	}

	require 'telescope'.load_extension "fzf"
	-- require 'telescope'.load_extension "packer"
end

function config.comment()
	local comment = require('Comment')
	comment.setup()
end

function config.zen_mode()
	require 'zen-mode'.setup {
		window = {
			backdrop = 0.8,
			width = 120,
			height = 1,
			options = {
				signcolumn = "yes",
				number = false,
				relativenumber = false,
			}
		},
		-- callback where you can add custom code when the Zen window opens
		on_open = function(win)
		end,
		-- callback where you can add custom code when the Zen window closes
		on_close = function()
		end,
	}
end

function config.nvim_gps()
	local conf = {
		disable_icons = false, -- Setting it to true will disable all icons

		icons = {
			["class-name"] = ' ', -- Classes and class-like objects
			["function-name"] = ' ', -- Functions
			["method-name"] = ' ', -- Methods (functions inside class-like objects)
			["container-name"] = '⛶ ', -- Containers (example: lua tables)
			["tag-name"] = '炙' -- Tags (example: html tags)
		},

		-- Add custom configuration per language or
		-- Disable the plugin for a language
		-- Any language not disabled here is enabled by default
		languages = {
			-- Some languages have custom icons
			["json"] = {
				icons = {
					["array-name"] = ' ',
					["object-name"] = ' ',
					["null-name"] = '[] ',
					["boolean-name"] = 'ﰰﰴ ',
					["number-name"] = '# ',
					["string-name"] = ' '
				}
			},
			["latex"] = {
				icons = {
					["title-name"] = "# ",
					["label-name"] = " ",
				},
			},
			["norg"] = {
				icons = {
					["title-name"] = " ",
				},
			},
			["toml"] = {
				icons = {
					["table-name"] = ' ',
					["array-name"] = ' ',
					["boolean-name"] = 'ﰰﰴ ',
					["date-name"] = ' ',
					["date-time-name"] = ' ',
					["float-name"] = ' ',
					["inline-table-name"] = ' ',
					["integer-name"] = '# ',
					["string-name"] = ' ',
					["time-name"] = ' '
				}
			},
			["verilog"] = {
				icons = {
					["module-name"] = ' '
				}
			},
			["yaml"] = {
				icons = {
					["mapping-name"] = ' ',
					["sequence-name"] = ' ',
					["null-name"] = '[] ',
					["boolean-name"] = 'ﰰﰴ ',
					["integer-name"] = '# ',
					["float-name"] = ' ',
					["string-name"] = ' '
				}
			},
			["yang"] = {
				icons = {
					["module-name"] = " ",
					["augment-path"] = " ",
					["container-name"] = " ",
					["grouping-name"] = " ",
					["typedef-name"] = " ",
					["identity-name"] = " ",
					["list-name"] = "﬘ ",
					["leaf-list-name"] = " ",
					["leaf-name"] = " ",
					["action-name"] = " ",
				}
			},
		},

		separator = ' > ',

		-- limit for amount of context shown
		-- 0 means no limit
		depth = 0,

		-- indicator used when context hits depth limit
		depth_limit_indicator = ".."
	}
	require 'nvim-gps'.setup(conf)
end

function config.accelerated_jk()
	require('accelerated-jk').setup()
end

function config.neoscroll()
	require('neoscroll').setup()
end

function config.better_escape()
	require 'better_escape'.setup {
		mapping = { "jk", "kj" },
		timeout = vim.o.timeoutlen,
		clear_empty_lines = true,
		keys = "<Esc>",
	}
end

function config.nvim_autpairs()
	local npairs = require('nvim-autopairs')
	local Rule = require('nvim-autopairs.rule')
	local ts_conds = require('nvim-autopairs.ts-conds')

	npairs.setup({
		map_bs = true,
		map_cr = true,
		map_c_h = true,
		map_c_w = true,
		disable_filetype = { "TelescopePrompt", "vim" },
		check_ts = true,
		ts_config = {
			lua = { 'string' }, -- it will not add a pair on that treesitter node
			javascript = { 'template_string' },
			java = false, -- don't check treesitter on java
		}
	})

	-- press % => %% only while inside a comment or string
	npairs.add_rules({
		Rule("%", "%", "lua")
				:with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
		Rule("$", "$", "lua")
				:with_pair(ts_conds.is_not_ts_node({ 'function' }))
	})
end

function config.lightspeed()
	require 'lightspeed'.setup {
		ignore_case = false,
		exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },
		--- s/x ---
		jump_to_unique_chars = { safety_timeout = 400 },
		match_only_the_start_of_same_char_seqs = true,
		force_beacons_into_match_width = false,
		-- Display characters in a custom way in the highlighted matches.
		substitute_chars = { ['\r'] = '¬', },
		-- Leaving the appropriate list empty effectively disables "smart" mode,
		-- and forces auto-jump to be on or off.
		safe_labels = {},
		labels = {},
		-- These keys are captured directly by the plugin at runtime.
		special_keys = {
			next_match_group = '<space>',
			prev_match_group = '<tab>',
		},
		--- f/t ---
		limit_ft_matches = 4,
		repeat_ft_with_target_char = false,
	}
end

function config.cp()
end

return config
