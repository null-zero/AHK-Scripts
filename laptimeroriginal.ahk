; This script was made a long time ago by Dreyri.
; I use it for Runecrafting to keep track of when my pouches
; are about to degrade.

; This paste has f1 set to increment the timer, you can change
; what key you want to use for it where I commented in all caps.
; Reset the timer to 1 when you repair your pouches, then
; repair them again when the timer hits 9 and your pouch
; will never degrade and you won't ever lose the 3 essence
; on 10th runs.

#SingleInstance force

    Gosub,currentTime
    Gosub,updateGui
    SetTimer,currentTime,500

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
    }
    else
    {
    Gui,-alwaysontop
    }
    WinGetPos,orx,ory,width,height, ahk_class SunAwtFrame
    winX := orx + 719
    winY := ory + 54
    Gui,show,NA x%winX% y%winy%
    Sleep,500
    }
    else
    {
    Gui,Submit
    Sleep,2000
    }
    }
    return

; CHANGE THIS VALUE BEFORE THE TWO COLONS TO CHANGE WHAT KEY WILL INCREMENT THE SCRIPT:
    f1::
    FillCount += 1
    if(Fillcount > 9)
    {
    FillCount = 1
    }
    if(FillCount >= 8)
    {
    if(FillCount = 9)
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
    ResetTime = %A_TickCount%
    GuiControl,text,Count,%FillCount%
    GuiControl,text,Time,0
    return

    currentTime:
    CurrentTime = %A_TickCount%
    gosub,updategui
    return

    updateGui:
    difference := (CurrentTime - ResetTime)
    difference /= 1000
    GuiControl,text,Time,%difference%
    return