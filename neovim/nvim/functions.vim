function! Funcs_Grep(type)
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -r " . shellescape(@@) . " ."
    silent copen 20
endfunction


let s:nerdTreeStatus = 0

function! Funcs_NerdTreeToggle()
    exec 'NERDTreeToggle'
    if s:nerdTreeStatus == 0
        let s:nerdTreeStatus = 1
        exec 'hi NERDTreeFile ctermfg=none'
    endif
endf


function! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction


function! GrepPrompt()
    call inputsave()
    let word = input('->: ')
    call inputrestore()
    silent execute "grep! -r -i " . word . " ."
    silent copen 20
endfunction
