vim.api.nvim_buf_create_user_command(
  0,
  "GoFilter",
  function ()
    vim.cmd([[Cfilter! \v\.pb|\.gen\.go|\.proto|_test\.go]])
  end,
  {}
)
