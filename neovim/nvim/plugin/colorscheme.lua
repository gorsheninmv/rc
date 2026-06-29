local function set_theme()
  -- Check what Neovim detected from Ghostty *before* the colorscheme overrides it
  if vim.o.background == 'light' then
    vim.cmd('colorscheme tokyonight-day')
  else
    vim.cmd('colorscheme tokyonight-night')
  end
end

-- Run once on startup
set_theme()

-- Listen to the terminal's theme shifts, rather than the option state
vim.api.nvim_create_autocmd('Signal', {
  pattern = 'SIGWINCH', -- Triggered when terminal properties refresh
  callback = function()
    -- Small defer prevents race conditions during active terminal theme shifts
    vim.schedule(set_theme)
  end,
})
