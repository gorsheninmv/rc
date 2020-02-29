" Change keyboard layout
inoremap <C-f> <C-^>

" Enable/disable formatting symbols
nnoremap <silent> <F3> :set list!<CR>

" Open/close folder
nnoremap <space> za

" Resize splits
nnoremap <leader>h :vertical resize +5<CR>
nnoremap <leader>l :vertical resize -5<CR>
nnoremap <leader>j :resize +5<CR>
nnoremap <leader>k :resize -5<CR>

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

" Switch focus between splits
nmap <Tab> <C-w>w

" Grep mappings
nnoremap <silent><leader>g :set operatorfunc=Funcs_Grep<cr>g@
vnoremap <silent><leader>g :<c-u>silent call Funcs_Grep(visualmode())<cr>

" Nerd Tree
noremap  <silent><F2> :call Funcs_NerdTreeToggle()<CR>
inoremap <silent><F2> <ESC>:call Funcs_NerdTreeToggle()<CR>

" Buf Explorer
nnoremap <silent><F10> :ToggleBufExplorer<CR>

" Window Swap
nnoremap <silent><leader>s :call WindowSwap#EasyWindowSwap()<CR>

" Tagbar
nnoremap <silent><F9> :TagbarToggle<CR>

" LSP
nnoremap <F7> :call LanguageClient_contextMenu()<CR>
nnoremap <silent>K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent>gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent>gr :call LanguageClient#textDocument_rename()<CR>
