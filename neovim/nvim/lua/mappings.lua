local setkmp = vim.keymap.set
local nopts = { noremap = true, silent = true }
local iopts = { noremap = true }

-- change keyboard layout
setkmp('i', '<C-f>', '<C-^>', iopts)

-- toggle formatting symbols
setkmp('n', '<F3>', ':set list!<CR>', nopts)

-- resize splits
setkmp('n', '<leader>h', ':vertical resize +5<CR>', nopts)
setkmp('n', '<leader>l', ':vertical resize -5<CR>', nopts)
setkmp('n', '<leader>j', ':resize +5<CR>', nopts)
setkmp('n', '<leader>k', ':resize -5<CR>', nopts)
setkmp('n', '<leader>=', '<C-w>=', nopts)

-- close bracket/quote
setkmp('i', '""', '""<LEFT>', iopts)
setkmp('i', "''", "''<LEFT>", iopts)
setkmp('i', '[]', '[]<LEFT>', iopts)
setkmp('i', '{}', '{}<LEFT>', iopts)
setkmp('i', '()', '()<LEFT>', iopts)
setkmp('i', '<>', '<><LEFT>', iopts)

-- add new line in normal mode
setkmp('n', '<leader>o', 'o<ESC>', nopts)
setkmp('n', '<leader>O', 'O<ESC>', nopts)

-- move cursor over line
setkmp('i', '<C-e>', '<C-o>$', iopts)
setkmp('n', '<leader>e', 'g_', nopts)
setkmp('n', '<leader>b', '^', nopts)

-- search word in the current window
setkmp('n', '<leader>f', '<C-*>', nopts)

-- insert mode movements
setkmp('i', '<C-h>', '<LEFT>', iopts)
setkmp('i', '<C-j>', '<DOWN>', iopts)
setkmp('i', '<C-k>', '<UP>', iopts)
setkmp('i', '<C-l>', '<RIGHT>', iopts)
