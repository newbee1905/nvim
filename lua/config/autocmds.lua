-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local map = vim.keymap.set

vim.cmd.abb("W SudaWrite") -- change to map("ca") in the future
-- Center cursor
map("n", "<C-d>", "<C-d>zz")

map("n", "<A-h>", "<c-w>5<")
map("n", "<A-l>", "<C-w>5>")
map("n", "<A-s-h>", "<c-w>-")
map("n", "<A-s-l>", "<c-w>+")

-- nvimtree
map("n", "<C-n>", ":NvimTreeToggle<CR>")
