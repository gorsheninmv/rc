local ok, module = pcall(require, 'simple-note')
if not ok then
  module = nil
end

if not module then
  print('module simple-note not found')
  return
end

module.setup {
  notes_dir = '~/notes/',
  telescope_new = '<C-n>',
  telescope_delete = '<C-x>',
  telescope_rename = '<C-r>',
}
