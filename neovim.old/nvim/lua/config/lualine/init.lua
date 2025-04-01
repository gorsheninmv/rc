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
