return {
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "[kulala] Send request" },
      { "<leader>Ra", desc = "[kulala] Send all requests" },
      { "<leader>Rb", desc = "[kulala] Open scratchpad" },
    },
    ft = { "http", "rest", "gprc" },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },
}
