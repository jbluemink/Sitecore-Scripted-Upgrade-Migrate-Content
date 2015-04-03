echo start stap1
set myLogDIR=log
IF not exist %myLogDIR% (mkdir %myLogDIR%)
copy "stap1\DataFolder.config" "website\App_Config\include\"
copy "stap1\ConnectionStrings.config" "website\App_Config\"
copy "stap1\RememberLastLoggedInUserName.net4.config" "website\App_Config\include\"
copy "stap1\InstallPackages.aspx" "website\sitecore\admin\"
copy "stap1\InstallModules.aspx" "website\sitecore\admin\"