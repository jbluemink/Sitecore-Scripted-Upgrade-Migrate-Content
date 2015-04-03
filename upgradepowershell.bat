echo start upgradepowershell
copy "powershell3\Sitecore PowerShell Extensions-3.0 for Sitecore 7.zip" "website\data\packages"
curl740\curl %CMSHost%/sitecore/admin/InstallModules.aspx?modules=Sitecore%%20PowerShell%%20Extensions-3.0%%20for%%20Sitecore%%207.zip > log\upgradepowershell.txt
find "Installed Package Ok:" log\upgradepowershell.txt > nul
if %errorlevel% equ 1 goto errorpackage


goto done

:errorpackage
echo ERROR met package
echo ABORT
EXIT /B 8

:done