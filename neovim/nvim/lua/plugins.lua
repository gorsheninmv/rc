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
    use {
      'majutsushi/tagbar',
      cond = function() return true end,
    }
    use {
      'Yggdroot/indentLine',
      cond = function() return true end,
    }
    use {
      'tpope/vim-surround',
      cond = function() return true end,
    }
    use {
      'jpalardy/vim-slime',
      cond = function() return true end,
    }
    use {
      'wlangstroth/vim-racket',
      ft = { 'racket' },
      requires = {
        {
          'junegunn/rainbow_parentheses.vim',
          ft = { 'racket' },
        },
      },
      cond = function() return true end,
    }
    use {
      'wesQ3/vim-windowswap',
      cond = function() return true end,
    }
    use {
      'vim-scripts/TagHighlight',
      cond = function() return true end,
    }
    use {
      'lervag/vimtex',
      ft = { 'tex' },
      cond = function() return true end,
    }
    use {
      'tpope/vim-commentary',
      cond = function() return true end,
    }
    use {
      'neovim/nvim-lspconfig',
      cond = function() return true end,
      after = { 'mason-lspconfig.nvim' },
      config = function()
        require('config.lsp')
      end
    }
    use {
      'alec-gibson/nvim-tetris',
      cond = function() return true end,
    }
    use {
      'PhilT/vim-fsharp',
      ft = { 'fs' },
      cond = function() return true end,
    }
    use {
      'sindrets/diffview.nvim',
      cond = function() return true end,
      config = function()
        require('diffview').setup()
      end,
    }
    use {
      'nvim-lua/plenary.nvim',
      cond = function() return true end,
    }
    use {
      'vim-test/vim-test',
      config = function()
        require('config.vim-test')
      end
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('config.telescope')
      end,
    }
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    }
    use {
      'nvim-tree/nvim-tree.lua',
      requires = { 'nvim-tree/nvim-web-devicons' },
      cond = function() return true end,
      config = function()
        require('config.nvim-tree')
      end,
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('config.lualine')
      end,
    }
    use {
      'williamboman/mason-lspconfig.nvim',
      cond = function() return true end,
      requires = {
        {
          'williamboman/mason.nvim',
          config = function()
            require('mason').setup()
          end,
        },
      },
      config = function()
        require('mason-lspconfig').setup {
          ensure_installed = {'lua_ls'}
        }
      end,
    }
    use {
      'nanotee/sqls.nvim',
      ft = { 'sql' },
      cond = function() return true end,
    }
    use {
      'pappasam/papercolor-theme-slim',
      cond = function() return true end,
      config = function()
        require('colors')
      end
    }
    use {
      'Mofiqul/dracula.nvim',
      cond = function() return false end,
      config = function()
        vim.cmd[[color dracula]]
      end
    }
    use {
      'hrsh7th/nvim-cmp',
      cond = function() return true end,
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'dcampos/nvim-snippy',
        'dcampos/cmp-snippy',
        'honza/vim-snippets',
      },
      config = function()
        require('config.nvim-snippy')
        require('config.nvim-cmp')
      end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        cond = function() return true end,
        config = function()
          require('config.tree-sitter')
        end
    }
    use {
        'windwp/nvim-ts-autotag',
    }
    use {
      "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup({})
        end
    }
    use {
      'rguruprakash/simple-note.nvim',
      cond = function() return true end,
      requires = {
        'nvim-telescope/telescope.nvim'
      },
      config = function()
        require('config.simple-note')
      end
    }
    use {
      'sigmasd/deno-nvim',
      ft = { 'typescript' },
      config = function()
        require('config.deno')
      end,
    }
    use {
      'nfrid/markdown-togglecheck',
      ft = { 'markdown' },
      cond = function() return true end,
      requires = {
        'nfrid/treesitter-utils'
      },
      config = function()
        require('config.markdown-togglecheck')
      end,
    }
    use {
      ft = { 'markdown' },
      'gorsheninmv/follow-md-links.nvim',
      branch = 'feat-follow-key',
      cond = function() return true end,
      config = function()
        require('config.follow-md-links')
      end,
    }

    -- debug {{{
    use {
      'theHamsta/nvim-dap-virtual-text',
      opt = true,
    }
    use {
      'nvim-telescope/telescope-dap.nvim',
      opt = true,
      config = function()
        require('config.telescope-dap')
      end,
    }
    use {
      'rcarriga/nvim-dap-ui',
      opt = true,
      wants = {
        'nvim-nio',
      },
    }
    use {
      'nvim-neotest/nvim-nio',
      opt = true,
    }
    use {
      'mfussenegger/nvim-dap',
      opt = true,
      module = { 'dap' },
      wants = {
        'nvim-dap-virtual-text',
        'nvim-dap-ui'
      },
      config = function()
        local dap = require('config.dap')
        dap.setup()
      end,
    }
    use {
      'leoluz/nvim-dap-go',
      opt = true,
      keys = { [[<leader>d]] },
      wants = {
        'telescope-dap.nvim',
        'nvim-dap',
      },
      config = function()
        require('config.dap.go')
      end,
    }
    -- }}}

    use {
      "akinsho/toggleterm.nvim",
      tag = '*',
      cond = function() return true end,
      config = function()
        require('toggleterm').setup()
        require('config.toggleterm')
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
    },
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


-- IndentLine
vim.g.indentLine_fileTypeExclude = { 'markdown' }

vim.cmd[[
augroup filetypedetect
  autocmd!
  autocmd BufNewFile,BufRead *.md setlocal conceallevel=0
augroup END
]]


local utils = require 'utils'
local execcmd = utils.execcmd

-- bufexplorer {{{
vim.keymap.set('n', '<F10>',
  function()
    execcmd('ToggleBufExplorer')
  end,
  { noremap = true, silent = true })
-- }}}
