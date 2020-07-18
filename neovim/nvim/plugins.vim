" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'vim-scripts/TagHighlight'
Plug 'NLKNguyen/papercolor-theme'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'neovim/nvim-lsp' since v0.5

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

" Initialize plugin system
call plug#end()


" NERDTree settings
let NERDTreeHighlightCursorline = 0
let NERDTreeIgnore = ['.vim$', '.*\.pyc$', '.*.pid']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'


" Vim-slime
let g:slime_target = "tmux"


" WindowSwap
let g:wisndowswap_map_keys = 0


" LSP
let g:LanguageClient_selectionUI = "quickfix"
let g:LanguageClient_useFloatingHover = 1
let g:LanguageClient_settingsPath='.vim/language-client.json'
let g:LanguageClient_serverCommands = {
    \ 'c' : ['clangd'],
    \ 'cpp' : ['clangd'],
    \ 'python' : ['dotnet', 'exec', '/usr/lib/microsoft-python-language-server/Microsoft.Python.LanguageServer.dll'],
    \ }
let g:LanguageClient_rootMarkers = {
     \ 'python' : ['.root'],
     \ }


" Deoplete
let g:deoplete#enable_at_startup = 1


" Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu


" Airline
let g:airline_theme='papercolor'
let g:airline#extensions#keymap#enabled = 0

" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'
