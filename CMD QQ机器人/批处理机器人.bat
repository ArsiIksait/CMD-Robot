@echo off&title �����������&color 0A&set SendTexts=0
timeout 10
:Loop
set /a SendTexts+=1
echo %SendTexts%
if "%SendTexts%"=="10" (goto pause)
cd.>clear.txt
clip<clear.txt
del clear.txt
cimt /mm 250 470
cimt /mc 1
cimt /mm 320 32
MsHta JavaScript:document.write();setTimeout('close()',300);
cimt /mc 0
cimt /mm 250 470
mshta "javascript:var s=clipboardData.getData('text');if(s)new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(s);close();"|more >GroupText.msg
set /p GroupText=<GroupText.msg
if not "%GroupText%"=="" (
if "%LastMsg%"=="%GroupText%" (goto Loop)
set LastMsg=%GroupText%
call CAResponse %GroupText%
if "%GroupText%"=="test" (echo.���ڲ���ʲô��?>SendMsg.msg)
if "%GroupText%"=="WDNMD" (echo.С������,�Ų���������֮����������,������ǻҶ������>SendMsg.msg)
)
if "%GroupText%"=="" (goto Loop)
if not exist "command.msg" (clip<SendMsg.msg)
if exist "command.msg" (start /MAX notepad command.msg&cimt /mm 5 50&cimt /mc 0&cimt /mc 0&call Copy.vbs&cimt /mm 1340 10&cimt /mc 0&del command.msg)
if exist "StopReread.ca" (goto Loop)
call Send.vbs
MsHta JavaScript:document.write();setTimeout('close()',2000);
cd.>SendMsg.msg
echo %GroupText%>>GroupTextList.msg
echo %GroupText%
goto Loop
:pause
set SendTexts=0
timeout 10
goto Loop