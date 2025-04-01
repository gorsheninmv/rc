# TODO: rewrite on Lua
vim.api.nvim_exec([[
function! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
]], true)

local createcmd = vim.api.nvim_create_user_command
createcmd("TrimEndLines", function ()
  vim.cmd(":call TrimEndLines()")
end, {})
