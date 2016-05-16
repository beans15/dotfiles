set guifont=Monaco\ for\ Powerline:h14
"set guifontwide=ヒラギノ角ゴ\ ProN\ W3:h14
set cmdheight=1

colorscheme hybrid

" 日本語関連の設定
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" lightlineのtablineを優先
set guioptions-=e

" 透明度を5%に
set transparency=5
" マウスを無効に
set mouse=
" ¥を\に変更
map ¥ \
noremap! ¥ \

set imdisable

set ambiwidth=
