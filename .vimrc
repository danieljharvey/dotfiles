set nocompatible   " be iMproved
filetype off       " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" full colours in ubuntu
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif


" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'jlanzarotta/bufexplorer'
Plugin 'mxw/vim-jsx'
Plugin 'flazz/vim-colorschemes'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'guns/vim-clojure-static'
" Plugin 'kien/rainbow_parentheses'
Plugin 'guns/vim-clojure-highlight'

Plugin 'luochen1990/rainbow'

" Haskell
" Plugin 'eagletmt/ghcmod-vim'
" Plugin 'eagletmt/neco-ghc'

Plugin 'neovimhaskell/haskell-vim'

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" HHVM / Hack
Plugin 'hhvm/vim-hack'

" Clojure
Plugin 'deraen/vim-cider'

" PureScript
Plugin 'raichoo/purescript-vim'
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

" Nerd tree
Plugin 'scrooloose/nerdtree'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Map Control-N to open NERDTree
map <silent> <C-n> :NERDTreeFocus<CR>

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

Plugin 'mileszs/ack.vim'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ReasonML
Bundle 'reasonml-editor/vim-reason'
au BufReadPost *.re set syntax=reason

" new ones
" Plugin 'christoomey/vim-tmux-navigator'

" Prettier support
" Plugin 'prettier/vim-prettier'

" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier

" let g:prettier#config#semi = 'false'
" let g:prettier#config#single_quote = 'true'

" Use NeoFormat to run prettier on JS/TS etc code
" Plugin 'sbdchd/neoformat'
" let g:neoformat_try_formatprg = 1

" augroup NeoformatAutoFormat
"    autocmd!
"    autocmd FileType javascript, typescript setlocal formatprg=prettier\
"                                         \--stdin\
"                                         \--single-quote\ 'true'\
"                                         \--semi\ 'false'\
"
"    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Neoformat

"augroup END


let g:jsx_ext_required = 0 " Allow JSX in normal JS files

autocmd StdinReadPre * let s:std_in=1


filetype plugin indent on  " required!

set bs=2
set ts=4
set sw=4
set number
" shows row and column number at bottom right corner
set ruler

" set tabs to be 4 spaces
set tabstop=4
set expandtab

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme OceanicNext 
