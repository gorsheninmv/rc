local ok, module = pcall(require, 'follow-md-links')
if not ok then
  module = nil
end

if not module then
  print('module follow-md-links not found')
  return
end

print('hola')
vim.keymap.set('n', 'gx', module.follow_link)
