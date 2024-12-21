return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    local updater = require("nvim-treesitter.install")
    updater.update { with_sync = true }
  end,
  config = function()
    local tree_sitter = require("nvim-treesitter.configs")

    tree_sitter.setup {
      ensure_installed = {
        "html",
        "css",

        "lua",
        "vim",

        "markdown",
        "markdown_inline",

        "luadoc",
        "vimdoc",
      },
      highlight = {
        enable = true,
      },
      autotag = {
        enable = true,
      }
    }
  end,
}
