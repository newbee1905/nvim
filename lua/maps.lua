local map = vim.keymap.set

--[[ Needed Mappings ]]
-- use ESC to turn off search highlighting
map("n", "<Esc>", ":noh <CR>")
-- Don't copy the replaced text after pasting in visual mode
map('v', 'p', 'p:let @+=@0<CR>')

--[[ buffer ]]
map('n', '<C-j>', '<CMD>wincmd w<CR>')
map('n', '<C-k>', '<CMD>wincmd W<CR>')
map('n', ']b', '<CMD>bp<CR>')
map('n', '[b', '<CMD>bn<CR>')

--[[ copy terminal mapping to insert mode and command mode ]]
map('c', '<C-h>', '<BS>')
map('c', '<C-b>', '<Left>')
map('c', '<C-f>', '<Right>')
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')
map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')
map('i', '<C-h>', '<BS>')
map('i', '<C-b>', '<Left>')
map('i', '<C-f>', '<Right>')
map('i', '<C-a>', '<ESC>I')
map('i', '<C-e>', [[pumvisible() ? "\<C-e>" : "\<End>"]], { expr = true })

--[[ Terminal mapping ]]
map("t", "jk", "<C-\\><C-n>") -- get out of term mode
map("n", "<leader>h", "<CMD>execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>")
map("n", "<leader>v", "<CMD>execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>")
