local options = {
  number = true,
  ignorecase = true,
  linebreak = true,
  laststatus = 3,
  encoding = 'utf-8',
  confirm = true,
  scrolloff = 3,
  foldmethod = 'marker',
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
  termguicolors = true,

  -- font
  guifont = 'Fira Code:h11',

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
