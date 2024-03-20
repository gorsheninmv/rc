local ok, module = pcall(require, 'markdown-togglecheck')
if not ok then
  module = nil
end

if not module then
  print('module markdown-togglecheck not found')
  return
end

-- toggle checked / create checkbox if it doesn't exist
vim.keymap.set('n', '<leader>tc', module.toggle, { desc = 'Toggle Checkmark' });
-- toggle checkbox (it doesn't remember toggle state and always creates [ ])
vim.keymap.set('n', '<leader>tC', module.toggle_box, { desc = 'Toggle Checkbox' });
