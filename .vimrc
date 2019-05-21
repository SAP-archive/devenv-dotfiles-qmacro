" vim-plug configuration
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'morhetz/gruvbox'

" Add plugins to &runtimepath
call plug#end()

set nocompatible
syntax on
filetype plugin indent on

set background=dark
colorscheme gruvbox
set encoding=utf-8
set ts=4
set shiftwidth=4
set number relativenumber
set splitbelow splitright
set linebreak

let mapleader = ","

" Prevent any use of the cursor keys by mapping them to 'no operation'
noremap <Up>    <nop>
noremap <Down>  <nop>
noremap <Left>  <nop>
noremap <Right> <nop>

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" Automatically turn on auto-save for markdown files (so I can live preview them)
autocmd FileType markdown let g:auto_save = 0

" Integrate Limelight with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Shortcutting split navigation, saves a keypress
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Edit and source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" Remove all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Check leading whitespace
set listchars=tab:▸·,eol:¬
nnoremap <leader>l :set list!<cr>

" Abbreviations
iabbrev scp SAP Cloud Platform
iabbrev s4h S/4HANA
iabbrev sbs side-by-side
iabbrev s4s S/4HANA Cloud SDK
iabbrev hosd https://bit.ly/handsonsapdev

" Quick insertions of various patterns when writing markdown
autocmd FileType markdown inoremap ii -<space>[<space>]<space>
autocmd FileType markdown inoremap ppp :point_right:<space>

" To enable project/folder specific vimrc settings
" (see https://andrew.stwrt.ca/posts/project-specific-vimrc/)
"set exrc

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 0
let g:airline#extension#ale#enabled = 1

nnoremap <silent> <leader>ll :call LocationToggle()<cr>
nnoremap <silent> <leader>gd :ALEGoToDefinition<cr>
nnoremap <silent> <leader>fr :ALEFindReferences<cr>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Bind Ctrl-P to use fzf 'Files' command now
nnoremap <c-p> :Files<cr>

" Improve search UI
set hlsearch incsearch
