" Show line numbers {{{
set number
" }}}

" Highlight syntax {{{
syntax on
" }}}

" Add russian keymap {{{
set keymap=russian-jcukenwin
inoremap <F5> <C-^>
set iminsert=0
set imsearch=0
" }}}

" Ignorecase when searching {{{
set ic
" }}}

" Wrap lines {{{
set linebreak
" }}}

" Carry by words {{{
set dy=lastline
" }}}

" Show status line {{{
set laststatus=2
set statusline=%F%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ col:%2c\ line:%2l/%L\ [%2p%%]
" }}}

" Show tab line {{{
"set showtabline
" }}}

" Enable 256 colors {{{
set t_Co=256
" }}}

" Enable external config files {{{
set exrc
set secure
" }}}

" Disable Vi compability {{{
set nocompatible
" }}}

" Show executed command {{{
set showcmd
" }}}

" Disable auto detection file type and setting option for this one {{{
"filetype off
" }}}

" Disable message about unsaved changing error. {{{
" Suggest to save instead
set confirm
" }}}

" Set UI lang as en {{{
language messages C
" }}}

" Set UTF-8 encoding {{{
set encoding=utf-8
" }}}

" Enable marker fold and setup it {{{
set foldmethod=marker
nnoremap <space> za
" }}}

" Set formatting {{{
set modelines=5
set modeline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
" }}}

" Set scrolloffset {{{
set scrolloff=3
" }}}

" Show current mode {{{
set showmode
" }}}

" Hide buffer if it was abandoned {{{
set hidden
" }}}

" Enable wildmenu {{{
set wildmenu
set wildmode=list:longest
" }}}

" Enable visualbell {{{
set visualbell
" }}}

" Highlight cursor line {{{
set cursorline
" }}}

" Speed up screen redrawing {{{
set ttyfast
" }}}

" Show cursor position always {{{
set ruler
" }}}
"
" Enable symbol deleting using backspace {{{
set backspace=indent,eol,start
" }}}

" Set working directory to the current file {{{
set directory=~/.vim/tmp/swap//   " swap files
" }}}

" Show/hide formatting symbols {{{
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:•
set list

function ToggleListChars()
    if &list
        set nolist
    else
        set list
    endif
endfunction

nmap <silent> <F3> :call ToggleListChars()<CR>
" }}}

" Highlight max width {{{
set colorcolumn=100
" }}}

" Set undo settings {{{
set undodir=~/.vim/tmp/undo//
set undofile
" }}}

" Install plugins {{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'jpalardy/vim-slime'
Plug 'wlangstroth/vim-racket'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'ervandew/supertab'

" Plugin 'Shougo/neocomplete.vim'

" Initialize plugin system
call plug#end()
" }}}

" NERD Tree {{{
noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '.*\.pyc$', '.*.pid']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'
" }}}

" BufExplorer {{{
nnoremap <silent> <F10> :ToggleBufExplorer<CR>
" }}}

" Vim-slime {{{
let g:slime_target = "tmux"
" }}}

" Rainbow Parentheses {{{
autocmd BufEnter *.scm :RainbowParentheses
" }}}

" WindowSwap {{{
let g:wisndowswap_map_keys = 0
nnoremap <silent> <Leader>s :call WindowSwap#EasyWindowSwap()<CR>
" }}}

" Tagbar {{{
nnoremap <silent> <F9> :TagbarToggle<CR>
" }}}

" Scheme {{{
autocmd BufEnter *.scm set lisp
set omnifunc=syntaxcomplete#Complete
imap <C-n> <C-x><C-o>
" }}}

" Resize splits {{{
function VInc()
    vertical resize +5
endfunction

function VDec()
    vertical resize -5
endfunction

function HInc()
    resize +5
endfunction

function HDec()
    resize -5
endfunction
" }}}

" Copy/paste using OS buffer {{{
vmap <C-c> "+y
vmap <C-p> "+p
" }}}

" Manage tabs {{{
nmap <C-t> :tabnew<CR>
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>
" }}}

" Close bracket/quote {{{
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap [] []<LEFT>
inoremap {} {}<LEFT>
inoremap () ()<LEFT>
inoremap <> <><LEFT>

" Set cursor after closing symbol
imap <C-r> <RIGHT><SPACE>
" }}}

" Switch focus between splits {{{
nmap <Tab> <C-w>w
" }}}

" Set colorscheme {{{
color dracula
" }}}


" Настройка отступов
" ==================

""tabstop (по умолчанию 8) — количество пробелов, которыми символ табуляции отображается в тексте. Оказывает влияние как на уже существующие табуляции, так и на новые. В случае изменения значения, «на лету» применяется к тексту.

""softtabstop (0) — количество пробелов, которыми символ табуляции отображается при добавлении. Несмотря на то, что при нажатии на Tab вы получите ожидаемый результат (добавляется новый символ табуляции), фактически в отступе могут использоваться как табуляция так и пробелы. Например, при установленных tabstop равной 8 и softtabstop равной 4, троекратное нажатие Tab приведет к добавлению отступа шириной 12 пробелов, однако сформирован он будет из одного символа табуляции и 4 пробелов.

""shiftwidth (8) — по умолчанию используется для регулирование ширины отступов в пробелах, добавляемых командами >> и <<. Если значение опции не равно tabstop, как и в случае с softtabstop, отступ может состоять как из символов табуляций так и из пробелов. При включении опции — smarttab, оказывает дополнительное влияние.

""smarttab (выключена) — в случае включения этой опции, нажатие Tab в начале строки (если быть точнее, до первого непробельного символа в строке) приведет к добавлению отступа, ширина которого соответствует shiftwidth (независимо от значений в tabstop и softtabstop). Нажатие на Backspace удалит отступ, а не только один символ, что очень полезно при включенной expandtab. Напомню: опция оказывает влияние только на отступы в начале строки, в остальных местах используются значения из tabstop и softtabstop.

""expandtab (выключена) — в режиме вставки заменяет символ табуляции на соответствующее количество пробелов. Так же влияет на отступы, добавляемые командами >> и <<

