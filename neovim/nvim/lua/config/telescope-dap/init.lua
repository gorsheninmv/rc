local ok, module = pcall(require, 'telescope')
if not ok then
  module = nil
end

if not module then
  print('module telescope not found')
  return
end

module.load_extension('dap')
