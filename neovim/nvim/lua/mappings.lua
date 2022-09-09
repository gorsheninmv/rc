local setkmp = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- change keyboard layout
setkmp('i', '<C-f>', '<C-^>', opts)

-- toggle formatting symbols
setkmp('n', '<F3>', ':set list!<CR>', opts)

-- open/close folder
setkmp('n', '<space>', 'za', opts)

-- resize splits
setkmp('n', '<leader>h', ':vertical resize +5<CR>', opts)
setkmp('n', '<leader>l', ':vertical resize -5<CR>', opts)
setkmp('n', '<leader>j', ':resize +5<CR>', opts)
setkmp('n', '<leader>k', ':resize -5<CR>', opts)
setkmp('n', '<leader>=', '<C-w>=', opts)


vim.api.nvim_exec([[

" Close bracket/quote
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap [] []<LEFT>
inoremap {} {}<LEFT>
inoremap () ()<LEFT>
inoremap <> <><LEFT>

" Create and go to newline in normal mode
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" Set cursor at the end of a line
inoremap  <C-e> <C-o>$

" Search word in the current window
nnoremap <leader>f <c-*>

" Copy/paste using OS buffer
vnoremap <C-c> "+y
vnoremap <C-p> "+p

" Copy/paste without register overwriting
noremap <leader>y "ay
noremap <leader>p "ap

" Map arrow buttons
inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-l> <RIGHT>

" Grep mappings
nnoremap <silent><leader>g :set operatorfunc=Funcs_Grep<CR>g@
vnoremap <silent><leader>g :<c-u>silent call Funcs_Grep(visualmode())<CR>
nnoremap <silent><leader>gp :silent call GrepPrompt()<CR>

" Buf Explorer
nnoremap <silent><F10> :ToggleBufExplorer<CR>

" Window Swap
nnoremap <silent><leader>s :call WindowSwap#EasyWindowSwap()<CR>

" Tagbar
nnoremap <silent><F9> :TagbarToggle<CR>

" Line over movement
nnoremap <leader>b ^
nnoremap <leader>e g_
]], true)
