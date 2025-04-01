local utils = require 'utils'
local toggle = utils.toggle

local setkmp = function(mode, lhs, rhs)
  local _setkmp = vim.keymap.set
  local nopts = { noremap = true, silent = true }
  local iopts = { noremap = true }
  local opts = nopts
  if mode ~= 'n' then
    opts = iopts
  end
  _setkmp(mode, lhs, rhs, opts)
end

-- change keyboard layout
setkmp('i', '<C-f>', '<C-^>')

-- toggle formatting symbols
setkmp('n', '<leader>fs', function() toggle('list') end)

-- close bracket/quote
setkmp('i', '""', '""<LEFT>')
setkmp('i', "''", "''<LEFT>")
setkmp('i', '[]', '[]<LEFT>')
setkmp('i', '{}', '{}<LEFT>')
setkmp('i', '()', '()<LEFT>')
setkmp('i', '<>', '<><LEFT>')

-- add new line in normal mode
setkmp('n', '<leader>o', 'o<ESC>')
setkmp('n', '<leader>O', 'O<ESC>')

-- move cursor over line
setkmp("i", "<c-e>", "<c-o>$")
setkmp("n", "<leader>gg", "0")
setkmp("n", "<leader>G", "g_")

-- search word in the current window
setkmp("n", "<leader>f", "<c-*>")

-- insert mode movements
setkmp("i", "<c-h>", '<left>')
setkmp("i", "<c-j>", '<down>')
setkmp("i", "<c-k>", '<up>')
setkmp("i", "<c-l>", '<right>')

-- set the parent directory of the current file as the current working directory
setkmp('n', "<leader>cd", ":lcd %:h<cr>")

-- move over buffers
setkmp("n", "<leader>h", function() vim.cmd("bprevious") end)
setkmp("n", "<leader>l", function() vim.cmd("bnext") end)
