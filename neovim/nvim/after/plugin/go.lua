local g = vim.api.nvim_create_augroup("go-after-plugin", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = g,
  pattern = "*.go",
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = g,
      buffer = args.buf,
      callback = function()
        local params = vim.lsp.util.make_range_params(0, "utf-8")
        params["context"] = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
        vim.lsp.buf.format({ async = false })
      end
    }
    )
  end
})

local ns = vim.api.nvim_create_namespace("no-usages")
local function append_virtual_text(bufnr, line, start, stop, source)
  vim.diagnostic.set(ns, bufnr, {{
    bufnr = bufnr,
    lnum = line, -- line number (0-indexed)
    col = start,
    end_col = stop,
    severity = vim.diagnostic.severity.WARN,
    message = "no usages",
    source = source,
  }})
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = g,
  pattern = "*.go",
  callback = function(args)

    local function analyze(ev)
        vim.diagnostic.reset(ns, ev.buf)

        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        -- skip unsupported clients
        if not client:supports_method("textDocument/documentSymbol") then
          return
        end

        vim.lsp.buf_request(ev.buf, "textDocument/documentSymbol", {
          textDocument = vim.lsp.util.make_text_document_params(),
        }, function(_, result, _, _)
          if not result then return end

          local function process(symbols)
            for _, sym in ipairs(symbols) do
              if vim.tbl_contains({ 5, 6, 8, 12, 13, 14, 23, }, sym.kind) then
                local pos = sym.selectionRange.start
                local line = pos.line

                local params = {
                  textDocument = vim.lsp.util.make_text_document_params(),
                  position = pos,
                  context = { includeDeclaration = true },
                }

                client:request("textDocument/references", params, function(_, refs)
                  if not refs or #refs == 0 then return end
                  vim.schedule(function()
                    local refsCount = #refs - 1

                    if refsCount == 0 then
                      local start = sym.selectionRange.start.character
                      local stop = sym.selectionRange["end"].character
                      append_virtual_text(ev.buf, line, start, stop, ev.file)
                    end
                  end)
                end, ev.buf)
              end
              if sym.children then
                process(sym.children)
              end
            end
          end

          process(result)
        end)
    end
    analyze(args)
    vim.api.nvim_create_autocmd({"BufWritePost", "BufEnter"}, {
      group = g,
      buffer = args.buf,
      callback = function(ev)
        analyze(ev)
      end
    })
  end
}
)

