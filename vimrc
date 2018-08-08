
" ----------------------------------------------------------------------
" | General Settings                                                   |
" ----------------------------------------------------------------------

set nocompatible

syntax on

if has("autocmd")
    filetype plugin indent on
endif

set autoindent

set backspace=indent
set backspace+=eol
set backspace+=start

set clipboard=unnamed          " ┐
                               " │ Use the system clipboard
if has("unnamedplus")          " │ as the default register.
    set clipboard+=unnamedplus " │
endif                          " ┘

set cpoptions+=$               " When making a change, don't
                               " redisplay the line, and instead,
                               " put a `$` sign at the end of
                               " the changed text.

set colorcolumn=73             " Highlight certain column(s).
set cursorline                 " Highlight the current line.
set encoding=utf-8 nobomb      " Use UTF-8 without BOM.
set history=5000               " Increase command line history.
set hlsearch                   " Enable search highlighting.
set ignorecase                 " Ignore case in search patterns.

set incsearch                  " Highlight search pattern
                               " as it is being typed.

set laststatus=2               " Always show the status line.

set lazyredraw                 " Do not redraw the screen while
                               " executing macros, registers
                               " and other commands that have
                               " not been typed.

set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters.
set listchars+=nbsp:_          " ┘

set magic                      " Enable extended regexp.
set mousehide                  " Hide mouse pointer while typing.
set noerrorbells               " Disable error bells.

set nojoinspaces               " When using the join command,
                               " only insert a single space
                               " after a `.`, `?`, or `!`.

set nostartofline              " Kept the cursor on the same column.
set number                     " Show line number.

set numberwidth=5              " Increase the minimal number of
                               " columns used for the `line number`.

set report=0                   " Report the number of lines changed.
set ruler                      " Show cursor position.

set scrolloff=5                " When scrolling, keep the cursor
                               " 5 lines below the top and 5 lines
                               " above the bottom of the screen.

set shortmess=aAItW            " Avoid all the hit-enter prompts.
set showcmd                    " Show the command being typed.
set showmode                   " Show current mode.
set spelllang=en_us            " Set the spellchecking language.

set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters.

set synmaxcol=2500             " Limit syntax highlighting (this
                               " avoids the very slow redrawing
                               " when files contain long lines).

set tabstop=2                  " ┐
set softtabstop=2              " │ Set global <TAB> settings.
set shiftwidth=2               " │
set expandtab                  " ┘

set ttyfast                    " Enable fast terminal connection.
set undodir=~/.vim/undos       " Set directory for undo files.
set undofile                   " Automatically save undo history.
" set virtualedit=all            " Allow cursor to be anywhere.

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

set wildmenu                   " Enable enhanced command-line
                               " completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted).

set winminheight=0             " Allow windows to be squashed.

" ----------------------------------------------------------------------
" | Plugins                                                            |
" ----------------------------------------------------------------------

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'altercation/vim-colors-solarized'
Plugin 'prettier/vim-prettier'

call vundle#end()

filetype on
filetype plugin indent on

" ----------------------------------------------------------------------
" | Plugins - CtrlP
" ----------------------------------------------------------------------

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ----------------------------------------------------------------------
" | Plugins - Prettier
" ----------------------------------------------------------------------

let g:prettier#exec_cmd_async = 1

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md,*.vue PrettierAsync

let g:prettier#config#single_quote = 'true'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#prose_wrap = 'preserve'

" ----------------------------------------------------------------------
" | Plugins - Fzf
" ----------------------------------------------------------------------
set rtp+=/usr/local/opt/fzf

" ----------------------------------------------------------------------
" | Plugins - Ack - Ag
" ----------------------------------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" ----------------------------------------------------------------------
" | Color Scheme                                                       |
" ----------------------------------------------------------------------

set t_Co=256                   " Enable full-color support.

set background=dark            " Use colors that look good
                               " on a dark background.

" Set custom configurations for when the
" Solarized theme is used from Vim's Terminal mode.
"
" http://ethanschoonover.com/solarized/vim-colors-solarized#advanced-configuration

if !has("gui_running")
    let g:solarized_contrast = "high"
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    let g:solarized_visibility = "high"
endif

colorscheme solarized          " Use custom color scheme.

" ----------------------------------------------------------------------
" | Key Mappings                                                       |
" ----------------------------------------------------------------------

let mapleader = ","

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,t ] Toggle NERDTree.

map <leader>t :NERDTreeToggle<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,p ] Toggle CtrlP Finder.

map <leader>p :CtrlP<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,b ] Toggle CtrlP Buffer Finder.

map <leader>b :CtrlPBuffer<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,cc] Toggle code comments.

map <leader>cc :TComment<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,f] Prettier format.
nmap <Leader>f <Plug>(Prettier)

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [C-j/k/h/l] Navigate between windows.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
