local function on_attach(bufnr)

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local api = require('nvim-tree.api')
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
end

require('nvim-tree').setup({
  on_attach = on_attach,
  sync_root_with_cwd = true
})

vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
