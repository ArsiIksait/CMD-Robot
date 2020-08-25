@echo off&title 批处理机器人&color 0A&set SendTexts=0&set rereadoff=0
timeout 10
:Loop
if exist "SendMsg.msg" (del SendMsg.msg)
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
if "%GroupText%"=="test" (echo.你在测试什么啊?>SendMsg.msg)
if "%GroupText%"=="WDNMD" (echo.小逼崽子,信不信我三天之内鲨了你马,给你马骨灰都给扬喽>SendMsg.msg)
)
if "%GroupText%"=="" (goto Loop)
if not exist "command.msg" (clip<SendMsg.msg)
if exist "command.msg" (start /MAX notepad command.msg&cimt /mm 5 50&cimt /mc 0&cimt /mc 0&call Copy.vbs&cimt /mm 1340 10&cimt /mc 0&del command.msg)
if exist "StopReread.ca" (
if "%rereadoff%"=="0" (set rereadoff=1&call Send.vbs)
goto Loop
)
if not exist "StopReread.ca" (set rereadoff=0)
call Send.vbs
MsHta JavaScript:document.write();setTimeout('close()',300);
echo %GroupText%>>GroupTextList.msg
echo %GroupText%
goto Loop
:pause
set SendTexts=0
timeout 10
goto Loop