vim.o.title = true

vim.api.nvim_create_autocmd(
  { "BufEnter" },
  {
    callback = function()
        vim.o.titlestring = vim.fn.getcwd()
    end
  }
)
