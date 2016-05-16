" -*- coding: utf-8 -*-
" surround.vimのキーバインドを変更する

if !exists('g:loaded_surround') || !g:loaded_surround
  " surroundが読み込まれていなければ実行しない
  finish
endif

if exists('g:loaded_surround_hack') && g:loaded_surround_hack
  finish
endif
let g:loaded_surround_hack = 1

" visualモードでのsとSのマッピングを消す
vunmap S
" sの代わりにgsを使うようにする
vmap gs <Plug>Vsurround
vmap gS <Plug>VSurround
