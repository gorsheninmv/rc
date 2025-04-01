local ok, module = pcall(require, 'deno-nvim')
if not ok then
  module = nil
end

if not module then
  print('module deno-nvim not found')
  return
end

module.setup({})
