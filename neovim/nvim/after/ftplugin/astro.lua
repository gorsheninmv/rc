vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 0 -- when zero the 'tabstop' value will be used

vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = 0,
  callback = function()
    vim.lsp.buf.format()
  end,
})
