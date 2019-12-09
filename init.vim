" Make it simple...at least until I know how to config nvim
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

" Tab key enters 2 spaces
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
if $TERM == "xterm-256color"
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
