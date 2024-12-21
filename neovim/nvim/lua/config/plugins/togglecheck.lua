return {
  "nfrid/markdown-togglecheck",
  cond = function() return true end,
  config = function()
    -- toggle checked / create checkbox if it doesn't exist
    vim.keymap.set('n', '<leader>tc', require("markdown-togglecheck").toggle)
  end,
  dependencies = { "nfrid/treesitter-utils" },
  ft = { "markdown" },
  lazy = true,
}
