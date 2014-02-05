"------------------------------------------------
" Windows用の設定
"------------------------------------------------
" Windowsでvimフォルダにvimrc等を置く場合
let g:portable = 0
if has('win32')
  if ! filereadable(expand('~/_vimrc'))
    let g:portable = 1
  endif
endif
" Windowsでruntimepathに.vimを追加
if has('win32')
  set rtp+=~/.vim/
endif

"------------------------------------------------
" 基本設定
"------------------------------------------------
" Vimの拡張機能を有効にする
set nocompatible
" バックアップを取らない
set nobackup
" 上書き前にバックアップを取る
set writebackup

if v:version > 730
  " XXX 軽量化のため、NFAエンジンを無効に
  set regexpengine=1
endif

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
" ファイルを開いたときに、自動的にcdしない
set noautochdir
" 外部変更をキャッチする
set autoread

"------------------------------------------------
" 検索関連の設定
"------------------------------------------------
" インクリメンタルサーチを行う
set incsearch
" 折り返して検索する
set wrapscan
" 自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"------------------------------------------------
" インデント関連の設定
"------------------------------------------------
" タブの空白数を4つに
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

"------------------------------------------------
" プラグインの設定
"------------------------------------------------
if g:portable
  source $VIM/.vimrc.plugin
else
  source ~/.vimrc.plugin
endif

"------------------------------
" color
"------------------------------
colorscheme hybrid
"hi Normal ctermfg=lightgrey ctermbg=black

function! ChangeSolarized()
  colorscheme solarized
  set background=light
endfunction

command! Solarized call ChangeSolarized()

"------------------------------------------------
" 環境依存の設定
"------------------------------------------------
if g:portable
  set viminfo=n$VIM/_viminfo
endif

" 環境ごとの設定は.vimrc.mineに記述する
if filereadable(expand('$HOME/.vimrc.mine'))
    source $HOME/.vimrc.mine
endif
