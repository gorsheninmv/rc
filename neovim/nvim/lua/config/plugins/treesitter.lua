return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = function()
    local updater = require("nvim-treesitter.install")
    updater.update { with_sync = true }
  end,
  opts = {
    -- TODO: create an issue
    --install_dir = "~/.local/share/nvim/lazy/nvim-treesitter/new"
  },
  config = function ()
      require'nvim-treesitter'.install { 'c', 'lua', 'vim', "vimdoc", "markdown", "go", "http" }
  end
}
