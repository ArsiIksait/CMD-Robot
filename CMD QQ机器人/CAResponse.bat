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
echo.CMD�����˰���>command.msg
echo.������ ʹ�÷���^(������֮�����Ҫ�пո�^) ����>>command.msg
echo.ping IP������>>command.msg
echo.text2base64 �ַ���>>command.msg
echo.cd ·�� �л���ǰ����Ŀ¼>>command.msg
echo.reread on/off ����/�رո�������>>command.msg
echo.dir ·�����ļ�>>command.msg
echo.help ������� ��ʾ���������>>command.msg
echo.robot_help ������� ��ʾCMD�����˰���>>command.msg
)
if "%1"=="help" (help>command.msg)
if "%1"=="reread" (
if "%2"=="on" (del StopReread.ca&echo.���������ɹ�!>command.msg)
if "%2"=="off" (cd.>StopReread.ca&echo.�رո����ɹ�!>command.msg)
 )
)
goto :eof