local function toggle_markdown_checkbox()
  local bufnr = vim.api.nvim_get_current_buf()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1

  local parser = vim.treesitter.get_parser()
  local tree = parser:parse()[1]
  local root = tree:root()

  -- Find the list_item that contains the cursor line
  local node = root:descendant_for_range(row, col, row, col)
  while node and node:type() ~= 'list_item' do
    node = node:parent()
  end
  if not node then return end

  -- Look for an existing checkbox inside this list_item
  local marker_node = nil
  for child in node:iter_children() do
    local t = child:type()
    if t == 'task_list_marker_unchecked' or t == 'task_list_marker_checked' then
      marker_node = child
      break
    end
  end

  if marker_node then
    -- Toggle [ ] ↔ [x]
    local text = vim.treesitter.get_node_text(marker_node, bufnr)
    local new_text = text == '[ ]' and '[x]' or '[ ]'
    local srow, scol, erow, ecol = marker_node:range()
    vim.api.nvim_buf_set_text(bufnr, srow, scol, erow, ecol, { new_text })
  else
    -- No checkbox yet → add one (plain list item → task list item)
    local list_marker = nil
    for child in node:iter_children() do
      if child:type():match('^list_marker_') then
        list_marker = child
        break
      end
    end

    if list_marker then
      -- list_marker range ends right before the space after the bullet
      -- so inserting " [ ]" here gives "- [ ] text" (or "1. [ ] text")
      local _, _, end_row, end_col = list_marker:range()
      vim.api.nvim_buf_set_text(bufnr, end_row, end_col, end_row, end_col, {'[ ] '})
    end
  end
end

-- Map it (change the key if you want)
vim.keymap.set('n', '<localleader>tc', toggle_markdown_checkbox, {
  desc = 'Toggle Markdown checkbox',
  silent = true,
})
