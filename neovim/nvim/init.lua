vim.api.nvim_exec([[
" Transparent background
au ColorScheme * hi NonText ctermbg=none
au ColorScheme * hi Normal ctermbg=none
au ColorScheme * hi CursorLine ctermbg=none ctermfg=none
au ColorScheme * hi CursorLineNR cterm=none

let mapleader = ","             " set leader key
]], true)

require 'plugins'
require 'functions'
require 'options'
require 'mappings'

vim.api.nvim_exec([[
" TODO: separate file for such situations, kind of 'after'.
" Another option is to setup plugins after all.
hi NvimTreeCursorLine cterm=bold gui=bold

" C features
augroup c_features
    au!
    au FileType c inoremap {<CR> {<CR>}<ESC>O
augroup end

" C features
augroup ts_features
    au!
    au FileType typescript inoremap {<CR> {<CR>}<ESC>O
augroup end

" Scheme features
augroup scheme_features
    au!
    au FileType BufEnter *.scm :RainbowParentheses setlocal lisp
augroup end

" Trim end lines
au BufWritePre * call TrimEndLines()

augroup tex_settings
    au!
    au BufRead,BufNewFile *.tex setlocal textwidth=100
augroup end

augroup makefiles
    au!
    au! FileType make set noexpandtab shiftwidth=8 softtabstop=0
augroup end

let g:python3_host_prog = '/usr/bin/python3'

" Greeting
echo "(>^.^<)"
]], true)
