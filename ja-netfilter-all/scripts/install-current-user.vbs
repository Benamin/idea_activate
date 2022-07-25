Set oShell = CreateObject("WScript.Shell")
Set oEnv = oShell.Environment("USER")
Set oFS = CreateObject("Scripting.FileSystemObject")

Dim sEnvKey, sEnvVal, aJBProducts
aJBProducts = Array("idea", "clion", "phpstorm", "goland", "pycharm", "webstorm", "webide", "rider", "datagrip", "rubymine", "appcode", "dataspell", "gateway", "jetbrains_client", "jetbrainsclient", "studio", "devecostudio")

Set re = New RegExp
re.Global     = True
re.IgnoreCase = True
re.Pattern    = "^\-javaagent:.*[\/\\]ja\-netfilter\.jar.*"

Dim sBasePath, sJarFile
sBasePath = oFS.GetParentFolderName(oShell.CurrentDirectory)
sJarFile = sBasePath & "\ja-netfilter.jar"

If Not oFS.FileExists(sJarFile) Then
    MsgBox "ja-netfilter.jar not found", vbOKOnly Or vbCritical
    WScript.Quit -1
End If

MsgBox "It may take a few seconds to execute this script." & vbCrLf & vbCrLf & "Click 'OK' button and wait for the prompt of 'Done.' to pop up!"

Dim sVmOptionsFile
For Each sPrd in aJBProducts
    sEnvKey = UCase(sPrd) & "_VM_OPTIONS"
    sVmOptionsFile = sBasePath & "\vmoptions\" & sPrd & ".vmoptions"
    If oFS.FileExists(sVmOptionsFile) Then
        ProcessVmOptions sVmOptionsFile
        oEnv(sEnvKey) = sVmOptionsFile
    End If
Next

Sub ProcessVmOptions(ByVal file)
    Dim sLine, sNewContent, bMatch
    Set oFile = oFS.OpenTextFile(file, 1, 0)

    sNewContent = ""
    Do Until oFile.AtEndOfStream
        sLine = oFile.ReadLine
        bMatch = re.Test(sLine)
        If Not bMatch Then
            sNewContent = sNewContent & sLine & vbLf
        End If
    Loop
    oFile.Close

    sNewContent = sNewContent & "-javaagent:" & sJarFile & "=jetbrains"
    Set oFile = oFS.OpenTextFile(file, 2, 0)
    oFile.Write sNewContent
    oFile.Close
End Sub

MsgBox "Done."
