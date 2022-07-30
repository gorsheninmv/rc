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
  undodir = '~/.vim/tmp/undo//',
  undofile = true,
  backspace = 'indent,eol,start',
  directory = '~/.vim/tmp/swap//',
  completeopt = 'menuone,noselect',

  -- text formatting
  modelines = 5,
  modeline = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  autoindent = true,

  -- keyboard layout
  keymap = 'russian-jcukenwin',
  iminsert = 0,
  imsearch = 0,

  listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:•',
}

for k, v in pairs(options) do
  vim.o[k] = v
end

vim.api.nvim_exec([=[
  language messages C             " set UI lang as en

  " Colorscheme
  set background=light
  color PaperColor
  syntax on
  highlight ColorColumn ctermbg=red
  hi NonText ctermfg=242
  hi Whitespace ctermfg=242

  filetype plugin on              " enable filetype detection

  au BufEnter * set fo-=r fo-=o   " disable putting comment symbols automatically

  set statusline=%F%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ col:%2c\ line:%2l/%L\ [%2p%%]
]=], true)
EOF
