@echo off
title=Uninstalling...
color 0a
echo Please wait while running...
powershell -ExecutionPolicy Bypass -file "%~dp0/files/Uninstall.ps1"
echo Done. Reboot ModusToolbox to take effect.
pause