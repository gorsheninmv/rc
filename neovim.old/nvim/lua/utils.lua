local M = {}

M.setkmp = function(mode, lhs, rhs)
  local _setkmp = vim.keymap.set
  local nopts = { noremap = true, silent = true }
  local iopts = { noremap = true }
  local opts = nopts
  if mode ~= 'n' then
    opts = iopts
  end
  _setkmp(mode, lhs, rhs, opts)
end

M.execcmd = vim.api.nvim_command

M.toggle = function(opt_name)
  local value = not vim.opt[opt_name]:get()
  vim.opt[opt_name] = value
end

return M
