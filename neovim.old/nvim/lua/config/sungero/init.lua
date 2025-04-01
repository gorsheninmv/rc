vim.api.nvim_create_user_command('SungeroOpenConfigYml', function ()
  vim.cmd.edit('file:///D:/Projects/DirectumLauncher/etc/config.yml')
end, {})

vim.api.nvim_create_user_command('SungeroFormatJson', function ()
  vim.cmd('%!jq .')
end, {})
