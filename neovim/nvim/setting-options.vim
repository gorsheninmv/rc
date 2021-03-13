set number                       " show line numbers
set autoread                     " read changes automatically
set ic                           " ignorecase when searching
set linebreak                    " wrap lines
set dy=lastline                  " carry by words
set laststatus=2                 " show statusline
set showtabline=1                " show tabline if more than one tabs
set exrc                         " enable external config files
set showcmd                      " show executed command
set encoding=utf-8               " use utf-8 as encoding
set confirm                      " ask for saving file when quit
set scrolloff=3                  " scrolloffset
set showmode                     " show current mode
set foldmethod=marker            " use marker as foldmethod
set hidden                       " hide buffer if it was abandoned
set visualbell                   " enable visualbell
set cursorline                   " highlight current line
set ruler                        " show cursor position always
set colorcolumn=100              " highlight max width
set relativenumber               " show relative line numbers
set wildmenu                     " enable command-line completion
set wildmode=list:longest        " show matches in list
set undodir=~/.vim/tmp/undo//    " use undo directory
set undofile                     " enable undofile
set backspace=indent,eol,start   " use backspace to delete symbols
set directory=~/.vim/tmp/swap//  " swap files locate there
set completeopt=menuone,noselect " completion menu settings

" Text formatting
set modelines=5
set modeline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Keyboard layout
set keymap=russian-jcukenwin    " add russian keymap
set iminsert=0                  " lmap is off by default in insert mode
set imsearch=0                  " lmap is off by default in search mode

" Formatting symbols form
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:•

" Statusline format
set statusline=%F%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ col:%2c\ line:%2l/%L\ [%2p%%]

language messages C             " set UI lang as en

" Colorscheme
set background=light
color PaperColor
syntax on
highlight ColorColumn ctermbg=red

if has('nvim')
    hi NonText ctermfg=242
    hi Whitespace ctermfg=242
endif

filetype plugin on              " enable filetype detection

au BufEnter * set fo-=r fo-=o   " disable putting comment symbols automatically

let mapleader = ","             " set leader key
