local config = {}

function config.theme()
	local present, catppuccin = pcall(require, "catppuccin")
	if not present then return end

	vim.g.catppuccin_flavour = "mocha"

	catppuccin.setup {
		transparent_background = true,
		color_overrides = {
			mocha = {
				base = "#131313",
			},
		},
		custom_highlights = {
			VertSplit = { fg = "#313244" },
			CmpBorder = { fg = "#3e4145" },
		},
		term_colors = true,
		compile = {
			enabled = true,
		},
		integrations = {
			nvimtree = {
				enabled = false,
			},
			-- dap = {
			-- 	enabled = true,
			-- 	enable_ui = true,
			-- },
			lsp_saga = true,
			leap = true,
			neogit = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
		},
	}

	vim.api.nvim_command "colorscheme catppuccin"
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

return config
