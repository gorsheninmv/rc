vim.api.nvim_create_user_command("CopyFullPath", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  print("Full path copied!")
end, { nargs = 0 })

vim.api.nvim_create_user_command("CopyRelativePath", function()
  vim.fn.setreg("+", vim.fn.expand("%:."))
  print("Relative path copied!")
end, { nargs = 0 })
