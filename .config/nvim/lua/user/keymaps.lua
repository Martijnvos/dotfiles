local map_key = vim.keymap.set

-- Leader key config
-- Use space as a leader key to make extra key combinations possible
vim.g.mapleader = " "

-- Opens a new tab with the current buffer's path
-- Super useful when editing files in the same directory
map_key("", "<leader>te", ':tabedit <c-r>=expand("%:p:h")<cr>/')

-- Remaining remaps
-- Yank until last non-blank character of line
map_key("n", "Y", "yg_")

-- Center on search and line joining
map_key("n", "n", "nzzzv")
map_key("n", "N", "Nzzzv")
map_key("n", "J", "mzJ`z")

-- Undo with breakpoints
map_key("i", ",", ",<c-g>u")
map_key("i", ".", ".<c-g>u")
map_key("i", "!", "!<c-g>u")
map_key("i", "?", "?<c-g>u")

-- Repeat renaming with .
map_key("n", "cn", "*``cgn")
map_key("n", "cN", "*``cgN")

-- Prevent w from being necessary when moving between windows
map_key("", "<C-j>", "<C-w>j")
map_key("", "<C-k>", "<C-w>k")
map_key("", "<C-h>", "<C-w>h")
map_key("", "<C-l>", "<C-w>l")
