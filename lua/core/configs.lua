local config = {}
local uv = vim.loop

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

	-- require'telescope'.load_extension "fzf"
	require 'telescope'.load_extension "packer"
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

function config.nvim_colorizer()
	require 'colorizer'.setup({
		"*",
	}, {
		mode = 'background',
		rgb_fn = 'true',
		RRGGBBAA = 'true',
	})

	vim.cmd [[ColorizerAttachToBuffer]]
end

function config.dashboard()
	local ascii = {
		'┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑',
		'│ ⠀⠀⠀⢀⣤⣶⣶⣶⣦⣤⣠⣴⣶⣾⡿⢷⣾⣿⣿⣿⣿⣿⣷⣶⣤⣀⠀⠀⠀⠀ │',
		'│ ⠀⠀⠀⢸⣿⣿⣿⣿⣿⡿⠿⣻⣟⣁⠤⠼⠟⢛⡻⢿⣿⣿⣿⣿⣿⣿⣿⣦⣤⡄ │',
		'│ ⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣯⣴⣾⣿⡶⠋⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇ │',
		'│ ⠀⠀⠀⢀⣾⣿⣿⣿⠟⣿⣿⣿⣿⣿⣿⡟⠁⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇ │',
		'│ ⠀⠀⢠⣿⣿⣿⡿⠃⣸⣿⣿⣿⣿⣿⣿⡤⠤⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇ │',
		'│ ⠀⠀⣾⣿⣿⠟⠑⠒⠛⠋⠉⠙⠋⠉⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇ │',
		'│ ⠀⢠⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠠⢤⣤⣤⣤⣀⡀⢹⣿⣿⣿⣿⣿⣿⣿⣿⡇ │',
		'│ ⠀⢸⣿⣿⡏⢩⣿⣶⠀⠀⠀⠀⠀⠀⠘⠿⠿⢿⠟⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⡇ │',
		'│ ⠀⣿⣿⡿⠁⠈⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇ │',
		'│ ⠀⣿⣿⡀⠀⠀⠀⠠⠔⠀⠢⠤⠤⠄⠀⠀⠀⠀⠀⢠⣿⠟⠛⠛⢿⣿⠛⢿⣿⡇ │',
		'│ ⠀⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃⠀⠀⠀⢸⡿⠒⠂⠙⠃ │',
		'│ ⠀⣿⡟⠛⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀⡠⣼⣇⣀⣠⣴⠆ │',
		'│ ⠀⢸⡇⠀⠈⢿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⠀⢊⣴⣿⣿⣿⣿⣿⡄ │',
		'│ ⠀⠈⣿⣠⣶⠟⢹⣿⣿⣶⣶⣤⣤⣄⠀⠀⠀⠀⢸⠁⠀⣴⣿⣿⣿⣿⣿⣿⣿⡇ │',
		'│ ⠀⠀⠉⠉⠀⠠⠿⠿⠿⠿⠿⠿⠿⠿⠇⠀⠀⠀⠸⠠⠾⠿⠿⠿⠿⠿⠿⠿⠿⠇ │',
		'┕━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┙',
	}

	local header = {
		type = "text",
		val = ascii,
		opts = {
			position = "center",
			hl = "AlphaHeader"
		}
	}

	local function button(sc, txt, keybind)
		local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

		local opts = {
			position = "center",
			text = txt,
			shortcut = sc,
			cursor = 5,
			width = 36,
			align_shortcut = "right",
			hl = "AlphaButtons",
		}

		if keybind then
			opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
		end

		return {
			type = "button",
			val = txt,
			on_press = function()
				local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
				vim.api.nvim_feedkeys(key, "normal", false)
			end,
			opts = opts,
		}
	end

	local buttons = {
		type = "group",
		val = {
			button("SPC f f", "	Find File  ", ":Telescope find_files<CR>"),
			button("SPC f o", "	Recent File  ", ":Telescope oldfiles<CR>"),
			button("SPC f w", "	Find Word  ", ":Telescope live_grep<CR>"),
			button("SPC b m", "	Bookmarks  ", ":Telescope marks<CR>"),
			button("SPC e s", "	Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
		},
		opts = {
			spacing = 1,
		},
	}

	local section = {
		header = header,
		buttons = buttons,
	}

	require 'alpha'.setup {
		layout = {
			{ type = "padding", val = 5 },
			section.header,
			{ type = "padding", val = 2 },
			section.buttons,
		},
		opts = {},
	}
end

function config.galaxyline()
	require('theme.statusline')
end

function config.indent_blankline()
	vim.g.indent_blankline_char = "▏"
	vim.g.indent_blankline_show_first_indent_level = false
	vim.g.indent_blankline_filetype_exclude = {
		"dashboard",
		"dotooagenda",
		"log",
		"gitcommit",
		"packer",
		"vimwiki",
		"markdown",
		"txt",
		"vista",
		"help",
		"todoist",
		"NvimTree",
		"peekaboo",
		"git",
		"TelescopePrompt",
		"undotree",
		"flutterToolsOutline",
		"" -- for all buffers without a file type
	}
	vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
	vim.g.indent_blankline_show_trailing_blankline_indent = false
	vim.g.indent_blankline_show_current_context = true
	vim.g.indent_blankline_context_patterns = {
		"class",
		"function",
		"method",
		"block",
		"list_literal",
		"selector",
		"^if",
		"^table",
		"if_statement",
		"while",
		"for"
	}
	-- because lazy load indent-blankline so need readd this autocmd
	vim.cmd [[autocmd CursorMoved * IndentBlanklineRefresh]]
end

function config.gitsigns()
	require 'gitsigns'.setup {
		signs                             = {
			add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
			change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
			delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
			topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
			changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		},
		signcolumn                        = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl                             = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl                            = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff                         = false, -- Toggle with `:Gitsigns toggle_word_diff`
		keymaps                           = {
			-- Default keymap options
			noremap = true,

			['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
			['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

			['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
			['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
			['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
			['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
			['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
			['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
			['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
			['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

			-- Text objects
			['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
			['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
		},
		watch_gitdir                      = {
			interval = 1000,
			follow_files = true
		},
		attach_to_untracked               = true,
		current_line_blame                = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts           = {
			virt_text = true,
			virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
		},
		current_line_blame_formatter_opts = {
			relative_time = false
		},
		sign_priority                     = 100,
		update_debounce                   = 100,
		status_formatter                  = nil, -- Use default
		max_file_length                   = 40000,
		preview_config                    = {
			-- Options passed to nvim_open_win
			border = 'single',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1
		},
		yadm                              = {
			enable = false
		}
	}
end

function config.presence()
	require 'presence':setup {
		neovim_image_text  = "Chad Text Editor",
		buttons            = {
			{
				label = "View my config here",
				url   = "https://github.com/newbee1905/nvim"
			},
		},
		enable_line_number = true,
	}
end

function config.nvim_treesitter()
	require 'nvim-treesitter.configs'.setup {
		ensure_installed = "all",
		ignore_install = { "ocaml", "ocaml_interface", "ocamllex", "phpdoc" },
		highlight = {
			enable = true,
			use_languagetree = true,
			disable = function(_, bufnr)
				return vim.api.nvim_buf_line_count(bufnr) > 50000
			end,
		},
		textobjects = {
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
	}
end

function config.vimtex()
	vim.g.tex_flavor = 'latex'
	vim.g.vimtex_view_method = 'zathura'
	vim.g.vimtex_quickfix_mode = 0
	vim.o.conceallevel = 2
	vim.g.tex_conceal = 'abdmg'
end

function config.orgmode()
	require 'orgmode'.setup_ts_grammar {}
	require 'orgmode'.setup {}
end

function config.coq_nvim()
	vim.g.coq_settings = {
		auto_start = 'shut-up',
		['display.icons.mode'] = 'none',
		keymap = {
			jump_to_mark = '<C-L>',
			bigger_preview = '<C-g>',
		}
	}
	vim.cmd [[COQnow]]
end

function config.nvim_lsp_installer()
	local nvim_lsp = require("lspconfig")
	vim.cmd [[silent! do FileType]]
	local coq = require('coq')
	local lsp_installer = require('nvim-lsp-installer')

	local on_attach = function(_, bufnr)
		local buf_set_option = function(...) vim.api.nvim_buf_set_option(bufnr, ...) end
		local map = vim.keymap.set

		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
		map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
		map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
		map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
		map('n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
		map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
		map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
		map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
		map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
		map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
		map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
		map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
		map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
		map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
		map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
		map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
		map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
	end

	-- Typical server that don't need extra configurations
	local servers = {
		'lemminx',
		'yamlls',
		'vuels',
		'pyright',
		-- 'tsserver',
		-- 'denols',
		'svelte',
		'cmake',
		'cssls',
		'texlab',
		-- 'solargraph',
		'html',
		'gopls',
		'rust_analyzer',
		'bashls',
		-- 'sumneko_lua',
		'omnisharp',
		'clangd',
		'vuels',
	}

	for i = 1, #servers do
		local server_is_found, server = lsp_installer.get_server(servers[i])
		if server_is_found then
			server:on_ready(function()
				server:setup(coq.lsp_ensure_capabilities {
					on_attach = on_attach,
					flags = {
						debounce_text_changes = 150,
					}
				})
			end)
			if not server:is_installed() then
				print("Installing " .. servers[i])
				server:install()
			end
		end
	end

	local _, sumneko_lua = lsp_installer.get_server('sumneko_lua')
	sumneko_lua:setup(coq.lsp_ensure_capabilities {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim', 'coq' },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file('', true),
					checkThirdParty = false,
					userThirdParty = {
						'OpenResty',
					},
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})

	local _, solargraph = lsp_installer.get_server('solargraph')
	solargraph:setup(coq.lsp_ensure_capabilities {
		on_attach = on_attach,
		filetypes = { "ruby", "rakefile" },
		root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
		settings = {
			solargraph = {
				autoformat = true,
				completion = true,
				diagnostic = true,
				-- folding = true,
				references = true,
				rename = true,
				symbols = true
			}
		}
	})

	local _, denols = lsp_installer.get_server('denols')
	denols:setup(coq.lsp_ensure_capabilities {
		on_attach = on_attach,
		root_dir = nvim_lsp.util.root_pattern("deno.jsonc", "deno.json"),
		init_options = {
			enable = true,
			lint = true,
		},
	})

	local _, tsserver = lsp_installer.get_server('tsserver')
	tsserver:setup(coq.lsp_ensure_capabilities {
		on_attach = on_attach,
		root_dir = nvim_lsp.util.root_pattern("package.json"),
		init_options = {
			enable = true,
			lint = true,
		},
	})

	local _, ltex = lsp_installer.get_server('ltex')
	ltex:setup(coq.lsp_ensure_capabilities {
		on_attach = on_attach,
		init_options = {
			enable = true,
			lint = true,
		},
	})

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
			:with_pair(ts_conds.is_ts_node({'string','comment'})),
		Rule("$", "$", "lua")
			:with_pair(ts_conds.is_not_ts_node({'function'}))
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
