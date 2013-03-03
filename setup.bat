REM vimの設定ファイルだけコピー
COPY .vimrc %USERPROFILE%\_vimrc
COPY .vimrc.plugin %USERPROFILE%\.vimrc.plugin
XCOPY .vim %USERPROFILE%\vimfiles
