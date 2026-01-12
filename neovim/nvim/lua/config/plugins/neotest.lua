return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      {
        "nvim-treesitter/nvim-treesitter", -- Optional, but recommended
        branch = "main",  -- NOTE; not the master branch!
        build = function()
          vim.cmd(":TSUpdate go")
        end,
      },
      {
        "fredrikaverpil/neotest-golang",
        version = "*",  -- Optional, but recommended; track releases
        build = function()
          vim.system({"go", "install", "gotest.tools/gotestsum@latest"}):wait() -- Optional, but recommended
        end,
      },
    },
    config = function()
      local config = {
        runner = "gotestsum", -- Optional, but recommended
        testify_enabled = true,
        warn_test_name_dupes = false,
        go_test_args = { "-tags=e2e,integration" },
        go_list_args = { "-tags=e2e,integration" },
        dap_go_opts = {
          delve = {
            build_flags = { "-tags=e2e,integration" },
          },
        },
      }
      require("neotest").setup({
        output = {
          enabled = false,
        },
        adapters = {
          require("neotest-golang")(config),
        },
      })
    end,
  },
}
