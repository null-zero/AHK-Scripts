#SingleInstance, Force
#NoEnv
#Include %A_ScriptDir%\include\Gdip2.ahk 

;set Images
invSpaceImage := A_WorkingDir . "\images\rs\invspace25.png"

;start timer
SetTimer, TradeSearch, 250

;create gdpi 
gdip1 := new Gdip()
win1 := new Gdip.Window(new Gdip.Size(1920, 1080))
brush1 := new Gdip.Brush(100, 78, 244, 66)
brush2 := new Gdip.Brush(100, 244, 65, 65)

;create resizeable gui to set overlay size
Gui, ResizeMe:Add, Text,, Drag and resize Me
Gui, ResizeMe:Add, Text,, Close to confirm
Gui, ResizeMe:+ToolWindow +AlwaysOnTop +Resize
Gui, ResizeMe:show, x1317 y527 W200 NoActivate ,Resize Me
WinSet, Transparent, 100, Resize Me
return

;get gui size and pos before destroying on close
ResizeMeGuiClose:
    WinGetPos, userXPos, userYPos, userWidth, userHeight, Resize Me
    Gui, ResizeMe:Destroy
return 

TradeSearch:
    win1.Clear()
    IfWinActive, ahk_exe RuneLite.exe 
    {
        ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %invSpaceImage%
        if(ErrorLevel == 0){
            win1.FillRectangle(brush1, new Gdip.Point(userXPos, userYPos), new Gdip.Size(userWidth, userHeight))
        }else{
            win1.FillRectangle(brush2, new Gdip.Point(userXPos, userYPos), new Gdip.Size(userWidth, userHeight))
        }
    }
    win1.Update()
    if WinExist("ahk_class #32770")
        WinSet, ExStyle, +0x20
return


End::
    Gui, ResizeMe:Destroy
    ExitApp

