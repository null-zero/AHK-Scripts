#SingleInstance force
#Persistent
#include <AutoHotInterception>

;AHI Start
global AHI := new AutoHotInterception()
global keyboardId := AHI.GetKeyboardId(0x04D9, 0x0159) ;This is my VID/PID, USE YOUR OWN, if you don't know what it is, go back through AHI's setup

;Get KeyStates of all KeyEvents, if key = x send NumpadKey 
KeyEvent(btn, state){
	static btnStates := {}
	btnStates[btn] := state
	if btn = 1
		AHI.SendKeyEvent(keyboardId, GetKeySC("NumpadClear"), state)
	if btn = 2
		AHI.SendKeyEvent(keyboardId, GetKeySC("NumpadDown"), state)
	if btn = 3
		AHI.SendKeyEvent(keyboardId, GetKeySC("NumpadClear"), state)
	if btn = 4
		AHI.SendKeyEvent(keyboardId, GetKeySC("NumpadClear"), state)
	if btn = 5
		AHI.SendKeyEvent(keyboardId, GetKeySC("NumpadUp"), state)
	if btn = 6
		AHI.SendKeyEvent(keyboardId, GetKeySC("NumpadClear"), state)
}

;Subscribe and unsubscribe keystates when runelite is active or not
;CHANGE BINDS HERE
DoSub(state){
	if (state){
		AHI.SubscribeKey(keyboardId, GetKeySC("a"), true, Func("KeyEvent").Bind(1))
		AHI.SubscribeKey(keyboardId, GetKeySC("s"), true, Func("KeyEvent").Bind(2))
		AHI.SubscribeKey(keyboardId, GetKeySC("d"), true, Func("KeyEvent").Bind(3))
		AHI.SubscribeKey(keyboardId, GetKeySC("left"), true, Func("KeyEvent").Bind(4))
		AHI.SubscribeKey(keyboardId, GetKeySC("down"), true, Func("KeyEvent").Bind(5))
		AHI.SubscribeKey(keyboardId, GetKeySC("right"), true, Func("KeyEvent").Bind(6))
	} else {
		AHI.UnsubscribeKey(keyboardId, GetKeySC("a"))
		AHI.UnsubscribeKey(keyboardId, GetKeySC("s"))
		AHI.UnsubscribeKey(keyboardId, GetKeySC("d"))
		AHI.UnsubscribeKey(keyboardId, GetKeySC("left"))
		AHI.UnsubscribeKey(keyboardId, GetKeySC("down"))
		AHI.UnsubscribeKey(keyboardId, GetKeySC("right"))
	}
}
return

;Timer loop to check if RuneLite is active window
WatchWin:
	Loop {
		WinWaitActive, ahk_exe RuneLite.exe 
		DoSub(True)
		WinWaitNotActive, ahk_exe RuneLite.exe
		DoSub(False)
	}
	return

End::
	ExitApp
