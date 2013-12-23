Option Explicit

Main()

Sub Main()
  If WScript.Arguments.Count > 0 Then 
      Dim objFSO : Set objFSO = CreateObject("Scripting.FileSystemObject")
      Dim i
      For i = 0 to wscript.arguments.count - 1
          Dim strFilePath : strFilePath = WScript.Arguments.Item(i)
          Dim dirPath : dirPath = objFSO.GetParentFolderName(strFilePath)
          Dim fileBaseName : fileBaseName = objFSO.GetBaseName(strFilePath)
          'WScript.Echo strFilePath
          Dim strNewFileName : strNewFileName = dirPath & "\" & fileBaseName & ".pdf"
          'WScript.Echo strNewFileName
          Dim strFileExt : strFileExt = UCase(objFSO.GetExtensionName(strFilePath))
          Select Case strFileExt
              Case "VSD"
                  VSD2PDF strFilePath, strNewFileName
              Case "VSDX"
                  VSD2PDF strFilePath, strNewFileName
              Case Else
                  WScript.Echo "Extension Type:  " & strFileExt
          End Select
      Next
  Else
      msgbox("Choose a file to convert.")
  End If
End Sub

Sub VSD2PDF(strSourceFile, strDestFile)
  Const xlTypePDF = 1
  Const visOpenRO = 2
  Const visOpenMinimized = 16
  Const visOpenHidden = 64
  Const visOpenMacrosDisabled = 128
  Const visOpenNoWorkspace = 256

  Dim objVisio : Set objVisio = CreateObject("Visio.Application")
  Dim objeDoc : Set objeDoc = objVisio.Documents.OpenEx(strSourceFile, visOpenRO + visOpenMinimized + visOpenHidden + visOpenMacrosDisabled + visOpenNoWorkspace)    
  objeDoc.ExportAsFixedFormat xlTypePDF, strDestFile, 1, 0
  objeDoc.Close
  objVisio.Quit
End Sub
