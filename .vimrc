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

" Enable auto detection file type and setting option for this one {{{
filetype plugin on
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
" set list

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
highlight colorcolumn guibg=Red
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
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'wesQ3/vim-windowswap'
"Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/deoplete.nvim'


if has("win64") || has("win32")
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
        \ }
else
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
endif

if has("win64") || has("win32")
    Plug 'OmniSharp/omnisharp-vim'
endif


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

function OpenProFolder()
    if has("win64") || has("win32")
        :NERDTree C:\projects\
    endif
endfunction

: command Pro :call OpenProFolder()
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

if has("win64") || has("win32")
    let g:tagbar_ctags_bin = 'C:\ctags.exe'
endif
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

nmap <Leader>h :call VInc()<CR>
nmap <Leader>l :call VDec()<CR>
nmap <Leader>j :call HInc()<CR>
nmap <Leader>k :call HDec()<CR>
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

" Openning command for gvim {{{
if has("gui_running")
    function Open()
        browse confirm e
    endfunction
endif

:command O :call Open()
" }}}

" Hide widgets in gvim {{{
if has("gui_running")
    set guioptions-=m " remove menu bar
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right-hand scroll
    set guioptions-=L " remove left-hand scroll
endif
" }}}

" Set font {{{
if has("gui_running")
    set guifont=Consolas:h11:cANSI
endif
" }}}

" Disable blinking {{{
autocmd GUIEnter * set vb t_vb=
" }}}

" LSP {{{
let g:LanguageClient_serverCommands = {
    \ 'c' : ['clangd'],
    \ 'cpp' : ['clangd'],
    \ }

nnoremap <F7> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
" }}}

" ALE {{{
    let g:airline#extensions#ale#enabled = 1
    let g:ale_completion_enabled = 0

    let g:ale_linters = {
                \ 'cs' : ['OmniSharp']
                \}
" }}}

" OmniSharp {{{
function OmniSharpInit()
    let g:OmniSharp_server_path = 'C:\omnisharp\OmniSharp.exe'
    let g:Omnisharp_timeout = 5
    let g:OmniSharp_highlight_types = 1

    augroup omnisharp_commands
        autocmd!

        " Show type information automatically when the cursor stops moving
        autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

        " Update the highlighting whenever leaving insert mode
        autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

        " Alternatively, use a mapping to refresh highlighting for the current buffer
        autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

        " The following commands are contextual, based on the cursor position.
        autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

        " Finds members in the current buffer
        autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

        autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
        autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
        autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

        " Navigate up and down by method/property/field
        autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
        autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
    augroup END

    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    nnoremap <Leader>nm :OmniSharpRename<CR>
    "nnoremap <F2> :OmniSharpRename<CR>
    " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
    command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

    " Start the omnisharp server for the current solution
    nnoremap <Leader>ss :OmniSharpStartServer<CR>
    nnoremap <Leader>sp :OmniSharpStopServer<CR>

    " Enable snippet completion
    " let g:OmniSharp_want_snippet=1
endfunction

if has("win64") || has("win32")
    call OmniSharpInit()
endif
" }}}

" Find and replace {{{
function SearchAndReplaceWord(f, r)
    execute ':%s/\<' . a:f . '\>/' . a:r . '/g'
endfunction

: command -nargs=* SRW call SearchAndReplaceWord(<f-args>)

function SearchAndReplaceSymbols(f, r)
    execute ':%s/' . a:f . '/' . a:r . '/g'
endfunction

: command -nargs=* SRS call SearchAndReplaceSymbols(<f-args>)

function FindAndReplaceWithChecking(f, r)
    %s/\<a:f>/a:r/gc
endfunction

function SearchAndReplaceWordWithChecking(f, r)
    execute ':%s/\<' . a:f . '\>/' . a:r . '/gc'
endfunction

: command -nargs=* SRWC call SearchAndReplaceWordWithChecking(<f-args>)

function SearchAndReplaceSymbolsWithChecking(f, r)
    execute ':%s/' . a:f . '/' . a:r . '/gc'
endfunction

: command -nargs=* SRSC call SearchAndReplaceSymbolsWithChecking(<f-args>)

" Find selected expr
vnoremap // y/<C-R>"<CR>
" }}}

" Nvim-yarp {{{
let g:python3_host_prog = 'C:\Users\Misha Gorshenin\AppData\Local\Programs\Python\Python36-32\python.exe'
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Настройка отступов
" ==================

""tabstop (по умолчанию 8) — количество пробелов, которыми символ табуляции отображается в тексте. Оказывает влияние как на уже существующие табуляции, так и на новые. В случае изменения значения, «на лету» применяется к тексту.

""softtabstop (0) — количество пробелов, которыми символ табуляции отображается при добавлении. Несмотря на то, что при нажатии на Tab вы получите ожидаемый результат (добавляется новый символ табуляции), фактически в отступе могут использоваться как табуляция так и пробелы. Например, при установленных tabstop равной 8 и softtabstop равной 4, троекратное нажатие Tab приведет к добавлению отступа шириной 12 пробелов, однако сформирован он будет из одного символа табуляции и 4 пробелов.

""shiftwidth (8) — по умолчанию используется для регулирование ширины отступов в пробелах, добавляемых командами >> и <<. Если значение опции не равно tabstop, как и в случае с softtabstop, отступ может состоять как из символов табуляций так и из пробелов. При включении опции — smarttab, оказывает дополнительное влияние.

""smarttab (выключена) — в случае включения этой опции, нажатие Tab в начале строки (если быть точнее, до первого непробельного символа в строке) приведет к добавлению отступа, ширина которого соответствует shiftwidth (независимо от значений в tabstop и softtabstop). Нажатие на Backspace удалит отступ, а не только один символ, что очень полезно при включенной expandtab. Напомню: опция оказывает влияние только на отступы в начале строки, в остальных местах используются значения из tabstop и softtabstop.

""expandtab (выключена) — в режиме вставки заменяет символ табуляции на соответствующее количество пробелов. Так же влияет на отступы, добавляемые командами >> и <<

