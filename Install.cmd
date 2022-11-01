@echo off
title=Installing...
color 0a
echo Please wait while running...
powershell -file "%~dp0/files/Install.ps1"
echo Make sure no red warnings is shown above. Or resolve the warnings then re-install it again.
echo Reboot ModusToolbox to take effect.
pause