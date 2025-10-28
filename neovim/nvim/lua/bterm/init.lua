local M = {
  storage = {}
}

---@param self table
---@param winid integer
M.open = function (self, winid)
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)

  self.storage[winid] = vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(winid)
end

---@param self table
---@param winid integer
---@param cmd string
M.exec = function (self, winid, cmd)
  local term_win_id = self.storage[winid]
  local buf_id = vim.api.nvim_win_get_buf(term_win_id)
  local job_id = vim.bo[buf_id].channel
  vim.fn.chansend(job_id, {cmd.."\r\n"})
end

return M

