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

" General colorscheme
let gruvbox_contrast_dark='hard'
colorscheme gruvbox
highlight Normal ctermbg=0

set splitbelow splitright " Splits open at the bottom and right, instead of top and left
set number relativenumber " Show relative line numbering

set path+=** " For clever completion with the :find command
set cmdheight=2 " Give more space for displaying messages
set ignorecase smartcase " Use case insensitive search, except when using capital letters
set tabstop=4 " Tab size
set shiftwidth=4 " Determine indentation per level
set expandtab " Expand tab to spaces

if has('persistent_undo')
    set undofile    " keep an undo file (undo changes after closing)
endif

" Leader key config
" Use space as a leader key to make extra key combinations possible
let mapleader = " "

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Remaining remaps
" Yank until last non-blank character of line
nnoremap Y yg_

" Center on search and line joining
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo with breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Repeat renaming with .
nnoremap cn *``cgn
nnoremap cN *``cgN

" Prevent w from being necessary when moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Functions
fun! TrimTrailingWhitespace()
    if !&binary && &filetype != 'diff'
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endif
endfun

" Autocommands
augroup vimrc
    " Remove all autocommands for the current group
    au!

    " Jump to the last known cursor position.
    " Don't when the position is invalid, when inside an event handler and for a
    " commit message (it's likely a different one than last time).
    autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

    autocmd BufWritePre * :call TrimTrailingWhitespace()
    "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
augroup END

" Lua requires
lua require('lsp')
lua require('autocomplete')
lua require('statusline')
