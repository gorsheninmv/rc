local ok, module = pcall(require, 'dap-go')
if not ok then
  module = nil
end

if not module then
  print('module dap-go not found')
  return
end

module.setup()
