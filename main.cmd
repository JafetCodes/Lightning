@echo off
Mode 60,15
color 4f
title [V3] XEINTS - FPS PERFORMANCE
SETLOCAL EnableDelayedExpansion

:main
::: __  _____ ___ _  _ _____ ___ 
:::  \ \/ / __|_ _| \| |_   _/ __|
:::   >  <| _| | || .` | | | \__ \
:::  /_/\_\___|___|_|\_| |_| |___/
:::
:::      FPS PERFORMANCE V3             
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo ----------------
echo 1. Discord
echo 2. Apply Tweaks
echo ----------------

:input
set /p option=Select an option (1 or 2): 

if "%option%"=="1" (
    start https://www.ejemplo.com
    cls
    goto main
    goto input
)

) else if "%option%"=="2" (
:start
set success=
C:\Windows\Lightning\NSudo.exe -U:T -P:E -Wait C:\Windows\Lightning\run.bat /start

:: read from success file
set /p success= < C:\Users\Public\success.txt

:: check if script is finished
if %success% equ true goto success

:: if not, restart script
echo SCRIPT CLOSED!
echo Relaunching...
goto start

:success
del /f /q "C:\Users\Public\success.txt"
shutdown /r /f /t 10 /c "Reboot is required..."
rmdir /s /q C:\Windows\Lightning
DEL "%~f0"

exit
) else (
  echo Invalid option. Please select a valid option (1/2/3).
  goto input
)

pause