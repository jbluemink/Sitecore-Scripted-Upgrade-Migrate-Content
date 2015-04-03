set DBserver=BAFLO\JAN
set DBCore=Sitecore_script_Core
set DBMaster=Sitecore_script_Master
set DBWeb=Sitecore_web
set CMSHost=upgradedb.website.local

call stap1.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade660.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade660after.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade700.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade700after.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade710before.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade710.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade710after.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade720before.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade720.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade720after.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade750before.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade750.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade750after.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade752.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call upgrade752after.bat
if %errorlevel% neq 0 exit /b %errorlevel%
rem call upgradewffm25.bat
if %errorlevel% neq 0 exit /b %errorlevel%
rem call upgradepowershell.bat
if %errorlevel% neq 0 exit /b %errorlevel%
echo finished successfully converted to 7.5
