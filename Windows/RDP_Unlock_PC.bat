:: Use RDP to unlock Windows Screen for moonlight.

:: Get admin permission
@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )

:: Unlock PC Screen
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "$sessionid=((quser $env:USERNAME | select -Skip 1) -split '\s+')[2]; tscon $sessionid /dest:console" 2> UnlockErrors.log
