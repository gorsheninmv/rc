local function enable()
vim.diagnostic.handlers["quickfix"] = {
  show = function(_, _, _, _)
    vim.diagnostic.setqflist({ open = true })
  end,

  hide = function(_, _)
    vim.fn.setqflist({}, 'r')
  end
}
end

local function disable()
  vim.diagnostic.handlers["quickfix"] = nil
end

local function qfdiag_toggle()
  if vim.g.qfdiag then
    disable()
    vim.g.qfdiag = false
    vim.cmd("cclose")
    vim.notify("quickfix diagnostic disabled")
  else
    enable()
    vim.g.qfdiag = true
    local winid = vim.api.nvim_get_current_win()
    vim.cmd("copen")
    vim.diagnostic.setqflist({ open = false })
    vim.api.nvim_set_current_win(winid)
    vim.notify("quickfix diagnostic enabled")
  end
end

vim.api.nvim_create_user_command(
  "QuickfixDiagToggle",
  qfdiag_toggle,
  {}
)

