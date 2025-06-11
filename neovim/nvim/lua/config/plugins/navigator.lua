return {
  "ray-x/navigator.lua",
  dependencies = {
    { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
    "neovim/nvim-lspconfig",
  },
  config = function()
    local navigator = require('navigator')
    navigator.setup({})
  end
}
