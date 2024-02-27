# AHK-Scripts
Random ahk/keybind scripts


Probably qol or scripts for streaming

--------------------------------------
[Auto_Lap_Timer.ahk](/Auto_Lap_Timer.ahk) - Automatically keep track of how many runecrafting laps you've completed. Uses image of a completed inventory stack of runes to detect run completion, resets counter on chat image of dark mage. If this doesn't work for you, use the images I've included as a guide and replace them with screenshots of your own client. Most of the scripts which use image search rely on client settings to be the same to produce the same image, which isn't likely. Making your own images will garuntee it works. 

[Counter.ahk](Counter.ahk) - Simple counter using hotkeys, originally meant to keep track of deaths. Saves to file to be used as an on screen element

[OSRS_Scene_Switcher.ahk](/OSRS_Scene_Switcher.ahk) - Automatically switches scenes when the login button or the bank pin interface is visible in osrs

[Lava_Runner_Overlay.ahk](/Lava_Runner_Overlay.ahk) - On screen visual aid for when to trade binding necklace. Checks for the image of "25" inventory spaces.
<---- Must be on fixed ingame with stretched mode enabled on 1920x1080 screen. ---->

   - Haven't tested with any other settings. If it doesn't work for you, update the image of the "25" text to what yours looks like.

   - Might revisit this to work no matter the settings, just seems like a lot of work. Unsure if OCR is fast enough to be worth while using.


[Dart_Fletching_Rebind.ahk](/Dart_Fletching_Rebind.ahk) - **!!!!REQUIRES [AutoHotInterception](https://github.com/evilC/AutoHotInterception)!!!!** | Rebind keys to Windows Mouse Keys, specifically used for dart fletching but could be modified to be used for other things. This is specifically a 1:1 input script. The old scripts for this use Class_DD.ahk, which is fine if you aren't on Windows 10 due to unsigned drivers. This script uses [AutoHotInterception](https://github.com/evilC/AutoHotInterception), which uses [Interception](https://github.com/oblitum/Interception), which... has signed drivers!

-----------------------------------------------------------
Installation guide for AHI & Interception (Mostly borrowed from AHI's github)
-----------------------------------------------------------

1. Download and install the latest [Interception Driver](https://github.com/oblitum/Interception/releases)
    1. Download latest .zip release
    1. Extract zip somewhere on your computer
    1. Run CMD as admin
    1. CD to the place you extracted the driver installation `*\Interception\command line installer`
    1. Run command `install-interception.exe /install`
  
1. Download the latest [AHI release](https://github.com/evilC/AutoHotInterception/releases)
    1. Download latest .zip release
    1. Extract zip somewhere on your computer
  
1. Copy contents of Interception's `library` folder into AHI's `lib` folder
    1. Specifically the `x86` and `x64` folders, you DO NOT need to copy ~~interception.h~~
  
1. Run Unblocker.ps1
    1. In AHI's `lib` folder, run `Unblocker.ps1` as admin
        1. Unblocker.ps1 should allow you to run the Interception DLL's, if they are blocked from running
            - This can be done manually by right clicking the DLLs, selecting Properties, and checking a "Block" box if it exists.
      
1. Get VID/PID of the keyboard you are using
    1. In AHI's main folder, run `Monitor.ahk`
    1. Check one of the keyboard ID's at a time, and try to type something
        1. Checking all of the ID's can sometimes cause Monitor.ahk to crash
    1. Once you see input in the box from the Keyboard you are using, transfer the VID & PID into the script on the 7th line
        1. `global keyboardId := AHI.GetKeyboardId(VID HERE, PIN HERE)`

1. Transfer the contents of AHI's `lib` into AHK's installation `lib` folder `*\AutoHotkey\lib` 
 
    
  
