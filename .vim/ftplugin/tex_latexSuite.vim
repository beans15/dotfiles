" LaTeX filetype
"	  Language: LaTeX (ft=tex)
"	Maintainer: Srinath Avadhanula
"		 Email: srinath@fastmail.fm

"" おまじない
set grepprg=grep\ -nH\ $*
"" .texファイルのコンパイルプログラムを指定(エラーで停止しないようオプション指定)
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
"" .bibファイルのコンパイルプログラムを指定
let g:Tex_BibtexFlavor = 'jbibtex'
"" .dviファイルのビュープログラムを指定
let g:Tex_ViewRule_dvi = 'xdvi'
"" pdfファイル生成のための依存関係を記述。
"" 以下の設定の場合、ターゲットにpdfを指定して\llでコンパイルすると、
"" まず.dviファイルが作られ、次にそれをもとに.pdfファイルが作られる
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"" .dviファイルのコンパイルプログラムを指定
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"" .psファイル生成のための依存関係を記述
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
"" .pdfファイルのビュープログラムを指定
let g:Tex_ViewRule_pdf = '/Applications/Preview.app/Contents/MacOS/Preview $*.pdf'
"" デフォルトのターゲットをpdfに設定
let Tex_DefaultTargetFormat='pdf'

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

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set fenc=cp932

if !exists('s:initLatexSuite')
	let s:initLatexSuite = 1
	exec 'so '.fnameescape(expand('<sfile>:p:h').'/latex-suite/main.vim')

	silent! do LatexSuite User LatexSuiteInitPost
endif

silent! do LatexSuite User LatexSuiteFileType
