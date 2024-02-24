local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Functional
  "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
  "hrsh7th/nvim-cmp", -- Autocompletion plugin
  "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
  "L3MON4D3/LuaSnip", -- Snippets plugin

  "Decodetalkers/csharpls-extended-lsp.nvim", -- C# LSP decompilation support

  "tpope/vim-surround",
  "tpope/vim-commentary",
  "editorconfig/editorconfig-vim",

  -- Appearance
  "morhetz/gruvbox",
})
