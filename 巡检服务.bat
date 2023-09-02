@echo off

rem 指定要检测的服务名称
set service=服务名称

rem 获取当前日期和时间
set datetime=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%

rem 获取服务端口号
for /f "tokens=2 delims=:" %%a in ('netstat -ano ^| findstr /c:"服务名称" ^| findstr /c:"LISTENING"') do set port=%%a

rem 获取服务状态
sc query "%service%" | find "STATE" > nul
if %errorlevel% == 0 (
  set state=运行中
) else (
  set state=已停止
)

rem 输出结果到桌面
echo 服务名称：%service% > %userprofile%\Desktop\%datetime%.txt
echo 服务状态：%state% >> %userprofile%\Desktop\%datetime%.txt
echo 当前时间：%datetime% >> %userprofile%\Desktop\%datetime%.txt
echo 服务端口：%port% >> %userprofile%\Desktop\%datetime%.txt

pause
