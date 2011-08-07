"------------------------------------------------
" 基本設定
"------------------------------------------------
" Vimの拡張機能を有効にする
set nocompatible
" バックアップを取らない
set nobackup
" 上書き前にバックアップを取る
set writebackup

"------------------------------------------------
" 編集関連の設定
"------------------------------------------------
" バックスペース、スペース、h、lで折り返せるようにする
set whichwrap=b,s,h,l
" 自動折り返しを無効にする（gqと打って折り返す）
set formatoptions=q
" 80文字で折り返す
set textwidth=80
" バックスペースでどこでも消せるようにする
set backspace=2
" ファイルを開いたときに、自動的にcdする
set autochdir
" 外部変更をキャッチする
set autoread

"------------------------------------------------
" 検索関連の設定
"------------------------------------------------
" インクリメンタルサーチを行う
set incsearch
" 折り返して検索する
set wrapscan

"------------------------------------------------
" インデント関連の設定
"------------------------------------------------
" タブの空白数を8つに
set tabstop=4
" 自動インデントの空白数を4つに
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

"------------------------------------------------
" 表示に関する設定
"------------------------------------------------
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
set statusline=%F\ %m%r%h%w[%{&fenc}][%{&ff}]%y%=%l,%-12v%P\ [%L\ lines]
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
set ambiwidth=double
" マーカーに基づいて折りたたむ
set foldmethod=marker

"------------------------------------------------
" シンタックス
"------------------------------------------------
" シンタックスハイライトを有効にする
syntax on
" Foldされているテキストの色をグレーにする
hi Folded cterm=bold ctermfg=black ctermbg=lightgray

"------------------------------------------------
" 文字コードの設定
"------------------------------------------------
" 文字コードの自動認識
set fileencodings=ucs-bom,utf-8,cp932,iso-2022-jp,euc-jp,sjis,default,latin1
" 改行コードの自動認識
set fileformats=unix,dos,mac

"------------------------------------------------
" マッピング
"------------------------------------------------
" 挿入モードでの<F1>を<ESC>にマッピングする
" 要するに無効化する
inoremap <F1> <ESC>

"------------------------------------------------
" オートコマンド
"------------------------------------------------
"" 外部変更のチェック
"augroup vimrc-checktime
"  autocmd!
"  autocmd CursorMoved * checktime
"augroup END

"------------------------------------------------
" プラグインの設定
"------------------------------------------------
"------------------------------
" 基本設定
"------------------------------
" Vundleでの管理を行う
" 一時的にファイルタイプを無効に
filetype off

" Vundleへのパスを追加
set rtp+=~/.vim/vundle.git/
" Vundleを初期化
call vundle#rc()

" 拡張機能をロード
"------------------------------
" neocomplcache
"------------------------------
Bundle 'neocomplcache'

" 起動時に有効にする
let g:neocomplcache_enable_at_startup = 1
" 大文字小文字が混じっている場合は、大文字小文字を区別する
let g:neocomplcache_enable_smart_case = 1
" キーワードの最小長さを3文字に
let g:neocomplcache_min_syntax_length = 3
" 補完候補の先頭を選択状態に
"let g:neocomplcache_enable_auto_select = 1
" スニペットのディレクトリを指定
let g:neocomplcache_snippets_dir = expand('~/.vim/bundle/vim-mine/snippets')
" スニペット補完のキーバインド
imap <silent><C-l> <Plug>(neocomplcache_snippets_expand)
smap <silent><C-l> <Plug>(neocomplcache_snippets_expand)
" 辞書の設定を初期化
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default': ''
    \ }

"------------------------------
" quickrun
"------------------------------
Bundle 'quickrun'

"------------------------------
" ref.vim
"------------------------------
Bundle 'ref.vim'

"------------------------------
" surround
"------------------------------
Bundle 'surround.vim'

"------------------------------
" ZenCoding
"------------------------------
Bundle 'ZenCoding.vim'

" 展開キー
" let g:user_zen_expandabbr_key = '<C-e>'

" 自分用の設定
Bundle 'beans15/vim-latex'

" ファイルタイプを有効にする
filetype plugin indent on

"------------------------------
" netrwの設定
"------------------------------
" 非表示にするファイルパターンを設定
let g:netrw_list_hide = '.*\.pyc,.*\.pyo'

"------------------------------------------------
" ユーザー定義関数
"------------------------------------------------
"function! GetGitBranch()
"  " 現在のGitのブランチを取得する
"  let ret = system('git branch 2> /dev/null')
"  let branch = substitute(ret, '\v^.*\* (.{-1,})\r*\n*$', '[\1]', '')
"  return branch
"endfunction

"------------------------------------------------
" 環境依存の設定
"------------------------------------------------
" 環境ごとの設定は.vimrc.mineに記述する
if filereadable(expand('~/.vimrc.mine'))
    source ~/.vimrc.mine
endif
