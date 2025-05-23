return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy",
    "honza/vim-snippets",
  },
  config = function()
    local snippy = require("snippy")
    snippy.setup {
      mappings = {
        is = {
          ["<Tab>"] = "expand_or_advance",
          ["<S-Tab>"] = "previous",
        },
        nx = {
          ["<leader>x"] = "cut_text",
        },
      },
    }

    local cmp = require("cmp")

    cmp.setup {
      snippet = {
        expand = function(args)
          require 'snippy'.expand_snippet(args.body)
        end
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "snippy",   keyword_length = 2 },
      }, {
        { name = "buffer", keyword_length = 3 },
      }),
      preselect = cmp.PreselectMode.None,
    }

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    cmp.setup.filetype({"sql"}, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" }
      }
    })
  end,
}
--
