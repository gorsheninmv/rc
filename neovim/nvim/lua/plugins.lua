local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
]]

local packer = require 'packer'

packer.startup {
  function(use)
    use {
      'wbthomason/packer.nvim',
      opt = true
    }

    use 'jlanzarotta/bufexplorer'
    use 'majutsushi/tagbar'
    use 'Yggdroot/indentLine'
    use 'tpope/vim-surround'
    use 'jpalardy/vim-slime'
    use 'wlangstroth/vim-racket'
    use 'junegunn/rainbow_parentheses.vim'
    use 'wesQ3/vim-windowswap'
    use 'vim-scripts/TagHighlight'
    use 'NLKNguyen/papercolor-theme'
    use { 'lervag/vimtex', ft = { 'tex' } }
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'alec-gibson/nvim-tetris'
    use 'PhilT/vim-fsharp'
    use 'sindrets/diffview.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'vim-test/vim-test'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    }
    use {
      'nvim-tree/nvim-tree.lua',
      requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    }
    use 'nanotee/sqls.nvim'

    -- debug {{{
    use {
      "mfussenegger/nvim-dap",
      opt = true,
      keys = { [[<leader>d]] },
      module = { 'dap' },
      requires = {
        "alpha2phi/DAPInstall.nvim",
        'mxsdev/nvim-dap-vscode-js',
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "nvim-telescope/telescope-dap.nvim",
        { "jbyuki/one-small-step-for-vimkind", module = "osv" },
      },
      wants = {
        'DAPInstall.nvim',
        'nvim-dap-vscode-js',
        'nvim-dap-virtual-text',
        'nvim-dap-ui'
      },
      config = function()
        local dap = require('config.dap')
        dap.setup()
      end,
    }
    -- }}}

    use {
      "akinsho/toggleterm.nvim",
      tag = '*',
      config = function()
        require("toggleterm").setup()
      end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end

  end,
  config = {
    display = {
      open_fn = require('packer.util').float
    }
  }
}

-- Vim-slime
vim.g.slime_target = 'tmux'


-- WindowSwap
vim.g.wisndowswap_map_keys = 0


-- Echodoc
vim.g['echodoc#enable_at_startup'] = 1
vim.g['echodoc#type'] = 'floating'
vim.cmd[[highlight link EchoDocFloat Pmenu]]


-- Vimtex
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'mupdf'

-- Window Swap
vim.keymap.set('n', '<leader>s', vim.fn['WindowSwap#EasyWindowSwap'])

-- Tagbar
vim.keymap.set('n', '<F9>', '<cmd>TagbarToggle<cr>')

local utils = require 'utils'
local execcmd = utils.execcmd

-- bufexplorer {{{
vim.keymap.set('n', '<F10>',
  function()
    execcmd('ToggleBufExplorer')
  end,
  { noremap = true, silent = true })
-- }}}

-- nvim-compe {{{
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
-- }}}

-- telescope {{{
vim.keymap.set('n', '<leader>ff', function() return require'telescope.builtin'.find_files() end)
vim.keymap.set('n', '<leader>gf', function() return require'telescope.builtin'.live_grep() end)
-- }}}

-- lualine {{{
local lualine_colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
}

local function show_trailing_whitespace()
  local space = vim.fn.search([[\s\+$]], 'nwc')
  return space ~= 0 and "TW:"..space or ""
end

require 'lualine'.setup {
  options = {
    theme = 'papercolor_light',
  },
  sections = {
    lualine_b = {
      { show_trailing_whitespace, color = { bg = lualine_colors.orange } },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = lualine_colors.red, fg = lualine_colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = lualine_colors.orange, fg = lualine_colors.white } },
      },
  },
 },
}
-- }}}

-- diffview {{{
require'diffview'.setup()
-- }}}

-- lsp {{{
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings {{{
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer=0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer=0 })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer=0 })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer=0 })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer=0 })
  vim.keymap.set('n', '<leader>ed', vim.diagnostic.open_float, { buffer=0 })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer=0 })

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  elseif client.server_capabilities.document_range_formatting then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end
  -- }}}

end

-- others lsp {{{
nvim_lsp.pyright.setup { on_attach = on_attach }
nvim_lsp.rls.setup { on_attach = on_attach }
nvim_lsp.tsserver.setup { on_attach = on_attach }
nvim_lsp.texlab.setup { on_attach = on_attach }
nvim_lsp.fsautocomplete.setup {
    on_attach = on_attach,
    cmd = { "fsautocomplete" },
    settings = {
      FSharp = {
        keywordsAutocomplete = true,
      },
    },
}
nvim_lsp.sqlls.setup {
  on_attach = function(client, bufnr)
    require('sqlls').on_attach(client, bufnr)
    on_attach(client, bufnr)
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=localhost port=5432 user=postgres password=11111 dbname=postgres sslmode=disable',
        }
      }
    }
  }
}
nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json"),
  init_options = {
    lint = true,
  },
}
-- }}}

-- lua {{{
USER = vim.fn.expand('$USER')
local sumneko_binary = '/usr/bin/lua-language-server'
nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
    cmd = { sumneko_binary, '-E', '/usr/share/lua-language-server/main.lua' },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'Lua 5.4',
                -- Setup your lua path
                path = '/usr/bin/lua'
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
            }
        }
    }
}
-- }}}
-- }}}
