local createcmd = vim.api.nvim_create_user_command

createcmd("SungeroOpenConfigYml", function ()
  vim.cmd.edit(vim.fs.normalize("d:/Projects/DirectumLauncher/etc/config.yml"))
end, {})

createcmd("SungeroFormatJson", function ()
  vim.cmd("%!jq .")
end, {})

