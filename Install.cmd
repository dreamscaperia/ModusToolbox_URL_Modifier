@echo off
title=Installing...
color 0a
echo Please wait while running...
powershell -file "%~dp0/files/Install.ps1"
echo Done. Reboot ModusToolbox to take effect.
pause