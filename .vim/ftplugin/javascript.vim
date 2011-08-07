setl autoindent

" javascript-lintで構文チェック
nnoremap <buffer> <Leader>L :call javascriptlint#lint()<CR>
