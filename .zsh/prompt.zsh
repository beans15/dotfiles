# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License


# change this to your own username
DEFAULT_USERNAME='sindresorhus'

# threshold (sec) for showing cmd exec time
CMD_MAX_EXEC_TIME=5


# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' formats ' %b'
zstyle ':vcs_info:git*' actionformats ' %b|%a'

# enable prompt substitution
setopt PROMPT_SUBST

# only show username if not default
[ $USER != $DEFAULT_USERNAME ] && local username='%n@%m '

# fastest possible way to check if repo is dirty
git_dirty() {
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    # check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo '*'
}

# displays the exec time of the last command if set threshold was exceeded
cmd_exec_time() {
    local stop=`date +%s`
    local start=${cmd_timestamp:-$stop}
    let local elapsed=$stop-$start
    [ $elapsed -gt $CMD_MAX_EXEC_TIME ] && echo ${elapsed}s
}

preexec() {
    cmd_timestamp=`date +%s`
}

precmd() {
    # # only show virtualenv if activated
    # local virtualenv
    # [[ -n $VIRTUAL_ENV ]] && virtualenv=" ${VIRTUAL_ENV##*/}@pyvenv"
    # [[ -n $HSENV ]] && virtualenv=" ${HSENV_NAME}@hsenv"

    # show python version if using pyenv
    local pythonver=$( pyenv versions 2> /dev/null | grep '^\*' | sed -e 's/^.* \(.*\) (set by .*$/\1/g' )
    [[ $pythonver == "system" ]] && pythonver=""
    [[ -n $pythonver ]] && pythonver=" Python@$pythonver"

    vcs_info
    # add `%*` to display the time
    print -P '\n%F{blue}%~%F{green}$vcs_info_msg_0_`git_dirty`%F{yellow}%F{8}$pythonver $username%f %F{yellow}`cmd_exec_time`%f'
    # reset value since `preexec` isn't always triggered
    unset cmd_timestamp
}

# prompt turns red if the previous command didn't exit with 0
PROMPT='%(?.%F{magenta}.%F{red})❯%f '
# can be disabled:
# PROMPT='%F{magenta}❯%f '
