setl autoindent

" javascript-lintで構文チェック
nnoremap <buffer> ,l :call javascriptlint#lint()<CR>
