Gunkolle - Automated expedition checker 
--



```
>scripting
>kuso ttk
```

## Requirements: 

Running from source
* AHK (http://ahkscript.org/ or https://autohotkey.com/)
* Gdip_All library by tic (included)
* findclick library by berban (also included)
* Mouse library by fnzr (included)
* playing at 1280 x 720 res
* Both NVIDIA and AMD graphics cards are working, but AMD users might need to replace some pics. 
* Latest version of LDPlayer should work fine (3.76) but older versions work too.
* Newer versions of LDPlayer are rumored to have a cryptominer, so use old version or delete fynews.exe, fyservice.exe in ld player directory, and delete fyservice from services via admin CMD - type "SC DELETE fyservice".
* Default background in main menu.
* Using the uncensored pics via recipe (522/320/404/137).
* Using old apk before the V2.0410 Optional Client Update for now. https://reddit.com/r/girlsfrontline/comments/e3n7dt/all_the_design_issuesbugs_with_the_new_optional/

THIS SCRIPT IS ONLY TESTED AND MAINTAINED ON WIN8.1 AND WIN10. I may be unable to help you on any other version.

## Features:

* Background scripting (cannot be minimized)
* Dynamic pixel checking to prevent user error
* Can be set up to pause/resume at a certain time
* All clicks have randomness to avoid click tracking
* Can run for 24 hours, even skipping the daily login messages! (running maps for long can cause game to lag/crash)

## What does not work at current state:
1. Auto-Factory check
2. Auto-Battle return
3. Combat simulation, batteries, time checks

## How to use: Gunkolle(Expeditions)
When starting Gunkolle make sure your android emulator is the active window when starting the script. (else you'll get an invald screen reading)

Dont do anything until you see the 'Ready' in the gui box.

Click expedition only and leave window open in background.

To use another emulator, add/create an entry in the config.ini file in the script directory. Use AU3_Spy Window Spy that is included with your AHK installation to determine the window properties.  As shown below (Two valid options are show, **PICK ONE**)-

```
[Variables]
WINID=ahk_class Qt5QWindowIcon
WINID=ahk_exe Nox.exe
```

You will also likely need to find and replace all existing mentions of LDPlayer in all functions. As far as I know, you need more changes for most other emulators that aren't Nox or LDPlayer. MeMu doesn't get recognized at all when I last tried.

## How to use: Gunkolle(Sortie)
read the wiki

old old client example:

![lol](https://github.com/dice4321/Gunkolle/blob/master/uselesspics/lol32.gif)

## How to use: Pause Utility

Simple pause script that runs alongside Gunkolle.

Enter in config.ini under [Variables], PauseHr=22 , and PauseMn=22 to pause at 22:22.  Use 24 Hour format only. You may use PCSleep=1 to sleep the computer at that time as well.

Use ResumeHr and ResumeMn to have the script resume at a specific time. Can be omitted for pause functionality only. When resume is enabled, PCSleep will be ignored and expired timers will automatically be set to pause/resume 24 hours later.
