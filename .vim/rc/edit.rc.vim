"------------------------------
" 編集関連の設定
"

" バックスペース、スペース、h、lで折り返せるようにする
set whichwrap=b,s,h,l
" 自動折り返しを無効にする（gqと打って折り返す）
set formatoptions=q
" 80文字で折り返す
set textwidth=80
" バックスペースでどこでも消せるようにする
set backspace=2
" ファイルを開いたときに、自動的にcdしない
set noautochdir
" 外部変更をキャッチする
set autoread

" タブの空白数を8つに
set tabstop=8
" インデントの空白数を4つに
set shiftwidth=4
" バックスペースで4つの空白を消す
set softtabstop=4
" タブではなく空白を挿入する
set expandtab
" >と<で、インデントを&shiftwidthの倍数に丸める
set shiftround
" 行頭でタブを打ったときに、shiftwidthの数だけインデント
set smarttab
" 自動インデント
set autoindent
