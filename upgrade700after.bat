echo start upgrade700after
copy "files700\Sitecore.AntiCsrf.config" "website\App_Config\include\"
copy "files700\Sitecore.Analytics.config" "website\App_Config\include\"
copy "files700\web.config" "website\"
rem del "website\temp\dictionary.dat"
