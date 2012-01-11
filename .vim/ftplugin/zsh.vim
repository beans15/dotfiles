augroup zsh
  au!
  au BufWritePost * silent! execute ':!zcompile % 2> /dev/null'
augroup end
