lua << EOF
local options = {
  number = true,
  autoread = true,
  ic = true,
  linebreak = true,
  dy = 'lastline',
  laststatus = 2,
  showtabline = 1,
  exrc = true,
  showcmd = true,
  encoding = 'utf-8',
  confirm = true,
  scrolloff = 3,
  showmode = true,
  foldmethod = 'marker',
  hidden = true,
  visualbell = true,
  cursorline = true,
  ruler = true,
  colorcolumn='100',
  relativenumber = true,
  wildmenu = true,
  wildmode = 'list:longest',
  undofile = true,
  backspace = 'indent,eol,start',
  completeopt = 'menuone,noselect',

  -- text formatting
  modelines = 5,
  modeline = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  autoindent = true,

  listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:•',
}

for k, v in pairs(options) do
  vim.o[k] = v
end

-- keyboard layout
-- TODO: There are problems with initialization option through
-- the table traverse. It seems, there is data race since sometimes
-- iminsert and imsearch are set to 1. Need to open issue.
vim.o.keymap = 'russian-jcukenwin'
vim.o.iminsert = 0
vim.o.imsearch = 0

vim.api.nvim_exec([=[
  language messages C             " set UI lang as en

  " Colorscheme
  set background=light
  color PaperColor
  syntax on
  highlight ColorColumn ctermbg=red

  filetype plugin on              " enable filetype detection

  au BufEnter * set fo-=r fo-=o   " disable putting comment symbols automatically

  set statusline=%F%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ col:%2c\ line:%2l/%L\ [%2p%%]
]=], true)
EOF