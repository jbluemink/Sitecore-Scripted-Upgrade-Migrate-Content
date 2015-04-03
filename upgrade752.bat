echo start upgrade752
del website\App_Config\include\Sitecore.Analytics.*.*
del "website\sitecore\admin\packages\*.update"
copy "files752\*.update" "website\sitecore\admin\packages\"
curl740\curl %CMSHost%/sitecore/admin/InstallPackages.aspx > log\upgradepackage752.txt
find "Error" log\upgradepackage752.txt > nul
if %errorlevel% neq 1 goto errorpackage

goto done

:errorpackage
echo ERROR met update package
echo ABORT
EXIT /B 6

:done
type nul

