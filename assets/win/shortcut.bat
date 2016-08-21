@echo off
SETLOCAL ENABLEEXTENSIONS
FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `REG QUERY "HKEY_CURRENT_USER\Software\Coebeef\Dynacoe" /ve`
) DO SET localPath=%%M
if [%1]==[] goto noPath
C:\Windows\System32\cmd.exe /A /Q /C ""%localPath%\userspace\msys64\msys2_shell.cmd" "-mingw64" "-full-path" "-here""
exit


:noPath
C:\Windows\System32\cmd.exe /A /Q /C ""%localPath%\userspace\msys64\msys2_shell.cmd" "-mingw64" "-full-path""
exit
