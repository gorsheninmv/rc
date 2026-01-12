vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
    higroup = "IncSearch", -- Or a custom group
    timeout = 500,     -- Milliseconds to keep the highlight
    })
  end,
})
