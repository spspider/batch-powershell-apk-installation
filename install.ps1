# get list of files *.apk
$FolderName = "installed\"
if (Test-Path $FolderName) {
   
    Write-Host "Folder Exists"
    # Perform Delete file from folder operation
}
else
{
  
    #PowerShell Create directory if not exists
    New-Item $FolderName -ItemType Directory
    Write-Host "Folder Created successfully"
}

$files = (Get-ChildItem "*.apk").Name

foreach ($f in $files){
    Write-Output $f
    adb install $f
    Get-ChildItem $f | Move-Item -Destination installed\


}
