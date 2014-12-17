if has('win32')
  if g:portable
    source $VIM/.gvimrc.win
  else
    source $HOME/.gvimrc.win
  endif
elseif has('mac')
  source $HOME/.gvimrc.mac
endif
