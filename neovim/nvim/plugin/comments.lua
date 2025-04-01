local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General", { clear = true })

autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove { "r", "o" }
  end,
  group = general,
  desc = "Disable newline comment",
})
