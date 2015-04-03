Sitecore Scripted Upgrade For Migrate Content
=================================================

With this script you can do a scripted upgrade, the deliverable is a converted master and core database.

On Complex Sitecore Upgrade you need time for Quality Assurance and Rework. But meanwhile you do not want a content freeze.
You need something to migrate the content. It is also possible to package al your content, don’t forget all the goals, WFFM forms, Url aliases and be sure you know your custom changes (serialize item under version control) and as last but certainly deserve attention the users and user rols.
Or you choose to follow the upgrade path descripe by every Sitecore upgrade. That is a lot of work for multiple releases. But with this set of script it is a easy job. And easy to repeat.

##Needed files
- files660/Sitecore 6.6.0 rev. 120918_fromv650rev110602.update
- files700/Sitecore 7.0 rev. 130424.update
- files710/Sitecore Update Installation Wizard 1.0.0 rev. 130920.zip
- files710/Sitecore 7.1 rev. 130926.update
- files720/Sitecore Update Installation Wizard 1.0.0 rev. 140225.zip
- files720/Sitecore 7.2 rev. 140228.update
- files750/Sitecore 7.5 rev. 141003.update
- files752/Sitecore 7.5 rev. 150212.update
- Optional wffm25/Web Forms for Marketers 2.5 rev. 150209.zip
- Optional powershell3/Sitecore PowerShell Extensions-3.0 for Sitecore 7.zip

##Needed environment
- .NET 4.5 (with the stap1/RememberLastLoggedInUserName.net4.config Sitecore 6.5 can run on .NET 4.5)
- Make sure that ASP.NET MVC 4.0 is installed.

##How to run:
- Setup a new Sitecore 7.5 rev 150212
- Setup a clean Sitecore 6.5 rev. 120427, folder Website and with data folder Website\data. Without custom config. But with a copy of your production master and core database.
- Download the necessary binaries from sdn.sitecore. 
- Adapt the stap1\ConnectionStrings.config (fill in your DB connection string)
- Adapt the runall.bat, fill in your website hostname and Db server (Trusted Connection) 
- Create your module upgrades or remove sripts.
- Execute the runall.bat
- Backup the master en core
- Restore the master en core on your new Sitecore 7.5
- Make sure all files of the modules are there

##Notes
- With a local Database you get the best performance, 25 minutes for a 6.5 to 7.5 migration is possible. (2GB master database, i7, 16GB, SSD)
- for now this has scripts for 6.5 to 7.5 but easy to adjust and add or remove some versons.
