#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

Gui, Login:Add, Text, x6 y10 w250 h20 , Bitte geben sie ihren Namen und Ihr Passwort ein
Gui, Login:Add, Edit, x6 y30 w250 h20 vLoginName, Name
Gui, Login:Add, Edit, x6 y50 w250 h20 vPassword, Password
Gui, Login:Add, Button, x6 y70 w90 h20 gLoginCheck, OK
Gui, Login:Add, Button, x166 y70 w90 h20 gLoginAbbruch, Abbrechen
Gui, Login:+LabelLogin -Caption
Gui, Login: +LastFound
Gui, Login:Show, w267 h103, Login
return

LoginAbbruch:
LoginClose:
LoginEscape:
ExitApp

LoginCheck:
Gui, Login:Submit, NoHide
CheckURL = http://mycoding.de/index.php?name=%LoginName%&pass=%Password%
Checksumme:=UrlDownloadToVar(CheckURL)
if (Checksumme ="1") {
	MsgBox, 64, Information, Ihre Accountdaten wurden gefunden und waren richtig
	;;;;;
	;;;;;
}
if (Checksumme = "2") {
	MsgBox, 16, ACHTUNG!!!!!, Ihr Passwort war falsch
	ExitApp
}
if (Checksumme = "3") {
	MsgBox, 16, ACHTUNG!!!!!, Ihr Account wurde nicht gefunden
	ExitApp
}
return
#Include UrlDownloadToVar.ahk ;Thanks on olfen for http://www.autohotkey.com/forum/topic10466.html