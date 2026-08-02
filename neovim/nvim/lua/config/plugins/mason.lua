return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
        "protols",
        "yamlls",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      -- Astro configuration (this works reliably)
      vim.lsp.config("astro", {
        init_options = {
          typescript = {},
        },
        before_init = function(_, config)
          config.init_options = config.init_options or {}
          config.init_options.typescript = config.init_options.typescript or {}

          local tsdk_path = vim.fs.normalize(
            "/Users/mg/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib"
          )

          config.init_options.typescript.tsdk = tsdk_path
        end,
      })
    end,
  },
}
