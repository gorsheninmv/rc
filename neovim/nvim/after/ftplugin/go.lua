vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 0 -- when zero the 'tabstop' value will be used

vim.opt_local.foldmarker = "// #region,// #endregion"
vim.opt_local.foldmethod = "marker"

vim.treesitter.start()

vim.keymap.set("n", "<localleader>ta", function()
  local winid = vim.api.nvim_get_current_win()
  local cmd = "gotestsum --format testname -- -fullpath ./..."
  print("test")
  require("bterm"):exec(winid, cmd)
end, { buffer = true, noremap = true, silent = true })
