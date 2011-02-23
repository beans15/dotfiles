" 時々消えるので
setl autoindent

" Lintで構文チェックを行う
nnoremap <buffer> ,l :call perllint#lint()<CR>
