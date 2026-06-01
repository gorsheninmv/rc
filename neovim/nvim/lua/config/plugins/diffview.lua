return {
  "dlyongemallo/diffview.nvim",
  version = "*",
  cmd = "DiffviewOpen", -- test
  config = function()
    require("diffview").setup({
      persist_selections = { enabled = true },
      enhanced_diff_hl = true,
      use_icons = true,
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_horizontal" },
      },
      file_panel = {
        listing_style = "tree",
        win_config = { position = "left", width = 35 },
      },
    })
  end,
}
