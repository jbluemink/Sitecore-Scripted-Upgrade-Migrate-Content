echo start upgradewffm25
copy "website\App_Config\include\Sitecore.ContentSearch.Solr.Indexes.config" "website\App_Config\include\Sitecore.ContentSearch.Solr.Indexes.config.disable"
del "website\App_Config\include\Sitecore.ContentSearch.Solr.Indexes.config"
copy "wffm25\Web Forms for Marketers 2.5 rev. 150209.zip" "website\data\packages"
copy "wffm25\delwffm.zip" "website\data\packages"
rem copy "wffm25\YourFormDataWFFM.zip" "website\data\packages"
Rem because the Unrecognized Guid format Error the WFFM items will remove and later install again (optional depend on your case)
curl740\curl %CMSHost%/sitecore/admin/InstallModules.aspx?modules=delwffm.zip > log\delwffm.txt
find "Installed Package Ok:" log\delwffm.txt > nul
if %errorlevel% equ 1 goto errorpackage

rem in Dos is %20 een parameter dus dubbelencoden
curl740\curl %CMSHost%/sitecore/admin/InstallModules.aspx?modules=Web%%20Forms%%20for%%20Marketers%%202.5%%20rev.%%20150209.zip > log\upgradewffm25.txt
find "Installed Package Ok:" log\upgradewffm25.txt > nul
if %errorlevel% equ 1 goto errorpackage

rem curl740\curl %CMSHost%/sitecore/admin/InstallModules.aspx?modules=YourFormDataWFFM.zip > log\YourFormDataWFFM.txt
rem find "Installed Package Ok:" log\YourFormDataWFFM.txt > nul
rem if %errorlevel% equ 1 goto errorpackage

goto done

:errorpackage
echo ERROR met package
echo ABORT
EXIT /B 8

:done