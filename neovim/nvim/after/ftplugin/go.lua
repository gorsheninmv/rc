vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 0 -- when zero the 'tabstop' value will be used

vim.opt_local.foldmarker = "// #region,// #endregion"
vim.opt_local.foldmethod = "marker"

vim.treesitter.start()

vim.keymap.set(
  "n", "<localleader>ta",
  function()
    local winid = vim.api.nvim_get_current_win()
    local cmd = "gotestsum --format testname -- -tags=integration -fullpath ./..."
    require("bterm"):exec(winid, cmd)
  end,
  { buffer = true, noremap = true, silent = true }
)

vim.api.nvim_buf_create_user_command(
  0,
  "NeotestDebug",
  function() require("neotest").run.run({strategy = "dap"}) end,
  {}
)

vim.keymap.set(
  "n", "<localleader>t",
  require("neotest").run.run,
  {
    buffer = true,
    noremap = true,
    silent = true,
    desc = "run tests with Neotest",
  }
)

vim.keymap.set(
  "n", "<localleader>td",
  function ()
    require("neotest").run.run({strategy = "dap"})
  end,
  {
    buffer = true,
    noremap = true,
    silent = true,
    desc = "debug test with Neotest",
  }
)

