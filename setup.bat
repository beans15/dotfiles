REM vimの設定ファイルだけコピー
XCOPY /H .vimrc %USERPROFILE%\_vimrc
XCOPY /H .vimrc.plugin %USERPROFILE%\.vimrc.plugin
XCOPY /H /E .vim %USERPROFILE%\vimfiles
