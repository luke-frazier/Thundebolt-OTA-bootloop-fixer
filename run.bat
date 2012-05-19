:: :: ::
:: This program is free software. It comes without any warranty, to
:: the extent permitted by applicable law. You can redistribute it
:: and/or modify it under the terms of the Do What The F*** You Want
:: To Public License, Version 2, as published by Sam Hocevar. See
:: http://sam.zoy.org/wtfpl/COPYING for more details.
:: :: ::
@echo off
color 0b
title Trter10's OTA brick fixer
IF NOT EXIST support_files (GOTO err)
echo.
echo ===========================
echo  Trter10's OTA brick fixer
echo ===========================
echo.
echo Not responible for any damaged devices!
echo.
echo Please put your phone in fastboot mode.
echo.
echo You can do this by pulling out your battery,
echo replacing it, holding volume down + power until
echo hboot shows, waiting a few seconds, and 
echo selecting fastboot. If it asks you to update in
echo hboot, SAY NO, remove your sdcard and then run this.
echo.
echo Press enter when you're in fastboot.
pause >NUL
echo.
echo If it gets stuck at waiting for device, make sure you
echo have the drivers installed. (Packaged with this)
echo.
echo DO NOT TOUCH THE PHONE UNTIL I SAY SO!
echo.
support_files\fastboot erase cache
support_files\fastboot flash recovery support_files\cwmreg.img
support_files\fastboot oem gotohboot
PING 1.1.1.1 -n 1 -w 6000 >NUL
cls
echo.
echo Please select Recovery in hboot! (Vol down then power)
echo.
echo Press enter when you're in recovery.
pause >NUL
echo.
echo Running...
support_files\adb kill-server
support_files\adb start-server
echo.
echo 1
support_files\adb shell mount /system
echo 2
support_files\adb shell rm /system/app/DmClient.apk
echo 3
support_files\adb reboot
echo LET'S GO!
echo.
echo Phone should reboot and be fully working, still 
echo rooted, and OTAs blocked.
echo.
echo Press any key to exit...
pause >NUL
exit
:err
cls
color 0c
echo.
echo It appears that you did not unzip the file correctly. Please manually unzip it  without using a program like 7-zip.
echo.
echo Press any key to exit...
pause >NUL
exit