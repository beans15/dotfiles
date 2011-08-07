augroup zsh
  au!
  au BufWritePost * silent! execute ':!zcompile %'
augroup end
