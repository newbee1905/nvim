local config = {}

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

return config
