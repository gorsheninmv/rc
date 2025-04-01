return {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  opts = {},
  config = function()
    require("oil").setup {
      buf_options = {
        bufhidden = "delete",
      },
      keymaps = {
        ["l"] = {"actions.select", mode = "n"},
        ["h"] = {"actions.parent", mode = "n"},
        ["c-r"] = { "actions.refresh", mode = "n" },
      },
      view_options = {
        show_hidden = true,
      },
    }

    vim.keymap.set("n", "<leader>b", function() vim.cmd("Oil") end, {silent = true, noremap = true})
  end
}
