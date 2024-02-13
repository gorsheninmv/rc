local tree_sitter = require'nvim-treesitter.configs'

tree_sitter.setup {
  ensure_installed = {
    'html',
    'css',
    'lua',
    'markdown',
    'markdown_inline',
  },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  }
}
