F2::GoSub,MousePosition

MousePosition:
Coordmode,Tooltip,Relative
Coordmode,Mouse,Screen
MouseGetPos,X,Y
Tooltip, Current Mouse Position: %X%`,%Y%
Clipboard= %X%`,%Y%
SetTimer,ClearToolTip, 10000
Return

ClearToolTip:
SetTimer,ClearToolTip,Off
ToolTip,
Return