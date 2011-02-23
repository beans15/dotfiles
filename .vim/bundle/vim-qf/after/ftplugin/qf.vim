"=============================================================================
" QuickFixの設定
"=============================================================================

function! GetValidQfList()
  return filter(getqflist(), 'v:val["valid"]')
endfunction

" ステータスラインを設定
let &l:statusline .= '%=[%{len(GetValidQfList())} errors]'
