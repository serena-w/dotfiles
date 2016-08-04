" Started with sample .vimrc file from Great Practical Ideas for Computer
" Scientists

execute pathogen#infect()

" Ensure that we are in modern vim mode, not backwards-compatible vi mode
set nocompatible
set backspace=indent,eol,start
filetype off " required for Vundle plugin manager

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'

" vim-c0 plugin on Github repo
" Plugin 'cmugpi/vim-c0'

" call vundle#end()

" Helpful information: cursor position in bottom right, line numbers on
" left
set ruler
set number

"Enable filetype detection and syntax hilighting
syntax on
filetype on
filetype indent on
filetype plugin on

" Indent as intelligently as vim knows how
set smartindent

" Show multicharacter commands as they are being typed
set showcmd
set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding

" set tabstop=2  "4 space tabs
" set shiftwidth=4  "4 space shift
" set softtabstop=4  "Tab spaces in no hard tab mode
" Use two-space indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab  " Expand tabs into spaces
au BufWinEnter,BufNewFile * silent tab

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set autoindent  "autoindent on new lines
set showmatch  "Highlight matching braces
set ruler  "Show bottom ruler
set equalalways  "Split windows equal size
set formatoptions=croq  "Enable comment line auto formatting
set wildignore+=*.o,*.obj,*.class,*.swp,*.pyc "Ignore junk files
set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately
set scrolloff=5  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set cursorline  "Highlight current line
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set autochdir  "Change directory to currently open file
set nocompatible  "Kill vi-compatibility
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

" Syntax highlighting and stuff
filetype plugin indent on
syntax on

" Get rid of warning on save/exit typo
command WQ wq
command Wq wq
command W w
command Q q

"Faster Ctrl-P search
let g:ctrlp_lazy_update = 100 "Only refreshes the results every 100ms so if you type fast searches don't pile up
let g:ctrlp_user_command = 'find %s -type f | egrep -iv "(\.(eot|gif|gz|ico|jpg|jpeg|otf|png|psd|pyc|svg|ttf|woff|zip)$)|(/\.)|((^|\/)tmp\/)"' "Quicker indexing

"Ignore whitespace in Fugitive diffs
set diffopt+=iwhite

" Make Fugitive compatible with GitHub Enterprise
let g:fugitive_github_domains = ['github.com', 'git.musta.ch']

" Syntax checking/Linting
scriptencoding utf-8

" Always add any detected errors into the location list
let g:syntastic_always_populate_loc_list = 1

" Don't auto-open it when errors/warnings are detected, but auto-close when no
" more errors/warnings are detected.
let g:syntastic_auto_loc_list = 2

" Highlight syntax errors where possible
let g:syntastic_enable_highlighting = 1

" Show this many errors/warnings at a time in the location list
let g:syntastic_loc_list_height = 5

" Don't run checkers when saving and quitting--only on saving
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol         = '×' " There are better characters, but Hackpad won't show them
let g:syntastic_warning_symbol       = '⚠'
let g:syntastic_style_error_symbol   = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let g:syntastic_javascript_checkers    = ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
let g:syntastic_json_checkers          = ['jsonlint']
let g:syntastic_ruby_checkers          = ['rubocop']
let g:syntastic_scss_checkers          = ['scss_lint']
let g:syntastic_vim_checkers           = ['vint']

if has('persistent_undo')
  set undodir=~/.vim/tmp/undo,. " keep undo files out of the way
  set undofile " actually use undo files
endif

set autoread " autoload external changes unless unsaved changes
set backupdir=~/.vim/tmp/backup,. " keep backup files out of the way
set backspace=indent,start,eol " allow unrestricted backspacing in insert mode
set backupdir=~/.vim/tmp/backup,. " keep backup files out of the way
set directory=~/.vim/tmp/swap//,. " keep swap files out of the way, trailing // stores full dir
