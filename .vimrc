set nocompatible   " be iMproved
filetype off       " required!

set rtp+=~/.vim/vundle
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

" Elm
Plugin 'elmcast/elm-vim'


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

" Merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
