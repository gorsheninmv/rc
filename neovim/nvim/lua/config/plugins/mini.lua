return {
  {
    "echasnovski/mini.nvim",
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup { use_icons = true }
      local notify = require('mini.notify')
      notify.setup()

      local opts = nil
      if vim.o.verbose > 0 then
        opts = { DEBUG = { duration = 3000 } }
      end
      vim.notify = notify.make_notify(opts)
    end,
  }
}
