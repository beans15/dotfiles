"------------------------------
" GUI
"

if IsWindows()
  call beans15#init#source_rc('/gui.win.rc.vim')
else
  call beans15#init#source_rc('/gui.unix.rc.vim')
endif
