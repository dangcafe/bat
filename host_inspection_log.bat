@echo off
setlocal EnableDelayedExpansion

:: 定义输出文件的路径
set outputLogFile=host_inspection_log.txt

:: 获取当前日期和时间
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
    set year=%%c
    set month=%%a
    set day=%%b
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set hour=%%a
    set minute=%%b
)

:: 创建一个标题以标识巡检
echo Windows Host Inspection - %year%-%month%-%day% %hour%:%minute% > %outputLogFile%
echo. >> %outputLogFile%

:: 检查系统信息
echo Checking System Information... >> %outputLogFile%
systeminfo >> %outputLogFile%
echo. >> %outputLogFile%

:: 检查磁盘空间
echo Checking Disk Space... >> %outputLogFile%
wmic logicaldisk get caption,description,size,freespace >> %outputLogFile%
echo. >> %outputLogFile%

:: 检查已安装的程序
echo Checking Installed Programs... >> %outputLogFile%
wmic product get name,version >> %outputLogFile%
echo. >> %outputLogFile%

:: 检查正在运行的进程
echo Checking Running Processes... >> %outputLogFile%
tasklist >> %outputLogFile%
echo. >> %outputLogFile%

:: 检查网络连接
echo Checking Network Connections... >> %outputLogFile%
netstat -ano >> %outputLogFile%
echo. >> %outputLogFile%

:: 检查防火墙规则
echo Checking Firewall Rules... >> %outputLogFile%
netsh advfirewall firewall show rule name=all >> %outputLogFile%
echo. >> %outputLogFile%

:: 添加其他检查任务，如需要

:: 巡检完成
echo Host Inspection completed. Results saved to %outputLogFile%
pause
