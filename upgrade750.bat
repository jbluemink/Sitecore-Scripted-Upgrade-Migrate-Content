echo start upgrade750
del "website\sitecore\admin\packages\*.update"
copy "files750\*.update" "website\sitecore\admin\packages\"
curl740\curl %CMSHost%/sitecore/admin/InstallPackages.aspx > log\upgradepackage750.txt
find "Error" log\upgradepackage750.txt > nul
if %errorlevel% neq 1 goto errorpackage

goto done

:errorpackage
echo ERROR met update package
echo ABORT
EXIT /B 6

:done
type nul

