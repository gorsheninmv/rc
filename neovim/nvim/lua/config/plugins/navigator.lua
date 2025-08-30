return {
  "gorsheninmv/navigator.lua",
  branch = "fix-fmt-au",
  dependencies = {
    { "hrsh7th/nvim-cmp" },
    { "neovim/nvim-lspconfig" },
    { "nvim-treesitter/nvim-treesitter" },
    {
      "ray-x/guihua.lua",
      build = "cd lua/fzy && make"
    },
    {
      "gorsheninmv/go.nvim",
      branch = "fix-default-log-location",
      event = { "CmdlineEnter" },
      ft = { "go", "gomod" },
      build = function() require("go.install").update_all_sync() end,
      opts = {
        goimports = "goimports",
        lsp_cfg = true,
        verbose = true,
        lsp_inlay_hints = {
          enable = false,
        },
      },
      config = function(lp, opts)
        require("go").setup(opts)
        local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
          require('go.format').goimports()
          end,
          group = format_sync_grp,
        })
      end,
    },
  },
  opts = {
    debug = true,
    lsp = {
      dianostic = {
        register = "D",
      },
      format_on_save = {
        disable = {
          "go",
          "lua",
        },
      },
    },
  },
}
