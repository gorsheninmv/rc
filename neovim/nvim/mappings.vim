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
nnoremap <leader>= <C-w>=

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

" Nerd Tree
noremap  <silent><F2> :call Funcs_NerdTreeToggle()<CR>
inoremap <silent><F2> <ESC>:call Funcs_NerdTreeToggle()<CR>

" Buf Explorer
nnoremap <silent><F10> :ToggleBufExplorer<CR>

" Window Swap
nnoremap <silent><leader>s :call WindowSwap#EasyWindowSwap()<CR>

" Tagbar
nnoremap <silent><F9> :TagbarToggle<CR>

" fzf
nnoremap <silent> <leader>F :FZF<CR>

" Line over movement
nnoremap <leader>b ^
nnoremap <leader>e g_

" LSP
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
