local tree_sitter = require'nvim-treesitter.configs'

tree_sitter.setup {
  ensure_installed = {
    'html',
    'css',

    'lua',
    'vim',

    'markdown',
    'markdown_inline',

    'luadoc',
    'vimdoc',
  },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  }
}
