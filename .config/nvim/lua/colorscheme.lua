local gruvbox_contrast_dark = "hard"

vim.api.nvim_cmd({
  cmd = "colorscheme",
  args = {"gruvbox"}
}, {})

vim.api.nvim_cmd({
  cmd = "highlight",
  args = {"Normal", "ctermbg=0"}
}, {})
