"------------------------------
" マッピングの設定
"

" 自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" 挿入モードでの<F1>を<ESC>にマッピングする
" 要するに無効化する
inoremap <F1> <ESC>

" ノーマルモードおよびビジュアルモードでは; と :を入れ替える(US配列用)
noremap ; :
noremap : ;

" 表示している行の移動にする
noremap j gj
noremap gj j
noremap k gk
noremap gk k
noremap ^ g^
noremap g^ ^
noremap $ g$
noremap g$ $

" コマンドラインモードで<C-P><C-N>で、先頭部分とマッチするものだけを辿るようにする
cmap <C-P> <Up>
cmap <C-N> <Down>
