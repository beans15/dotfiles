" 1行の長さは最大で120まで
setl tw=120
" オートインデント
setl autoindent

" PHPのlintで構文チェック
nnoremap ,l :call phplint#lint()<CR>
