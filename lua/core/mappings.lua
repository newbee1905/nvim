local utils = require('utils')

--[[ Needed Mappings ]]
-- use ESC to turn off search highlighting
utils:map("n", "<Esc>", ":noh <CR>")
-- Don't copy the replaced text after pasting in visual mode
utils:map('v', 'p', 'p:let @+=@0<CR>')
-- yank from current cursor to end of line
utils:map("n", "Y", "yg$")
-- Save file that require root permission
utils:map("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' | edit!<CR>")

--[[ buffer ]]
utils:map('n', '<C-j>', '<CMD>wincmd w<CR>')
utils:map('n', '<C-k>', '<CMD>wincmd W<CR>')
utils:map('n', ']b', '<CMD>bp<CR>')
utils:map('n', '[b', '<CMD>bn<CR>')

--[[ copy terminal mapping to insert mode and command mode ]]
utils:map('c', '<C-h>', '<BS>')
utils:map('c', '<C-b>', '<Left>')
utils:map('c', '<C-f>', '<Right>')
utils:map('c', '<C-a>', '<Home>')
utils:map('c', '<C-e>', '<End>')
utils:map('i', '<C-h>', '<BS>')
utils:map('i', '<C-b>', '<Left>')
utils:map('i', '<C-f>', '<Right>')
utils:map('i', '<C-a>', '<ESC>I')
utils:map('i', '<C-e>', [[pumvisible() ? "\<C-e>" : "\<End>"]], { expr = true })

--[[ Terminal mapping ]]
utils:map("t", "jk", "<C-\\><C-n>") -- get out of term mode
utils:map("n", "<leader>h", "<CMD>execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>")
utils:map("n", "<leader>v", "<CMD>execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>")
