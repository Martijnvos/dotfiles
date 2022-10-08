" Check if the vim-plug plugin manager is installed
" If not, install and configure it
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync
endif

" Add plugins using vim-plug
call plug#begin('~/.local/share/nvim/plugged')
  " Functional
  Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
  Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
  Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp

  Plug 'Decodetalkers/csharpls-extended-lsp.nvim' " C# LSP decompile support

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'editorconfig/editorconfig-vim'

  " Appearance
  Plug 'morhetz/gruvbox'
call plug#end()

" Lua requires
lua require('colorscheme')
lua require('keymaps')
lua require('options')
lua require('lsp')
lua require('autocomplete')
lua require('statusline')
lua require('autocommands')
