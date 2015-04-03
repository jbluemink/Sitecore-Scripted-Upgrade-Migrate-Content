echo start upgrade720before
copy "files720\Sitecore Update Installation Wizard 1.0.0 rev. 140225.zip" "website\data\packages"
rem in Dos is %20 een parameter dus dubbelencoden
curl740\curl %CMSHost%/sitecore/admin/InstallModules.aspx?modules=Sitecore%%20Update%%20Installation%%20Wizard%%201.0.0%%20rev.%%20140225.zip > log\upgradewizard720.txt
find "Installed Package Ok:" log\upgradewizard720.txt > nul
if %errorlevel% equ 1 goto errorpackage

goto done

:errorpackage
echo ERROR met package
echo ABORT
EXIT /B 8
type nul
:done