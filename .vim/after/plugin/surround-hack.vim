" -*- coding: utf-8 -*-
" surround.vimのキーバインドを変更する

if exists('g:loaded_surround_hack') && g:loaded_surround_hack
  finish
endif
let g:loaded_surround_hack = 1

" visualモードでのsとSのマッピングを消す
vunmap s
vunmap S
" sの代わりにgsを使うようにする
vmap gs <Plug>Vsurround

" netrwでdが使いにくくなるので、dのマッピングを消す
" ds~自体は、cs~<BS>で代用可能
nunmap ds
