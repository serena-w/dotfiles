" Started with sample .vimrc file from Great Practical Ideas for Computer
" Scientists

"Enable filetype detection and syntax hilighting
syntax on
" filetype on
" filetype indent on
filetype plugin on

" Ensure that we are in modern vim mode, not backwards-compatible vi mode
set nocompatible
set backspace=indent,eol,start
filetype off " required for Vundle plugin manager

" set the runtime path to include Vundle and initialize
" Run :PluginInstall to install plugins from Github
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"  let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Display type annotations of programs
Bundle "panagosg7/vim-annotations"

"  Prettier
Plugin 'prettier/vim-prettier'

"  Typescript syntax highlighting
Plugin 'leafgarland/typescript-vim'

"  Color scheme
Plugin 'jonathanfilip/vim-lucius'

"  Color scheme
Plugin 'Quramy/tsuquyomi'

"  Conquer of completion - autocomplete, code snippets
"  Run yarn install --frozen-lockfile in directory after installing
Plugin 'neoclide/coc.nvim'

call vundle#end()

" Set color scheme
colorscheme lucius

" Helpful information: cursor position in bottom right, line numbers on
" left
set ruler
set number

" Indent as intelligently as vim knows how
set smartindent

" Show multicharacter commands as they are being typed
set showcmd
set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding

" Disable beeping (http://vim.wikia.com/wiki/Disable_beeping)
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

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
" set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set autochdir  "Change directory to currently open file
set nocompatible  "Kill vi-compatibility
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position
set tw=80 "Wrap lines at 80 characters

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

" Syntax highlighting and stuff
filetype plugin indent on
syntax on

" Get rid of warning on save/exit typo
command! WQ wq
command! Wq wq
command! W w
command! Q q

"Faster Ctrl-P search
let g:ctrlp_lazy_update = 100 "Only refreshes the results every 100ms so if you type fast searches don't pile up
let g:ctrlp_user_command = 'find %s -type f | egrep -iv "(\.(eot|gif|gz|ico|jpg|jpeg|otf|png|psd|pyc|svg|ttf|woff|zip)$)|(/\.)|((^|\/)tmp\/)"' "Quicker indexing

" Syntax checking/Linting
scriptencoding utf-8

set undodir=~/.vim/tmp/undo " keep undo files out of the way
set undofile " actually use undo files

set autoread " autoload external changes unless unsaved changes
set backupdir=~/.vim/tmp/backup,. " keep backup files out of the way
set backspace=indent,start,eol " allow unrestricted backspacing in insert mode
set backupdir=~/.vim/tmp/backup,. " keep backup files out of the way
set directory=~/.vim/tmp/swap//,. " keep swap files out of the way, trailing // stores full dir

" Organize imports on save
autocmd BufWritePre *.ts,*.tsx :call CocAction('runCommand', 'editor.action.organizeImport')

" Run prettier auto formatting for files on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql,*.ts,*.tsx Prettier
autocmd FileType typescriptreact setlocal formatprg=prettier\ --parser\ typescript


""" coc config
""" Need nodejs >= 12.12, vim >= 8.0
""" Install extensions below
" :CocInstall coc-tsserver
" :CocInstall coc-eslint

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
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion, select next completion, snippet expand and jump.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use enter for completion confirm
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use shift+tab to select previous completion
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
