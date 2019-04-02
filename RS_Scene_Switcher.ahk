; RS Scene Switcher AHK

; Set Scene Switcher Binds -> CTRL + SHIFT + "?" <-
mainscene := 1
coverscene := 2

; Set Images
script_active_image := A_WorkingDir . "\images\global\active.ico"
script_inactive_image := A_WorkingDir . "\images\global\notactive.ico"
login_screen_image := A_WorkingDir . "\images\rs\vj3BLPQ.png"
bank_pin_image := A_WorkingDir . "\images\rs\bank.png"

; Init
ArrayCount := 0
toggle  := 0
ImageArray := [login_screen_image, bank_pin_image]
return



^+0:: ; CTRL+SHIFT+0 to start & toggle timer
    toggle := !toggle
    if (toggle = 1){
        SetTimer, LoginTimer, 500
		Menu, Tray, Icon, %script_active_image% 
    } else {
        SetTimer, LoginTimer, Off
		Menu, Tray, Icon, %script_inactive_image%
    }
return



LoginTimer:
	Loop, % ImageArray.MaxIndex()
	{
		ArrayCount += 1
		image_index := ImageArray[A_Index]
		
		ImageSearch, FoundX, FoundY,  0, 0, 1920, 1080, *30 %image_index%
		If(ErrorLevel == 0){
			Send {CtrlDown}{ShiftDown}{%coverscene% down}{CtrlUp}{ShiftUp}{%coverscene% Up}
			Sleep, 300
			Loop, 500 {
				ImageSearch, FoundX, FoundY,  0, 0, 1920, 1080, *30 %image_index%
				If(ErrorLevel == 0){
					Sleep, 300
				}else{
					Send {CtrlDown}{ShiftDown}{%mainscene% down}{CtrlUp}{ShiftUp}{%mainscene% up}
					break
				}
			}
		}else{

		}
	}
return


