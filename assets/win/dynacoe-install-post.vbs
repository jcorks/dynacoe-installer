Set shell = WScript.CreateObject("WScript.Shell")

Dim path
path = shell.Environment("SYSTEM").Item("DYNACOE_INSTALL_PATH")
shell.CurrentDirectory = path & "\userspace"


Call shell.Run(".\msys64\usr\bin\bash.exe -l -c ""pacman -Syu --noconfirm""", 1, true)
shell.Run "http://coebeef.net/dynacoe/toolkit.html"