return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    require("telescope").setup {
      defaults = {
        layout_strategy = 'vertical',
        mappings = {
          n = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          },
        },
      },
    }

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ find_command = {'rg', '--files', '--hidden', '--no-ignore', '-g', '!.git' }}) end, {})
    vim.keymap.set("n", "<leader>gf", function() return builtin.live_grep({ additional_args = { '--hidden', '--no-ignore', '-g', '!.git' }}) end, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
  end,
}
