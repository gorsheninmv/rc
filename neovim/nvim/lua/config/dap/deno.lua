
local M = {}

function M.setup()
  local dap = require "dap"

  -- vscode-js-debug (js-debug-adapter in Mason)
  require('dap-vscode-js').setup({
    debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
    debugger_cmd = {'js-debug-adapter'},
    adapters = {
      'pwa-node',
      'pwa-chrome',
      'pwa-msedge',
      'node-terminal',
      'pwa-extensionHost',
    },
  })

  -- temp solution for deno debug
  require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "js-debug-adapter", -- As I'm using mason, this will be in the path
      args = {"${port}"},
    }
  }

  -- add configuration for typescript and javascript
  for _, language in ipairs({'typescript', 'javascript'}) do
    dap.configurations[language] = {
      {
        request = 'launch',
        name = 'Deno launch',
        type = 'pwa-node',
        program = '${file}',
        cwd = '${workspaceFolder}',
        runtimeExecutable = '/usr/bin/deno',
        runtimeArgs = {'run', '--inspect-brk'},
        attachSimplePort = 9229,
      },
      {
        request = 'launch',
        name = 'Deno test launch',
        type = 'pwa-node',
        program = '${file}',
        cwd = '${workspaceFolder}',
        runtimeExecutable = '/usr/bin/deno',
        runtimeArgs = {'test', '--inspect-brk'},
        attachSimplePort = 9229,
      },
    }
  end
end

return M
