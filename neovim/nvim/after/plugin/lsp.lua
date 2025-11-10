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
    vim.lsp.buf.rename,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspCodeAction",
    vim.lsp.buf.code_action,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspHover",
    vim.lsp.buf.hover,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspSignatureHelp",
    vim.lsp.buf.hover,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspCodelense",
    vim.lsp.codelens.run,
    {}
  )

  vim.api.nvim_buf_create_user_command(
    0,
    "LspFormat",
    vim.lsp.buf.format,
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
