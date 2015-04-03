echo start upgrade720
del "website\sitecore\admin\packages\*.update"
copy "files720\*.update" "website\sitecore\admin\packages\"
curl740\curl %CMSHost%/sitecore/admin/InstallPackages.aspx > log\upgradepackage720.txt
find "Error" log\upgradepackage720.txt > nul
if %errorlevel% neq 1 goto errorpackage

goto done

:errorpackage
echo ERROR with update package
echo ABORT
EXIT /B 6

:done
type nul
