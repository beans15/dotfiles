"------------------------------
" 表示関連の設定
"

" ターミナルのタイトルを書き換える
set title
" ターミナルのタイトルを設定
"set titlestring=
" 常にステータスラインを表示する
set ls=2
" 現在の行の情報を表示する
" &statuslineを変更しているので無視される
set ruler
" ステータスラインの表示項目を変更する
"set statusline=%F\ %m%r%h%w[%{&fenc}][%{&ff}]%y%=%l,%-12v%P\ [%L\ lines]
" 行番号を表示する
set nu
" 特殊文字を表示する
set list
" タブと後にテキストが続かない空白を表示する
set listchars=tab:>-,trail:-
" 対応する括弧を強調する
set showmatch
" 検索結果を強調する
set hlsearch
" コマンドライン補完を拡張モードで実行する
set wildmenu
" コマンドラインを1行にする
set cmdheight=1
" ユニコード文字の幅をASCII文字の2倍の幅にする
"set ambiwidth=double
" マーカーに基づいて折りたたむ
set foldmethod=marker
" 最初は折りたたまない
set foldlevelstart=1000

" Foldされているテキストの色をグレーにする
hi Folded cterm=bold ctermfg=black ctermbg=lightgray
