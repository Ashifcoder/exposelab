@echo off
cp "C:\vagrant\CoolScripts\info.bgi" "C:\windows\"
"C:\ProgramData\chocolatey\bin\bginfo" "C:\windows\info.bgi" /timer:0  /nolicprompt

