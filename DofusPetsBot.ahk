; UI

	#Include ImageSearchList.ahk ; Used to scan inventory
	#Include Gdip_All.ahk ; Used to take screenshots
	I_Icon = %A_ScriptDir%\icon.ico
	Menu, Tray, Add, Show Gui, restore
	Menu, Tray, Default, Show Gui
	Menu, Tray, Click, 1
	Menu, Tray, icon, icon.ico
	Gui, Destroy
	Gui, Color, 363636
	IniRead, Servopt, %A_ScriptDir%\settings.ini, Options, Server, 1
	IniRead, Characopt, %A_ScriptDir%\settings.ini, Options, Charac, 1
	IniRead, Usernameopt, %A_ScriptDir%\settings.ini, Options, Username, 1
	IniRead, Passwordopt, %A_ScriptDir%\settings.ini, Options, Password, 1
	Gui, Font, White S13 CDefault, Verdana
	Gui, Add, Button, Default gOKBtn x192 y200 w70 h30, OK
	Gui, Add, Button, gSaveBtn x192 y269 w70 h30 , Save
	Gui, Add, GroupBox, x22 y49 w430 h260 , Login
	Gui, Add, Edit, vUsername x52 y89 w370 h30 , %Usernameopt%
	Gui, Add, Edit, vPassword x52 y149 w370 h30 , %Passwordopt%
	Gui, Add, GroupBox, x22 y319 w430 h60 , Bot
	Gui, Add, Text, x135 y9 w300 h20 , DofusPetsBot by petitepipe
	Gui, Add, Text, vTextControl x100 y340 w300 h30, Next feeding in : Waiting...
	
	if (Servopt = 1)
	Gui, Add, Radio, vServerradio Checked x52 y199 w110 h20 , Server 1
	else Gui, Add, Radio, vServerradio x52 y199 w110 h20 , Server 1
	if (Servopt = 2)
	Gui, Add, Radio, Checked x52 y219 w110 h20 , Server 2
	else Gui, Add, Radio, x52 y219 w110 h20 , Server 2
	if (Servopt = 3)
	Gui, Add, Radio, Checked x52 y239 w110 h20 , Server 3
	else Gui, Add, Radio, x52 y239 w110 h20 , Server 3
	if (Servopt = 4)
	Gui, Add, Radio, Checked x52 y259 w110 h20 , Server 4
	else Gui, Add, Radio, x52 y259 w110 h20 , Server 4
	if (Servopt = 5)
	Gui, Add, Radio, Checked x52 y279 w110 h20 , Server 5
	else Gui, Add, Radio, x52 y279 w110 h20 , Server 5
	if (Characopt = 1)
	Gui, Add, Radio, vCharacradio Checked Group x312 y199 w110 h20 , Charac 1
	else Gui, Add, Radio, vCharacradio Group x312 y199 w110 h20 , Charac 1
	if (Characopt = 2)
	Gui, Add, Radio, Checked x312 y219 w110 h20 , Charac 2
	else Gui, Add, Radio,  x312 y219 w110 h20 , Charac 2
	if (Characopt = 3)
	Gui, Add, Radio, Checked x312 y239 w110 h20 , Charac 3
	else Gui, Add, Radio,  x312 y239 w110 h20 , Charac 3
	if (Characopt = 4)
	Gui, Add, Radio, Checked x312 y259 w110 h20 , Charac 4
	else Gui, Add, Radio, x312 y259 w110 h20 , Charac 4
	if (Characopt = 5)
	Gui, Add, Radio, Checked x312 y279 w110 h20 , Charac 5
	else Gui, Add, Radio,  x312 y279 w110 h20 , Charac 5
	Gui, Show, x700 y300 h385 w478, DofusPetsBot v1.5.5 ; Version value
	
; /UI

; Minimize/Restore

	restore:
	gui, show
	return

	GuiSize:
	if A_EventInfo = 1
	Gui, hide
	return

	GuiClose:
	ExitApp

; /Minimize/Restore

; Starting client

	OKBtn:
	Run, C:\Users\%A_Username%\AppData\Local\Ankama\zaap\retro\resources\app\retroclient\Dofus.exe
	WinActivate, Dofus Retro
	Sleep, 1500
	WinMaximize, Dofus Retro
	Sleep, 1500
	
; /Starting client

; Login
	Gui, Submit, nohide
	Send %Usernameopt%
	Sleep, 1500
	Click, 612, 495 ; Click on password textbox
	Sleep, 1500
	Send %Passwordopt%
	Sleep, 1500
	Click, 582, 608 ; Click on OK button
	Sleep, 6000
	if (Servopt = 1)
	{ Loop, 2
	Click, 499, 589 Left, 1 ; XY pos for server 1
	} 
	if (Servopt = 2)
	{ Loop, 2
	Click, 729, 626 Left, 1 ; XY pos for server 2
	}
	if (Servopt = 3)
	{ Loop, 2
	Click, 957, 625 Left, 1 ; XY pos for server 3
	}
	if (Servopt = 4)
	{ Loop, 2
	Click, 1188, 649 Left, 1 ; XY pos for server 4
	}
	if (Servopt = 5)
	{ Loop, 2
	Click, 1422, 637 Left, 1 ; XY pos for server 5
	}
	Sleep, 6000
	if (Characopt = 1)
	{ Loop, 2
	Click, 499, 589 Left, 1 ; XY pos for character 1
	}
	if (Characopt = 2)
	{ Loop, 2
	Click, 729, 626 Left, 1 ; XY pos for character 2
	}
	if (Characopt = 3)
	{ Loop, 2
	Click, 957, 625 Left, 1 ; XY pos for character 3
	}
	if (Characopt = 4)
	{ Loop, 2
	Click, 1188, 649 Left, 1 ; XY pos for character 4
	}
	if (Characopt = 5)
	{ Loop, 2
	Click, 1422, 637 Left, 1 ; XY pos for character 5 
	}
	Sleep, 2000
	Click, 1281, 853 Left, 1 ; Open inventory
	Sleep 2000
	
; /Login

; Feeding

	CoordMode, Mouse, screen
	CoordMode,Pixel,Screen
	SetWorkingDir,%A_ScriptDir%\data
	MsgBox, , ,Searching... ,1 
	glob_List := ImageSearchList("chacha.png",1334,300,1593,813) ; Piece of the pet's sprite to search | XY pos for scanning the inventory
	Loop, Parse, glob_List, `n
	{
	Click %A_LoopField% 2
	Sleep 150
	Click, 1251, 345 ; Click on current equipped pet
	Sleep 2500
	MouseMove, 1128, 638 ; Mouve mouse to the pet's stats
	Send {WheelDown}
	Sleep 1500
	
	Screenshot(A_ScriptDir "\capture" ".png", "923|681|15|15") ; XY pos to screenshot the characteristics
	; screen: X|Y|W|H
	Screenshot(outfile, screen)
	{
	pToken := Gdip_Startup()
	pBitmap := Gdip_BitmapFromScreen(screen)
	Gdip_SaveBitmapToFile(pBitmap, outfile, 100)
	Gdip_DisposeImage(pBitmap)
	Gdip_Shutdown(pToken)
	}

	Sleep 1500
	Click, 1479, 217 ; Open resources tab
	Sleep 500
	SendEvent, {Click, 1363, 334, Left Down}{Click, 1248, 344, Left Up} ; Move first frame of resources tab to the pet frame (feeding)
	Sleep 1500
	Click, 1248, 344 ; Click again on the pet frame to check its characteristics after feeding it
	Sleep 1500
	ImageSearch, FoundX, FoundY, 923, 681, 938, 696, %A_ScriptDir%\capture.png ; XY pos of the characteristics
	if ErrorLevel = 1
	{
	MsgBox, , ,Starting double feeding..., 1
	SendEvent, {Click, 1363, 334, Left Down}{Click, 1248, 344, Left Up} ; Move first frame of resources tab to the pet frame (double feeding)
	}
	Sleep 1500
	Click, 1399, 215 ; Open equipments tab
	Sleep 2000
	Click, 1251, 345 Left 2 ; Desequip pet
	}
	; After none of the images are found…
	MsgBox, , ,No pets found ! / Done feeding pets ! Closing Dofus...,1 
	SoundPlay %A_ScriptDir%\itsok.wav

; /Feeding

; Countdown

	WinClose, Dofus Retro ; First, we must close the client
	SetTimer,Countdown,1000 ; Run the Countdown label every 1 second
	Sleep 1500
	SetTimer, OKBtn,87100000 ; Timer value in milliseconds
	time:=87100 ; Timer value (Countdown text) in seconds
	Countdown:
	time-- ; Minus one second
	totalSeconds:=time ; Temporary variable
	hours:=totalSeconds//3600
	totalSeconds-=hours*3600
	minutes:=totalSeconds//60
	seconds:=totalSeconds-(minutes*60)
	GuiControl,,TextControl,Next feeding in : %hours% h:%minutes% m:%seconds% s ; Change "Waiting..." text for countdown
	return

; /Countdown

; Settings

	SaveBtn:
	Gui, Submit
	IniWrite, % Serverradio, %A_ScriptDir%\settings.ini, Options, Server
	IniWrite, % Characradio, %A_ScriptDir%\settings.ini, Options, Charac
	IniWrite, % Username, %A_ScriptDir%\settings.ini, Options, Username
	IniWrite, % Password, %A_ScriptDir%\settings.ini, Options, Password
	Reload
	
; /Settings
