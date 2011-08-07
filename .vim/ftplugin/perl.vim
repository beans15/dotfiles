" 時々消えるので
setl autoindent

" Lintで構文チェックを行う
nnoremap <buffer> <Leader>L :call perllint#lint()<CR>
