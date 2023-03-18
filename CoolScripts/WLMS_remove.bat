@echo off
echo [+] Removing WLMS Service
sc delete WLMS
echo [+] Removing WLMS Regestry 
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WLMS" /f
echo [+] Removing WLMS Success! [+]