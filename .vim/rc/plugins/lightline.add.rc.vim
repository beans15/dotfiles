" リロードしたときにエラーが出るのを防ぐ
if !exists('g:lightline')
  let g:lightline = {
    \ 'colorscheme':  'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
    \ },
    \ 'component': {
    \   'readonly': '%{&readonly?"RO":""}',
    \   'modified': '%{&modified?"+":&modifiable?"":"-"""}',
    \ },
    \ 'component_function': {
    \   'mode': 'MyMode',
    \   'fugitive': 'MyFugitive',
    \   'fileformat': 'MyFileFormat',
    \   'filetype': 'MyFiletype',
    \   'fileencoding': 'MyFileencoding',
    \   'filename': 'MyFilename',
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '&readonly',
    \   'modified': '(&modified||!&modifiable)',
    \ },
    \ }
endif

function! MyMode()
  return  &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyFilename()
  let filetype_mapping = {
    \ 'vimfiler': 'vimfiler#get_status_string()',
    \ 'unite': 'unite#get_status_string()',
    \ 'vimshell': "substitute(b:vimshell.current_dir, expand('~'), '~', '')",
    \ }

  if has_key(filetype_mapping, &ft)
    return eval(filetype_mapping[&ft])
  else
    return expand('%:t') != '' ? expand('%:t') : '[No Name]'
  endif
endfunction

function! MyFugitive()
  return exists('*fugitive#head') && len(fugitive#head()) ? ''.fugitive#head() : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyFileFormat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

if exists('g:local_has_powerline_font') && g:local_has_powerline_font
  call beans15#init#source_rc('/plugins/lightline.add.extra.rc.vim')
endif
