local M = {}

M.toggle = function(opt_name)
  local value = not vim.opt[opt_name]:get()
  vim.opt[opt_name] = value
end

return M

