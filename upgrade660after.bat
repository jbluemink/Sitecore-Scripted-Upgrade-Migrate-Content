echo start upgrade660after
sqlcmd -S %DBserver% -d %DBWeb% -i files660\CMS660_AfterInstall.sql -o log\web660.log
if %errorlevel% neq 0 exit /b %errorlevel%
sqlcmd -S %DBserver% -d %DBCore% -i files660\CMS660_AfterInstall.sql -o log\core660.log
if %errorlevel% neq 0 exit /b %errorlevel%
sqlcmd -S %DBserver% -d %DBMaster% -i files660\CMS660_AfterInstall.sql -o log\master660.log
if %errorlevel% neq 0 exit /b %errorlevel%
copy "files660\Commands.config" "website\App_Config\Commands.config"
copy "files660\FieldTypes.config" "website\App_Config\FieldTypes.config"
copy "files660\Sitecore.Analytics.config" "website\App_Config\include\"
copy "files660\web.config" "website\"
rem del "website\temp\dictionary.dat"
