
Write-Host -ForegroundColor Cyan "[*] Setting up the Machine Information"

cp C:\vagrant\CoolScripts\info.bgi C:\windows
cp C:\vagrant\CoolScripts\info.bat 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp'


psexec -accepteula -s cmd /c C:\vagrant\CoolScripts\WLMS_remove.bat