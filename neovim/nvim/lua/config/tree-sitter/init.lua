local tree_sitter = require'nvim-treesitter.configs'

tree_sitter.setup {
  ensure_installed = {
    'html',
    'css',
    'lua',
  },
  highlight = {
    enable = true,
  }
}
