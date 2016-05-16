"------------------------------------------------
" Windows用の設定
"

set shellslash

" Windowsでvimフォルダにvimrc等を置く場合
if ! filereadable(expand('~/_vimrc'))
  let g:portable = 1

  set viminfo+=n$VIM/_viminfo
endif

" Windowsでruntimepathに.vimを追加
set rtp+=~/.vim/
