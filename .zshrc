#!/opt/local/bin/zsh
# vim: ft=zsh

#------------------------------------------------
# エイリアス
#------------------------------------------------
# 補完される前にオリジナルのコマンドまで展開してチェックする
setopt complete_aliases

alias ls='ls -F'
alias ll='ls -lh'
alias la='ls -a'
alias df='df -h'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias .='source'
alias nosetests='nosetests -v --with-doctest --doctest-tests'
alias tmux='tmuxx'
alias pudb='python -m pudb.run'

#------------------------------------------------
# パス設定
#------------------------------------------------
PATH=~/bin:$PATH

#------------------------------------------------
# 基本設定
#------------------------------------------------
# 文字コード
export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
#export JLESSCHARSET=japanese-sjis
export OUTPUT_CHARSET=utf-8
# ビープ音を鳴らさない
setopt nolistbeep
# Emacsモード
bindkey -e
# C-s, C-qを無効にする
setopt no_flow_control
# 単語の境界を設定、スラッシュで止まるようにする
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#------------------------------------------------
# 補完の設定
#------------------------------------------------
# ローカルの補完ディレクトリを追加
fpath=(~/.zsh/functions ${fpath})
# キャッシュの設定
if [ -d ~/.zsh/cache ]; then
    zstyle ':completion:*' use-cache yes
    zstyle ':completion:*' cache-path ~/.zsh/cache
fi
# zshの補完機能を有効にする
autoload -Uz compinit; compinit
# URLを自動エスケープ
autoload -Uz url-quote-magic; zle -N self-insert url-quote-magic
# TABで順に補完候補を切り替える
setopt auto_menu
# 補完候補を一覧表示
setopt auto_list
# 間違いを指摘する
setopt correct
# ディレクトリの補完で、末尾のスラッシュを自動的に追加する
setopt auto_param_slash
# 末尾のスラッシュを取り除かない
setopt noautoremoveslash
# 候補を詰めて表示
setopt list_packed
# 候補でファイルの種別をマーク表示
setopt list_types

#------------------------------------------------
# 履歴の設定
#------------------------------------------------
# 履歴の保存場所
HISTFILE=~/.zsh_history
# 履歴のサイズ
HISTSIZE=10000
# 保存する履歴の数
SAVEHIST=10000
# 履歴の重複を無視する
setopt hist_ignore_dups
# 履歴をコンソール間で共有する
setopt share_history
# 履歴の検索
autoload history-search-end
# 前方検索と後方検索を定義
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# C-PとC-Nを検索用に設定
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# コマンドの空白をけずる
setopt hist_reduce_blanks
# historyコマンドはログに記述しない
setopt hist_no_store
# 先頭が空白だった場合はログに残さない
setopt hist_ignore_space
# 履歴ファイルに時刻を記録
setopt extended_history
# 履歴をインクリメンタルに追加
setopt inc_append_history
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

#------------------------------------------------
# 移動関係
#------------------------------------------------
# cdなしでディレクトリに移動する
setopt auto_cd
# 自動的にpushdする
setopt auto_pushd
# 直前と同じ場合は無視
setopt pushd_ignore_dups

#------------------------------------------------
# 表示の設定
#------------------------------------------------
# 日本語を表示する際に化けないようにする
setopt print_eight_bit
# 色を使う
autoload -U colors; colors
# BSDコマンドにおいて色づけを有効にする
export CLICOLOR=1
# BSDコマンドの色
export LSCOLORS=DxGxcxdxCxegedabagacad
export LS_COLORS='di=01;33:ln=01;36:so=32:pi=33:ex=01;32:bd=34;46:cd=34;43:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#------------------------------------------------
# プロンプトの設定
#------------------------------------------------
# Pure
source ~/.zsh/prompt.zsh

# 右側まで入力がきたら、右プロンプトを消す
setopt transient_rprompt
#function abbrev_path() {
#    local _current current directories over heads tail display LIMIT
#    LIMIT=5
#    _current='%~'
#    current=${(%)_current}
#    directories=( ${(s:/:)current} )
#    over=$(( $#directories - $LIMIT ))
#    if [[ $over -lt 0 ]]; then
#        over=0
#    fi
#
#    heads=( $directories[1,over] )
#    tail=( $directories[over+1,$#directories] )
#    # LIMITを超えたディレクトリは頭1文字だけ表示
#    display=( ${(M)heads#?} $tail )
#    display=${(j:/:)display}
#    if [[ $current[1] = '/' ]]; then
#        display="/$display"
#    fi
#    echo $display
#}

#function precmd() {
#    # タイトルの設定
#    case "${TERM}" in
#    kterm*|xterm*)
#        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
#    ;;
#    esac
#
#    PROMPT="%{${fg[yellow]}%}%~ %{${reset_color}%}"
#    #PROMPT="%m:%n$ "
#
#    # gitリポジトリでは、ブランチの状態を表示する
#    st=`git status 2>/dev/null`
#    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#        color=${fg[cyan]}
#    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
#        color=${fg[blue]}
#    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
#        color=${fg_bold[red]}
#    else
#        color=${fg[red]}
#    fi
#    PROMPT=${PROMPT}"%{$color%}$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /')%b%{${reset_color}%}"
#
#    # カレントディレクトリを長さに応じて省略
#    #display=$(abbrev_path)
#    #RPROMPT="%{${fg[green]}%}[$display]%{${reset_color}%}"
#
#    # virtualenvでは、環境名を表示する
#    if [[ $#VIRTUAL_ENV -ge 1 ]]; then
#        local name
#        name=`basename "$VIRTUAL_ENV"`
#        RPROMPT="%{${fg_bold[white]}%}(env: %{${fg[green]}%}$name%{${fg_bold[white]}%})%{${reset_color}%} $RPROMPT"
#    fi
#}

#------------------------------------------------
# その他
#------------------------------------------------
source ~/.tmux/cdd

chpwd() {
    _cdd_chpwd
}

export EDITOR=`which vim`
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

#------------------------------------------------
# 環境依存の設定
#------------------------------------------------
# 特定環境用のzshrc
[[ -f $HOME/.zshrc.mine ]] && source $HOME/.zshrc.mine

#------------------------------------------------
# 後処理
#------------------------------------------------
# 重複PATHを除く
typeset -U path
export PATH
