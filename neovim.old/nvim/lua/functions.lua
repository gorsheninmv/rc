vim.api.nvim_exec([[
function! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction


function! EnablePresentationMode()
    set norelativenumber
    set nonumber
    set noshowmode
    set noshowcmd
    set noruler
    set laststatus=0
    set nocursorline
    IndentLinesDisable
    nnoremap <silent>h :bp<CR> :redraw!<CR>
    nnoremap <silent>l :bn<CR> :redraw!<CR>

    augroup AutoSource
        autocmd! BufEnter * call AutoSource()
    augroup END
endfunction


function! DisablePresentationMode()
    set relativenumber
    set number
    set showmode
    set showcmd
    set ruler
    set laststatus=2
    set showtabline=1
    set cursorline
    IndentLinesEnable
    unmap h
    unmap l

    autocmd! AutoSource
endfunction


function! AsciiTitle()
    silent execute '.!toilet -f standard'
endfunction


function! AsciiBorder()
    silent execute '.!toilet -f term -F border'
endfunction


let g:presentationBoundsDisplayed = 0
function! DisplayPresentationBoundaries()
  if g:presentationBoundsDisplayed
    match
    set colorcolumn=0
    let g:presentationBoundsDisplayed = 0
  else
    highlight lastoflines ctermbg=black
    match lastoflines /\%23l/
    set colorcolumn=80
    let g:presentationBoundsDisplayed = 1
  endif
endfunction


" Usage: !!: open pic.jpg
function! FindExecuteCommand()
  let line = search('\S*!'.'!:.*')
  if line > 0
    let command = substitute(getline(line), "\S*!"."!:*", "", "")
    execute "silent !". command
    execute "normal gg0"
    redraw
  endif
endfunction


function! AutoSource()
"    let l:testedScripts = ['syntax.vim']
"    if expand('<afile>:e') !=# 'vim'
"        " Don't source the edited Vimscript file itself.
"        call add(l:testedScripts, 'syntax.vim')
"    endif
"
"    for l:filespec in l:testedScripts
"        if filereadable(l:filespec)
"            execute 'source' fnameescape(l:filespec)
"        endif
"    endfor

    call FindExecuteCommand()
endfunction
]], true)
