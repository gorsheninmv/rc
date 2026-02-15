return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
  },
  lazy = true,
  ft = "go",
  config = function()
    local dap, dapui = require('dap'), require('dapui')
    local dapgo = require('dap-go')
    dapui.setup({
      layouts = {
        {
          elements = {
            "scopes",
          },
          size = 10,
          position = "bottom"
        },
      },
    })
    dapgo.setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end


    -- Include the next few lines until the comment only if you feel you need it
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    -- Include everything after this


    vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
    vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end)
    vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end)
    vim.keymap.set('n', '<leader>dO', function() require('dap').step_out() end)
    vim.keymap.set('n', '<leader>db', function()
      require('dap').toggle_breakpoint()
    end)
    vim.keymap.set('n', '<leader>dl', function()
      require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end)
    vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
    vim.keymap.set('n', '<leader>dr', function() require('dap').run_last() end)

    vim.keymap.set('n', '<leader>dw', function() dapui.open() end)
    vim.keymap.set('n', '<leader>dW', function() dapui.close() end)

    vim.api.nvim_create_user_command("DapStack",
      function ()
        dapui.float_element("stacks", { enter = true })
      end,
      {}
    )

  end
}
