local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings {{{
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer=0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer=0 })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer=0 })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer=0 })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer=0 })
  vim.keymap.set('n', '<leader>ed', vim.diagnostic.open_float, { buffer=0 })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer=0 })

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  elseif client.server_capabilities.document_range_formatting then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end
  -- }}}

end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- others lsp {{{
nvim_lsp.pyright.setup { on_attach = on_attach }
nvim_lsp.rls.setup { on_attach = on_attach }
nvim_lsp.ts_ls.setup { on_attach = on_attach }
nvim_lsp.texlab.setup { on_attach = on_attach }
nvim_lsp.fsautocomplete.setup {
    on_attach = on_attach,
    cmd = { "fsautocomplete" },
    settings = {
      FSharp = {
        keywordsAutocomplete = true,
      },
    },
}
nvim_lsp.sqlls.setup {
  on_attach = function(client, bufnr)
    require('sqlls').on_attach(client, bufnr)
    on_attach(client, bufnr)
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=localhost port=5432 user=postgres password=11111 dbname=postgres sslmode=disable',
        }
      }
    }
  }
}

nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json"),
  init_options = {
    lint = true,
  },
}

nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
-- }}}

-- lua {{{
nvim_lsp.lua_ls.setup {}
-- USER = vim.fn.expand('$USER')
-- local sumneko_binary = '/usr/bin/lua-language-server'
-- nvim_lsp.lua_ls.setup {
--     on_attach = on_attach,
--     cmd = { sumneko_binary, '-E', '/usr/share/lua-language-server/main.lua' },
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'Lua 5.4',
--                 -- Setup your lua path
--                 path = '/usr/bin/lua'
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim' }
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
--             }
--         }
--     }
-- }
-- }}}
