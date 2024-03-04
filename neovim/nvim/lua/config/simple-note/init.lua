local ok, module = pcall(require, 'simple-note')
if not ok then
  module = nil
end

if not module then
  print('module simple-note not found')
  return
end

module.setup { }
