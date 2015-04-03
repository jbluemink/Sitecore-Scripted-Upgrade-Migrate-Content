echo start upgrade660
del "website\sitecore\admin\packages\*.update"
copy "files660\*.update" "website\sitecore\admin\packages\"
curl740\curl %CMSHost%/sitecore/admin/InstallPackages.aspx > log\upgradepackage660.txt
find "Error" log\upgradepackage660.txt > nul
if %errorlevel% neq 1 goto errorpackage

goto done

:errorpackage
echo ERROR met update package
echo ABORT
EXIT /B 6

:done
type nul