let s:path = g:cache_dir . 'dein'
let s:dein_dir = s:path . '/repos/github.com/Shougo/dein.vim'
let s:current_dir = expand('<sfile>:p:h') . '/'

augroup MyColorScheme
  autocmd!
augroup END

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif

  execute 'set runtimepath^=' . fnamemodify(s:dein_dir, ':p')
endif

if !dein#load_state(s:path)
  finish
endif

call dein#begin(s:path, [expand('<sfile>')] +
  \ split(glob(s:current_dir . '*.toml'), '\n'))

call dein#load_toml(s:current_dir . 'dein.toml', {'lazy': 0})
call dein#load_toml(s:current_dir . 'dein_lazy.toml', {'lazy': 1})

call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif
