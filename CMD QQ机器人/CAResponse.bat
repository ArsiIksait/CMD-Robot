@echo off
if not "%1"=="" (
if "%1"=="ping" (ping %2>command.msg)
if "%1"=="text2base64" (del command.msg&echo.%2>ready.txt&certutil -encode ready.txt command.msg&del ready.txt
for /f "skip=1" %%i in (command.msg) do (
echo.%%i>command.msg&goto :eof
  )
 )
if "%1"=="echo" (echo.%2>command.msg)
if "%1"=="dir" (dir %2>command.msg)
if "%1"=="robot_help" (
echo.CMD机器人帮助>command.msg
echo.命令名 使用方法^(命令名之间必须要有空格^) 介绍>>command.msg
echo.ping IP或域名>>command.msg
echo.text2base64 字符串>>command.msg
echo.cd 路径 切换当前工作目录>>command.msg
echo.reread on/off 开启/关闭复读功能>>command.msg
echo.dir 路径或文件>>command.msg
echo.help 无需参数 显示批处理帮助>>command.msg
echo.robot_help 无需参数 显示CMD机器人帮助>>command.msg
)
if "%1"=="help" (help>command.msg)
if "%1"=="reread" (
if "%2"=="on" (del StopReread.ca&echo.开启复读成功!>command.msg)
if "%2"=="off" (cd.>StopReread.ca&echo.关闭复读成功!>command.msg)
 )
)
goto :eof