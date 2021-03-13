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
Plug 'vim-scripts/TagHighlight'
Plug 'NLKNguyen/papercolor-theme'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lsp'
Plug 'hrsh7th/nvim-compe'

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


" LSP
lua << EOF
require'lspconfig'.pyright.setup{}
EOF


" Vim-slime
let g:slime_target = "tmux"


" WindowSwap
let g:wisndowswap_map_keys = 0


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

" Nvim-compe
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
EOF
