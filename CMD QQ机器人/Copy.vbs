Option Explicit
Dim objShell
Set objShell = CreateObject("Wscript.Shell")
With objShell
WScript.Sleep 100
.SendKeys "%E"
.SendKeys "A"
WScript.Sleep 100
.SendKeys "%E"
.SendKeys "C"
End With
Set objShell = Nothing