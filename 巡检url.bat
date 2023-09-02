@echo off
setlocal

REM 定义要巡检的网站列表
set sites=www.google.com https://www.bing.com http://www.yahoo.com

REM 循环遍历列表中的每个网站
for %%i in (%sites%) do (
    echo Checking %%i...

    REM 使用certutil命令访问网站并将结果输出到find命令中进行判断
    certutil -urlcache -split -verify "%%i" >nul
    if %errorlevel%==0 (
        echo Service is up: true
    ) else (
        echo Service is down: false
    )

    echo.
)

pause
