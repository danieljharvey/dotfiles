set nocompatible   " be iMproved
filetype off       " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" full colours in ubuntu
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" pointless comment

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

Plugin 'pangloss/vim-javascript'

" Plugin 'luochen1990/rainbow'

Plugin 'neovimhaskell/haskell-vim'
Plugin 'nbouscal/vim-stylish-haskell'

" Change into symbols

let g:javascript_conceal_function     = "f"

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Syntax stuff
Plugin 'w0rp/ale'

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

Plugin 'frigoeu/psc-ide-vim'
" g:psc_ide_syntastic_mode = 1
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









" Elm

Plugin 'elmcast/elm-vim'

let g:polyglot_disabled = ['elm']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

Plugin 'lambdatoast/elm.vim'

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

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

autocmd StdinReadPre * let s:std_in=1


filetype plugin indent on  " required!

"set bs=2
"set sw=2
"set number
" shows row and column number at bottom right corner
set ruler

" set tabs to be 4 spaces
"set tabstop=2
"set expandtab

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme OceanicNext

Bundle 'bitc/vim-hdevtools'
Bundle 'scrooloose/syntastic'

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_haskell_checkers=['hdevtools']

nnoremap <Leader>ff :Unite -buffer-name=files -start-insert
  \ file_rec/git:--cached:--others:--exclude-standard<CR>

autocmd FileType unite call s:initialise_unite_buffer()
function! s:initialise_unite_buffer()
  " Enable <C-j> and <C-k> for navigating Unite buffers when in insert mode.
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" new things to try
Bundle 'godlygeek/tabular'
Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '/install -all' }
Bundle 'tpope/vim-surround'

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
