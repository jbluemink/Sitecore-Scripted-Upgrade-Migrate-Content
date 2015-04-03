echo start upgrade750before
sqlcmd -S %DBserver% -d %DBWeb% -i files750\UpgradeCMS75.sql -o log\web750.log
if %errorlevel% neq 0 exit /b %errorlevel%
sqlcmd -S %DBserver% -d %DBCore% -i files750\UpgradeCMS75.sql -o log\core750.log
if %errorlevel% neq 0 exit /b %errorlevel%
sqlcmd -S %DBserver% -d %DBMaster% -i files750\UpgradeCMS75.sql -o log\master750.log
if %errorlevel% neq 0 exit /b %errorlevel%
del website\App_Config\include\Sitecore.Analytics.config 
del website\App_Config\include\Sitecore.Analytics.ExcludeRobots.config
REM it is okay if the file "Sitecore.Analytics.ExcludeRobots.config" is not found
del website\App_Config\include\Sitecore.Speak.config
copy "files750\Newtonsoft.Json.dll" "website\bin\"
copy "files750\Web72-75.config" "website\Web.config"
