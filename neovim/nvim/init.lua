vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.keymap.set("t", "<c-[>", "<c-\\><c-n>", { silent = true, buffer = true })
  end
})

require("config.opts")
require("config.maps")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
require("config.lazy")
