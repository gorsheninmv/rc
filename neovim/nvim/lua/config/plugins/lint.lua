-- plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  enabled = false, -- TODO: parser doesn't work correctly
  config = function()
    local lint = require("lint")

    -- Определяем линтер для SQLFluff
    lint.linters.sqlfluff = {
      cmd = "sqlfluff",
      args = {
        "lint",
        "--dialect", "postgres", -- укажите ваш диалект
        "--format", "json",
      },
      stream = "stdout",
      parser = function(output, bufnr)
        print("111", output)
        local diagnostics = {}
        local decoded = vim.json.decode(output)

        if decoded and decoded.violations then
          for _, violation in ipairs(decoded.violations) do
            table.insert(diagnostics, {
              lnum = (violation.line_no or 1) - 1,
              col = (violation.line_pos or 1) - 1,
              message = violation.description,
              severity = violation.code == "L001" and vim.diagnostic.severity.ERROR
                  or vim.diagnostic.severity.WARN,
              source = "sqlfluff"
            })
          end
        end

        print(vim.inspect(diagnostics))
        return diagnostics
      end
    }

    -- Назначаем линтер для SQL файлов
    lint.linters_by_ft = {
      sql = { "sqlfluff" },
    }

    -- Автолинтинг
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "TextChanged" }, {
      callback = function()
        print("lint!")
        lint.try_lint()
      end,
    })
  end
}
