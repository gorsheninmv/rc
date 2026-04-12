local g = vim.api.nvim_create_augroup("lsp-after-plugin", { clear = true })

-- LSP defaults
--
-- grn is mapped in Normal mode to vim.lsp.buf.rename()
-- gra is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
-- grr is mapped in Normal mode to vim.lsp.buf.references()
-- gri is mapped in Normal mode to vim.lsp.buf.implementation()
-- gO is mapped in Normal mode to vim.lsp.buf.document_symbol()
-- K is mapped in Normal mode to vim.lsp.buf.hover()
-- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()

local function register_user_commands()
  vim.api.nvim_buf_create_user_command(
    0,
    "LspRename",
    function ()
      vim.lsp.buf.rename()
    end,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspCodeAction",
    function ()
      vim.lsp.buf.code_action()
    end,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspHover",
    function ()
      vim.lsp.buf.hover()
    end,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspSignatureHelp",
    function ()
      vim.lsp.buf.signature_help()
    end,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspCodelense",
    function ()
      vim.lsp.codelens.run()
    end,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspFormat",
    function ()
      vim.lsp.buf.format()
    end,
    {}
  )
end

local function register_keymaps()
  vim.keymap.set(
    "n",
    "gd",
    vim.lsp.buf.definition,
    { buffer = true }
  )

  vim.keymap.set(
    "n",
    "gre",
    vim.diagnostic.open_float,
    { buffer = true }
  )
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = g,
  callback = function(args)
    vim.lsp.codelens.refresh()
    vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
      group = g,
      buffer = args.buf,
      callback = vim.lsp.codelens.refresh,
    })

    register_user_commands()
    register_keymaps()
  end
})
