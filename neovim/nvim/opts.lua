local opts = vim.opt
local cmd = vim.cmd

opts.number = true                            -- show line numbers
opts.autoread = true                          -- read changes automatically
opts.ic = true                                -- ignorecase when searching
opts.linebreak = true                         -- wrap lines
opts.dy = 'lastline'                          -- carry by words
opts.laststatus = 2                           -- show statusline
opts.showtabline = 1                          -- show tabline if more than one tabs
opts.exrc = true                              -- enable external config files
opts.showcmd = true                           -- show executed command
opts.encoding = 'utf-8'                       -- use utf-8 as encoding
opts.confirm = true                           -- ask for saving file when quit
opts.scrolloff = 3                            -- scrolloffset
opts.showmode = true                          -- show current mode
opts.foldmethod = 'marker'                    -- use marker as foldmethod
opts.hidden = true                            -- hide buffer if it was abandoned
opts.visualbell = true                        -- enable visualbell
opts.cursorline = true                        -- highlight current line
opts.ruler = true                             -- show cursor position always
opts.colorcolumn = '100'                        -- highlight max width
opts.relativenumber = true                    -- show relative line numbers
opts.wildmenu = true                          -- enable command-line completion
opts.wildmode = {list = 'longest'}            -- show matches in list
opts.undodir = '~/.vim/tmp/undo//'            -- use undo directory
opts.undofile = true                          -- enable undofile
opts.backspace = {'indent', 'eol', 'start'}   -- use backspace to delete symbols
opts.directory = '~/.vim/tmp/swap//'          -- swap files locate there
opts.completeopt = {'menuone' , 'noselect'}   -- completion menu settings

-- Text formatting
opts.modelines = 5
opts.modeline = true
opts.tabstop = 2
opts.shiftwidth = 2
opts.softtabstop = 2
opts.expandtab = true
opts.autoindent = true

-- Keyboard layout
opts.keymap = 'russian-jcukenwin'    -- add russian keymap
opts.iminsert = 0                    -- lmap is off by default in insert mode
opts.imsearch = 0                    -- lmap is off by default in search mode

-- Formatting symbols form
opts.listchars = {
  eol = '¬',
  tab = '>·',
  trail = '~',
  extends = '>',
  precedes = '<',
  space = '•'
}

-- Statusline format
opts.statusline = [=[%F%m%r%h%w %y enc:%{&enc} ff:%{&ff} col:%2c line:%2l/%L [%2p%%]]=]

-- set UI lang as en
cmd('language messages C')

-- Colorscheme
opts.background = 'light'
cmd('color PaperColor')
cmd('syntax on')
cmd('highlight ColorColumn ctermbg=red')


if vim.fn.has('nvim') then
  cmd('hi NonText ctermfg=242')
  cmd('hi Whitespace ctermfg=242')
end

cmd('filetype plugin on')              -- enable filetype detection
cmd('au BufEnter * set fo-=r fo-=o')   -- disable putting comment symbols automatically
vim.g.mapleader = ","                  -- set leader key
