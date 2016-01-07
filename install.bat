@echo off
set ORIGIN_HOME=%USERPROFILE%\.orig.in
IF EXIST %ORIGIN_HOME% GOTO ORIGIN_HOME_OK
   echo creating orig.in home dir %ORIGIN_HOME%
   mkdir %ORIGIN_HOME%
:ORIGIN_HOME_OK

@java -version
if ERRORLEVEL 1 (
	echo java executable not found ... installing
) 
echo "downloading install.jar"
set source=http://orig-in.github.io/download/install.jar
set dest=%ORIGIN_HOME%/install.jar

powershell -Command "$proxy = [System.Net.WebRequest]::GetSystemWebProxy();$proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials;$wc = new-object system.net.WebClient;$wc.proxy = $proxy;$wc.DownloadFile('%source%', '%dest%');"
java -jar %ORIGIN_HOME%/install.jar




 