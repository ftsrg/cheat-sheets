Foreach ($visioFile in Get-ChildItem *.vsdx) {
    $figuresPath = Resolve-Path "..\"
    $pdfFilePath = "$figuresPath\$($visioFile.Name.TrimEnd('vsdx'))pdf"
    if ((-not (Test-Path $pdfFilePath)) -or ((Get-Item $pdfFilePath).LastWriteTime -lt ($visioFile.LastWriteTime))) {
        Write-Host "converting $($visioFile.Name)"
        cscript convert.vbs $visioFile.FullName
    }
    
}
mv *.pdf ../ -Force
