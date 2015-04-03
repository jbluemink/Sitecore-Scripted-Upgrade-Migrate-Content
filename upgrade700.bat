echo start upgrade700
del "website\sitecore\admin\packages\*.update"
copy "files700\*.update" "website\sitecore\admin\packages\"
curl740\curl %CMSHost%/sitecore/admin/InstallPackages.aspx > log\upgradepackage700.txt
find "Error" log\upgradepackage700.txt > nul
if %errorlevel% neq 1 goto errorpackage

goto done

:errorpackage
echo ERROR with update package
echo ABORT
EXIT /B 6

:done
type nul
