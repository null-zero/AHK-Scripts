#SingleInstance, Force
#Include %A_ScriptDir%\include\Gdip2.ahk


invSpaceImage := A_WorkingDir . "\images\rs\invspace25.png"

SetTimer, TradeSearch, 250
gdip1 := new Gdip()
win1 := new Gdip.Window(new Gdip.Size(1920, 1080))
brush1 := new Gdip.Brush(100, 78, 244, 66)
brush2 := new Gdip.Brush(100, 244, 65, 65)
Return


TradeSearch:
    win1.Clear()
    IfWinActive, ahk_exe RuneLite.exe
    {
        ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, %invSpaceImage%
        if(ErrorLevel == 0){
            win1.FillRectangle(brush1, new Gdip.Point(1340, 373), new Gdip.Size(300, 200))
        }else{
            win1.FillRectangle(brush2, new Gdip.Point(1340, 373), new Gdip.Size(300, 200))
        }
    }
    win1.Update()
return

End::
    ExitApp
