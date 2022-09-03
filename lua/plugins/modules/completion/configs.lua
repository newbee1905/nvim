local config = {}

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

return config
