" Transparent background
au ColorScheme * hi NonText ctermbg=none
au ColorScheme * hi Normal ctermbg=none
au ColorScheme * hi LineNr ctermbg=none

runtime plugins.vim
runtime functions.vim
runtime setting-options.vim
runtime mappings.vim

" C features
augroup c_features
    au!
    au FileType c inoremap {<CR> {<CR>}<ESC>O
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

let g:python3_host_prog = '/usr/bin/python3'

" Greeting
echo "(>^.^<)"
