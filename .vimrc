set nocompatible   " be iMproved
filetype off       " required!

" full colours in ubuntu
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" automatically reload file when it is changed on disk
set autoread
au CursorHold * checktime

" autoload vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'mxw/vim-jsx'
Plug 'airblade/vim-gitgutter'

Plug 'danieljharvey/vim-mimsa'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'tag': '0.1.155',
    \ 'do': 'bash install.sh',
    \ }

" colour schemes and shit
Plug 'flazz/vim-colorschemes'
Plug 'Rigellute/rigel'
Plug 'challenger-deep-theme/vim'
Plug 'morhetz/gruvbox'

Plug 'sainnhe/everforest'

let g:everforest_background = 'hard'
set background=dark

Plug 'arcticicestudio/nord-vim'

Plug 'othree/javascript-libraries-syntax.vim'
Plug 'jelera/vim-javascript-syntax'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'tpope/vim-unimpaired'

Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'luochen1990/rainbow'

Plug 'vmchale/dhall-vim'
Plug 'LnL7/vim-nix'
Plug 'idris-hackers/idris-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'mpickering/hlint-refactor-vim'

" Erlang
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'elixir-editors/vim-elixir'
Plug 'hashivim/vim-terraform'

" Wasm
Plug 'rhysd/vim-wasm'

" Rust
Plug 'rust-lang/rust.vim'

" MDX (markdown)
Plug 'jxnblk/vim-mdx-js'

" make Samir happy
Plug 'axelf4/vim-strip-trailing-whitespace'

if has('nvim')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'

  " Find files using Telescope command-line sugar.
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>t <cmd>Telescope <cr>
endif

let g:rustfmt_autosave = 1

" Change into symbols

let g:javascript_conceal_function     = "f"

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" PureScript
Plug 'raichoo/purescript-vim'
syntax on
filetype on
filetype plugin indent on

let purescript_indent_if = 3
let purescript_indent_case = 5
let purescript_indent_let = 4
let purescript_indent_where = 6
let purescript_indent_do = 3
let purescript_indent_in = 1
let purescript_indent_dot = v:true

" Autosave purescript files with purty
autocmd filetype purescript nm <buffer> <silent> ,h :!purty --write %<CR>


Plug 'FrigoEU/psc-ide-vim'
let g:psc_ide_syntastic_mode = 1
"
nm <buffer> <silent> <leader>L :Plist<CR>
nm <buffer> <silent> <leader>l :Pload!<CR>
nm <buffer> <silent> <leader>r :Prebuild!<CR>
nm <buffer> <silent> <leader>f :PaddClause<CR>
nm <buffer> <silent> <leader>t :PaddType<CR>
nm <buffer> <silent> <leader>a :Papply<CR>
nm <buffer> <silent> <leader>A :Papply!<CR>
nm <buffer> <silent> <leader>C :Pcase!<CR>
nm <buffer> <silent> <leader>i :Pimport<CR>
nm <buffer> <silent> <leader>qa :PaddImportQualifications<CR>
nm <buffer> <silent> <leader>g :Pgoto<CR>
nm <buffer> <silent> <leader>p :Pursuit<CR>
nm <buffer> <silent> <leader>T :Ptype<CR>

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" ocaml support
Plug 'ocaml/vim-ocaml'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

autocmd StdinReadPre * let s:std_in=1


filetype plugin indent on  " required!

set bs=2
set sw=2
set number
" shows row and column number at bottom right corner
set ruler

" set tabs to be 4 spaces
"set tabstop=2
"set expandtab

let g:lightline = {
      \ 'colorscheme': 'everforest',
  \ }

" new things to try
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '/install -all' }
Plug 'tpope/vim-surround'

set colorcolumn=+1
set copyindent
set expandtab
set grepprg=rg\ --vimgrep
set laststatus=2
set noswapfile
set number
set relativenumber
set shiftwidth=2
set tabstop=2
set textwidth=79
set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing

" initialise plugins
call plug#end()

autocmd BufNewFile,BufRead *.mimsa   set syntax=mimsa

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark

colorscheme everforest

