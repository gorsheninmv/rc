return {
  "ray-x/navigator.lua",
  dependencies = {
    { "hrsh7th/nvim-cmp" },
    { "neovim/nvim-lspconfig" },
    { "nvim-treesitter/nvim-treesitter" },
    {
      "ray-x/guihua.lua",
      build = "cd lua/fzy && make"
    },
    {
      "ray-x/go.nvim",
      event = { "CmdlineEnter" },
      ft = { "go", "gomod" },
      build = function() require("go.install").update_all_sync() end,
    },
  },
  config = function()
    local go, navigator = require("go"), require("navigator")
    go.setup({
      lsp_cfg = true,
      lsp_inlay_hints = {
        enable = false,
      },
    })
    navigator.setup({
      debug = true,
      lsp = {
        dianostic = {
          register = "D",
        }
      },
    })

    local format_sync_grp = vim.api.nvim_create_augroup("Format", { clear = false })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimport()
      end,
      group = format_sync_grp,
    })
  end
}
