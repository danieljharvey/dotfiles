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
Plug 'sdiehl/vim-ormolu'
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
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

" Syntax stuff
" Plug 'w0rp/ale'

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

" Autoformat
Plug 'Chiel92/vim-autoformat'

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

Plug 'mileszs/ack.vim'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" search with ctrl-f
Plug 'ctrlpvim/ctrlp.vim'

" ocaml support
Plug 'ocaml/vim-ocaml'

let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'

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
      \ 'colorscheme': 'catppuccin',
  \ }

" Plug 'bitc/vim-hdevtools'
Plug 'scrooloose/syntastic'

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
" let g:syntastic_haskell_checkers=['hdevtools']

"nnoremap <Leader>ff :Unite -buffer-name=files -start-insert
"      \ file_rec/git:--cached:--others:--exclude-standard<CR>

autocmd FileType unite call s:initialise_unite_buffer()
function! s:initialise_unite_buffer()
" Enable <C-j> and <C-k> for navigating Unite buffers when in insert mode.
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" new things to try
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '/install -all' }
Plug 'tpope/vim-surround'

" Prettier
Plug 'prettier/vim-prettier'

" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


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


" coc intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" end of coc copy pasta

" initialise plugins
call plug#end()

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark

colorscheme catppuccin

