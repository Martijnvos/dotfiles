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

  --- C# LSP
  {
      "iabdelkareem/csharp.nvim",
      dependencies = {
          "williamboman/mason.nvim", -- Required, automatically installs omnisharp
          "mfussenegger/nvim-dap",
          "Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
      },
      config = function ()
          require("mason").setup() -- Mason setup must run before csharp
          require("csharp").setup({
              lsp = {
                  capabilities = require"user.lsp".capabilities,
                  on_attach = require"user.lsp".on_attach(client, bufnr, require("csharp").go_to_definition),
              }
          })
      end
  },

  "tpope/vim-surround",
  "tpope/vim-commentary",
  "editorconfig/editorconfig-vim",

  -- Appearance
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
})
