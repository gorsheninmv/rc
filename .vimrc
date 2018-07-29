set number " Показывать номера строк
syntax off " Подсвечивать синтаксис
set keymap=russian-jcukenwin " Переключаться на русский по команде Ctrl+^
set iminsert=0 " Латинская раскладка по умолчанию
set ic " Игнорировать регистр при поиске
set linebreak
set dy=lastline " Переносить по словам
" Копирование в CLIPBOARD
set laststatus=2 " Всегда показывать строку статуса
set statusline=%F%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ col:%2c\ line:%2l/%L\ [%2p%%]
"set showtabline " Показывать строку вкладок всегда
set t_Co=256 " Использовать больше цветов
set exrc " Разрешить использование внешних конфигурационных файлов .vimrc
set nocompatible " Отключить совместимость с Vi
set showcmd " Отображать выполняемую команду
"filetype off " Отключить определение файла и утсановку опций в соответствии с типом этого файла
set secure " Запретить выполнение небезопасных команд в файле .vimrc проекта
set confirm " Отключение сообщений об ошибке несохраненных изменений. Вместо
" этого будет предложение о сохранении
language messages C

set modelines=5
set modeline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set directory=~/.vim/tmp/swap//   " swap files

" Vim 7.3 options
if version >= 703
    set colorcolumn=+1
    set undodir=~/.vim/tmp/undo//     " undo files
    set undofile
endif


" ================= Vundle ================= 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive' 
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9' 
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git' 
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin' 
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup' , {'rtp' : 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9' , {'name' : 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'dracula/vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'jpalardy/vim-slime'
Plugin 'wlangstroth/vim-racket'
Plugin 'vim-syntastic/syntastic'
Plugin 'kien/rainbow_parentheses.vim'


"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ================= End of Vundle =================

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
nnoremap <silent> <F11> :ToggleBufExplorer<CR>
" }}}


" Vim-slime {{{
let g:slime_target = "tmux"
" }}}
" Горячие клавиши
vmap <C-c> "+y
vmap <C-p> "+p
nmap <C-t> :tabnew<CR>
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>

syntax on
color dracula


" Настройка отступов
" ==================

""tabstop (по умолчанию 8) — количество пробелов, которыми символ табуляции отображается в тексте. Оказывает влияние как на уже существующие табуляции, так и на новые. В случае изменения значения, «на лету» применяется к тексту.

""softtabstop (0) — количество пробелов, которыми символ табуляции отображается при добавлении. Несмотря на то, что при нажатии на Tab вы получите ожидаемый результат (добавляется новый символ табуляции), фактически в отступе могут использоваться как табуляция так и пробелы. Например, при установленных tabstop равной 8 и softtabstop равной 4, троекратное нажатие Tab приведет к добавлению отступа шириной 12 пробелов, однако сформирован он будет из одного символа табуляции и 4 пробелов.

""shiftwidth (8) — по умолчанию используется для регулирование ширины отступов в пробелах, добавляемых командами >> и <<. Если значение опции не равно tabstop, как и в случае с softtabstop, отступ может состоять как из символов табуляций так и из пробелов. При включении опции — smarttab, оказывает дополнительное влияние.

""smarttab (выключена) — в случае включения этой опции, нажатие Tab в начале строки (если быть точнее, до первого непробельного символа в строке) приведет к добавлению отступа, ширина которого соответствует shiftwidth (независимо от значений в tabstop и softtabstop). Нажатие на Backspace удалит отступ, а не только один символ, что очень полезно при включенной expandtab. Напомню: опция оказывает влияние только на отступы в начале строки, в остальных местах используются значения из tabstop и softtabstop.

""expandtab (выключена) — в режиме вставки заменяет символ табуляции на соответствующее количество пробелов. Так же влияет на отступы, добавляемые командами >> и <<

