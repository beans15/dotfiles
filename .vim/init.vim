call beans15#init#source_rc('/vimrc')

if exists("neovim_dot_app")
  call beans15#init#source_rc('/gui.rc.vim')
endif
