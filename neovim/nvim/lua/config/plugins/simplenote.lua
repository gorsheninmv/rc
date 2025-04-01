local function openOrCreateTodayNote()
  local filename = os.date('%Y_%m_%d')
  vim.cmd("SimpleNoteCreate " .. filename)
end

return {
  "rguruprakash/simple-note.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    vim.api.nvim_create_user_command("SimpleNoteToday", openOrCreateTodayNote, {})

    local home_directory = tostring(vim.fn.expand('~'))
    require("simple-note").setup {
      notes_directories = {
        home_directory .. "/Dropbox/simple-notes/work/",
        home_directory .. "/Dropbox/simple-notes/personal/",
      },
    }
  end
}
