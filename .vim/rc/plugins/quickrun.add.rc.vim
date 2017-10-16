nmap <silent> <Leader>r <Plug>(quickrun)

let g:quickrun_config = {
    \ 'tex': {
    \   'command': 'latexmk',
    \   'cmdopt': '-pv',
    \   'exec': ['%c %o %s'],
    \   'hook/close_quickfix/enable_success': 1,
    \   'hook/close_buffer/enable_failure': 1
    \ }
  \ }
