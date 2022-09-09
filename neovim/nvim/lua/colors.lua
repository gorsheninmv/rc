vim.cmd[[
" Color scheme
augroup colors
  au!
  au ColorScheme * hi NonText ctermbg=none
  au ColorScheme * hi Normal ctermbg=none
  au ColorScheme * hi CursorLine ctermbg=none ctermfg=none
  au ColorScheme * hi CursorLineNR cterm=none
  au ColorScheme * hi NvimTreeCursorLine cterm=bold gui=bold
  au ColorScheme * hi ColorColumn ctermfg=red guifg=red
augroup end
color PaperColor
]]
