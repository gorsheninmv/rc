-- tutorial about lua config:
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- type gx to open url

vim.g.mapleader = ','

require'plugins'
require'colors'
require'functions'
require'options'
require'mappings'
require'config.sungero'

local auto_trim_end_group = vim.api.nvim_create_augroup('auto_trim_end', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = auto_trim_end_group,
  callback = function()
    vim.fn.TrimEndLines()
  end
})

vim.api.nvim_exec([[
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

augroup tex_settings
    au!
    au BufRead,BufNewFile *.tex setlocal textwidth=100
augroup end

augroup makefiles
    au!
    au! FileType make set noexpandtab shiftwidth=8 softtabstop=0
augroup end

let g:python3_host_prog = '/usr/bin/python3'
]], true)
