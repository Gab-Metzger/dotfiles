syntax enable

set iskeyword+=-                        " treat dash separated words as a word text object
set encoding=utf-8
set fileencoding=utf-8
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set background=dark
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set guifont=Hack\ Nerd\ Font

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=ligthgrey

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
