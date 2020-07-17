; This script was made a long time ago by Dreyri.
; I use it for Runecrafting to keep track of when my pouches
; are about to degrade.

; This paste has f1 set to increment the timer, you can change
; what key you want to use for it where I commented in all caps.
; Reset the timer to 1 when you repair your pouches, then
; repair them again when the timer hits 9 and your pouch
; will never degrade and you won't ever lose the 3 essence
; on 10th runs.

    ;ndot edits
; I've slowely modified on the original script to add an additional
; color change if laps are too long (I was forgetting to hit the hotkey.)
; That morphed into wanting an auto lap counter which is where the
; imagesearches come in. FillImage is a completed stack of runes, in my
; case, lava runes. MageImage is to auto reset the counter when contacting
; the mage. If these images do not work for you, take new screenshots of
; both the completed rune stack and of the text on the third chat screen
; with the mage.

#SingleInstance force

FillImage := A_WorkingDir . "\images\rs\lavarunes.png"
MageImage := A_WorkingDir . "\images\rs\magetext.png"

    Gosub,currentTime
    Gosub,updateGui
    SetTimer,currentTime,500
    SetTimer,LavaTimer,250
    SetTimer,MageTimer,250

    FillCount := 1
    ResetTime := A_TickCount
    CurrentTime := A_TickCount
    Difference := CurrentTime - ResetTime


    Gui,-border -caption +alwaysontop +disabled +owner -sysmenu
    Gui,color,green
    Gui,add,Text, vCount w30 h11 +center,%FillCount%
    Gui,add,Text, vTime w30 h11 +center,%Difference%
    Gui,show



    Loop
    {
        ifWinExist, ahk_class SunAwtFrame
        {
            ifWinActive, ahk_class SunAwtFrame
            {
                Gui,+alwaysontop
            }else{
                Gui,-alwaysontop
            }
            WinGetPos,orx,ory,width,height, ahk_class SunAwtFrame
            winX := orx + 719
            winY := ory + 642
            Gui,show,NA x%winX% y%winy%
            Sleep,500
        }else{
            Gui,Submit
            Sleep,2000
        }
    }
    return


    LavaTimer:
        ImageSearch, FoundX, FoundY,  %A_ScreenWidth%/2, %A_ScreenHeight%/2, A_ScreenWidth, A_ScreenHeight, *30 %FillImage%
		If(ErrorLevel == 0){

            FillCount += 1
            ResetTime = %A_TickCount%
            GuiControl,text,Count,%FillCount%
            gosub,updateGui
            Sleep, 24000
        }
    return

    MageTimer:
        ImageSearch, FoundX, FoundY,  %A_ScreenWidth%/2, %A_ScreenHeight%/2, A_ScreenWidth, A_ScreenHeight, *30 %MageImage%
		If(ErrorLevel == 0){
            FillCount = 1
            ResetTime = %A_TickCount%
            GuiControl,text,Count,%FillCount%
            gosub,updateGui
        }
    return

    currentTime:
    CurrentTime = %A_TickCount%
    gosub,updategui
    return

    updateGui:
    difference := (CurrentTime - ResetTime)
    difference2 := (CurrentTimeSleep - ResetTime)
    difference /= 1000
    if(FillCount >= 9 or Difference >= 24)
    {
        if(FillCount = 10 or Difference >= 30)
        {
            Gui,color,red
        }
        else
        {
            Gui,color,yellow
        }
    }
    else
    {
        Gui, color, green
    }
    GuiControl,text,Time,%difference%
    return

; CHANGE THIS VALUE BEFORE THE TWO COLONS TO CHANGE WHAT KEY WILL INCREMENT THE SCRIPT:
    
    Numpad2::
    FillCount += 1
    if(FillCount > 10)
    {
        FillCount = 1
    }
    ResetTime = %A_TickCount%
    GuiControl,text,Count,%FillCount%
    GuiControl,text,Time,0
    return

