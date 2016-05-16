"set grepprg=grep\ -nH\ $*
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_BibtexFlavor = 'jbibtex'
let g:Tex_DefaultTargetFormat='pdf'
if has('unix')
  if match(system('uname -s'), 'Darwin') != -1
    " Macの場合
    let g:Tex_ViewRule_dvi = 'xdvi'
    let g:Tex_ViewRule_ps = '/usr/bin/open'
    let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
  else
    " その他UNIXの場合
  endif
else
    " Windowsの場合
    let g:Tex_ViewRule_dvi = 'dviout'
endif

" Warningの抑制
let g:Tex_IgnoredWarnings =
  \'Underfull'."\n".
  \'Overfull'."\n".
  \'specifier changed to'."\n".
  \'You have requested'."\n".
  \'Missing number, treated as zero.'."\n".
  \'There were undefined references'."\n".
  \'Citation %.%# undefined'."\n".
  \"Empty `thebibliography' environment"."\n".
  \"LaTeX Font Warning: Font shape `JT1/gt/m/it' undefined"."\n".
  \"LaTeX Font Warning: Font shape `JY1/gt/m/it' undefined"."\n".
  \"LaTeX Font Warning: Font shape `JT1/mc/m/it' undefined"."\n".
  \"LaTeX Font Warning: Font shape `JY1/mc/m/it' undefined"."\n".
  \"Some font shapes were not available, defaults substituted."."\n".
  \"Float too large for page"
let g:Tex_IgnoreLevel = 14

setl tabstop=2
setl shiftwidth=2
setl softtabstop=2
setl foldlevel=99
