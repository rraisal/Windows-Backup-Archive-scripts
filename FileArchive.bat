@echo off

set sourcelocation=E:\XXXXX
set destlocation=E:\Archives\XXXX
pushd %destlocation%

set hh=%time:~-11,2%
set /a hh=%hh%+100
set hh=%hh:~1%
set curr_date=%date:~10,4%%date:~4,2%%date:~7,2%_%hh%%time:~3,2%%time:~6,2%

md %curr_date%

forfiles /p "%sourcelocation%" /s /m *.* /D -2 /C "cmd /c move @path %destlocation%\%curr_date%"

pushd %destlocation%

7z a -tzip %curr_date%.zip -r %curr_date%\*.*

@RD /S /Q "%destlocation%\%curr_date%"

forfiles /p "%destlocation%" /s /m *.* /D -10 /C "cmd /c del @path"



