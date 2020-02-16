" Make it simple...at least until I know how to config nvim

" My leader key
let mapleader = "\<Space>"

" Number of lines at the beginning and end of files checked for file-specific
" vars
set modelines=0

" Reload files changed outside of nvim
set autoread

" Encoding
set encoding=utf-8
set fenc=utf-8

" Make backspace work like delete
set backspace=indent,eol,start

" Don't create swap files
set noswapfile

" Line number and distance
set relativenumber
set number

" Number of lines offset when jumping
set scrolloff=2

" Tab key enters 4 spaces
set expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Indent new line the same as the preceding line
set autoindent

" Status line indicates insert or normal mode
set showmode showcmd

" Highlight matching parens, braces, brackets...
set showmatch

" TODO: Make this look pretty
" Show current line
" set cursorline
" highlight cursorline ctermbg=black
" autocmd InsertEnter * highlight  cursorline ctermbg=17 ctermfg=None
" autocmd InsertLeave * highlight  cursorline ctermbg=None ctermfg=None

" Always show cursor position
set ruler

" Syntax color
syntax enable

" Background color
set background=dark

" Set colors if TERM have colors
if $TERM == "termite"
  set t_Co=256
endif

" Remap keys :: noremap <new_key> <old_key>
noremap j h
noremap k j
noremap l k
noremap ñ l

" Ignore case when searching
set ignorecase

" Incremental search that shows partial matches
set incsearch

" Change to case-sensitive search when swarch query contains an uppercase
" letter
set smartcase

" Don't update screen during macro and script execution
set lazyredraw

" Disable beep on errors
set noerrorbells

" Fold based on indention levels
" set foldmethod=indent

" Only fold up to three nested levels
" set foldnestmax=3

" Display a confirmation dialog when closing an unsaved file
set confirm

" Increase the undo limit
set history=1000

" To be in the same spot when oppening a file 
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" TODO make this work
" Fast window switching
nnoremap <silent> <M-left> <C-w>j
nnoremap <silent> <M-right> <C-w>ntile
nnoremap <silent> <M-down> <C-w>k
nnoremap <silent> <M-up> <C-w>l

" Edit and reload init.vim quickly
nnoremap <silent> <leader>ev :tabnew $MYVIMRC <bar> tcd %:h<cr>
nnoremap <silent> <leader>sv :silent update $MYVIMRC <bar> source $MYVIMRC <bar>
    \ echomsg "Nvim configvsuccessfully reloaded!"<cr>

" Yank from current position to the end.
nnoremap Y y$

" Undo even after you close a file. 
set undofile

" Set nvim config path and load your .vim scripts/files
let g:nvim_config_root = stdpath('config')
let g:config_file_list = ['pluginCall.vim']
" \ 'XXXXXXX.vim',
" \ 'XXXXXXXXXXXX.vim',
" \ 'XXXXXXXX.vim',
" \ 'XXXXXXX.vim',
" \ 'XX.vim'
" \ ]

for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . '/' . f
endfor

" Remap <C-e> to open nerdTree plugin
map <C-e> :NERDTreeToggle<CR>

" BEGIN - Rainbow Paren Pluggin
" :RainbowParenthesesToggle       " Toggle it on/off
" :RainbowParenthesesLoadRound    " (), the default when toggling
" :RainbowParenthesesLoadSquare   " []
" :RainbowParenthesesLoadBraces   " {}
" :RainbowParenthesesLoadChevrons " <>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" END - Rainbow Paren Pluggin

" BEGIN - Haskell Syntax Pluggin
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
" END - Haskell Syntax Pluggin

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
colorscheme hyper

" File type detection ON
filetype on
