local ok, module = pcall(require, 'simple-note')
if not ok then
  module = nil
end

if not module then
  print('module simple-note not found')
  return
end

local function openOrCreateTodayNote()
  local filename = os.date('%Y_%m_%d')
  vim.cmd('SimpleNoteCreate ' .. filename)
end

vim.api.nvim_create_user_command('SimpleNoteToday', openOrCreateTodayNote, {})

module.setup { }
