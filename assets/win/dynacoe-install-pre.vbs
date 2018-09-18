' A post install script to prepare the msys2 environment for Dynacoe
' First step, retrieve a prev version o msys2

Set shell = WScript.CreateObject("WScript.Shell")
Dim path 
path = shell.Environment("SYSTEM").Item("DYNACOE_INSTALL_PATH")
shell.CurrentDirectory = path & "\userspace"
Set fs    = CreateObject("Scripting.FileSystemObject")



' If this is from a previous installation that may have failed
If (fs.FolderExists(".\msys64")) Then
    MsgBox "Old msys64 installation detected. Skipping MSYS2 instllation step (Uninstall and remove the msys64 directory manually if you'd like to start fresh)"
    
    WScript.Quit 0
End If

' set up userspace permissions
res = shell.Run("icacls.exe .\ /grant ""everyone"":(OI)(CI)M", 1, true)
If res <> 0 Then
    MsgBox "Error: permission granting for userspace root directory failed. You may experience -weird- permission issues!"
    WScript.Quit 1
End If


' Retrieve the msys2 install
Dim res 
res = shell.Run("..\bootstrap\wget.exe http://repo.msys2.org/distrib/x86_64/msys2-base-x86_64-20180531.tar.xz", 1, true)
If res <> 0 Then
    MsgBox "Error: Could not retrieve msys2 installation!!"
    WScript.Quit 1
End If

' Unpack it

Set fileSrc = fs.GetFile(".\msys2-base-x86_64-20180531.tar.xz")
fileSrc.Move ".\msys2.tar.xz"
res = shell.Run("cmd /c ""..\bootstrap\xzdec.exe -d .\msys2.tar.xz"" > .\msys2.tar", 1, true)
If res <> 0 Then
    MsgBox "Error: xz decompression failed!! (How???)"
    WScript.Quit 1
End If

fileSrc.Delete
res = shell.Run("..\bootstrap\tar.exe xf msys2.tar --verbose", 1, true)
If res <> 0 Then
    MsgBox "Error: tar unpacking failed!! (How???)"
    WScript.Quit 1
End If
Set fileSrc = fs.GetFile(".\msys2.tar")
fileSrc.Delete




'Set outFile = fs.CreateTextFile("log.txt", true)
'Now that we have an msys, run bash and update


Call shell.Run(".\msys64\usr\bin\bash.exe -l -c ""pacman -Syu --noconfirm""", 1, true)
'outFile.Write "Initial update:"
'outFile.Write out.StdOut.ReadAll
'outFile.Write "ERRORS::::::::::"
'outFile.Write out.StdErr.ReadAll
'outFile.Write "+++++++++++++++++++++++++++++++++++++++++++++++++"

Call shell.Run(".\msys64\usr\bin\bash.exe -l -c ""pacman -Syu --noconfirm""", 1, true)
'outFile.Write "Initial update:"
'outFile.Write out.StdOut.ReadAll
'outFile.Write "ERRORS::::::::::"
'outFile.Write out.StdErr.ReadAll
'outFile.Write "+++++++++++++++++++++++++++++++++++++++++++++++++"

' And lets also install what we need!
Call shell.Run(".\msys64\usr\bin\bash.exe -l -c ""pacman -S mingw64/mingw-w64-x86_64-gcc git make nano tar xz --noconfirm""", 1, true)
'outFile.Write "Necessary package installation:"
'outFile.Write out.StdOut.ReadAll
'outFile.Write "ERRORS::::::::::"
'outFile.Write out.StdErr.ReadAll

' update env
res = shell.Run("..\bootstrap\propagate.exe", 1, true)
WScript.Quit 0
