"=============================================================================
" QuickFixの設定
"=============================================================================

" ステータスラインを設定
let &l:statusline .= '%=[%{len(getqflist())} errors]'