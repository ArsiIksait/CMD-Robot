Option Explicit
Dim objShell
Set objShell = CreateObject("Wscript.Shell")
With objShell
WScript.Sleep 300
.SendKeys "^V"
WScript.Sleep 300
.SendKeys "%S"
End With
Set objShell = Nothing