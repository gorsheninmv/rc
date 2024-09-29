local utils = require 'utils'
local setkmp = utils.setkmp
local toggle = utils.toggle
local execcmd = utils.execcmd

-- change keyboard layout
setkmp('i', '<C-f>', '<C-^>')

-- toggle formatting symbols
setkmp('n', '<F3>', function() toggle('list') end)

-- resize splits
setkmp('n', '<leader>h', function() execcmd('vertical resize +5') end)
setkmp('n', '<leader>l', function() execcmd('vertical resize -5') end)
setkmp('n', '<leader>j', function() execcmd('resize +5') end)
setkmp('n', '<leader>k', function() execcmd('resize -5') end)
setkmp('n', '<leader>=', '<C-w>=')

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
setkmp('i', '<C-e>', '<C-o>$')
setkmp('n', '<leader>e', 'g_')
setkmp('n', '<leader>b', '^')

-- search word in the current window
setkmp('n', '<leader>f', '<C-*>')

-- insert mode movements
setkmp('i', '<C-h>', '<LEFT>')
setkmp('i', '<C-j>', '<DOWN>')
setkmp('i', '<C-k>', '<UP>')
setkmp('i', '<C-l>', '<RIGHT>')

-- set the parent directory of the current file as the current working directory
setkmp('n', '<leader>cd', ':lcd %:h<CR>')
