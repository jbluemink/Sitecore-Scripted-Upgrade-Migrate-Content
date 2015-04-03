copy "files710\Sitecore Update Installation Wizard 1.0.0 rev. 130920.zip" "website\data\packages"
rem in Dos is %20 een parameter dus dubbelencoden
curl740\curl %CMSHost%/sitecore/admin/InstallModules.aspx?modules=Sitecore%%20Update%%20Installation%%20Wizard%%201.0.0%%20rev.%%20130920.zip > log\upgradewizard710.txt
find "Installed Package Ok:" log\upgradewizard710.txt > nul
if %errorlevel% equ 1 goto errorpackage

copy "files710\MaxQueryResultOnbeperkt.config" "website\App_Config\include\"
goto done

:errorpackage
echo ERROR met package
echo ABORT
EXIT /B 8

:done

