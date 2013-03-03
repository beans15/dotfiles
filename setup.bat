REM vimの設定ファイルだけコピー
XCOPY /H .vimrc %USERPROFILE%\_vimrc
XCOPY /H .vimrc.plugin %USERPROFILE%\.vimrc.plugin
XCOPY /H /E .vim %USERPROFILE%\.vim

IF NOT EXIST %USERPROFILE%\.vim\bundle\neobundle.vim (
    git clone git://github.com/Shougo/neobundle.vim.git
)
