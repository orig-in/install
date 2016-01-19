@echo off
echo                                               
echo               __               __             
echo   ___   _ __ /\_\     __      /\_\    ___     
echo  / __`\/\`'__\/\ \  /'_ `\    \/\ \ /' _ `\   
echo /\ \L\ \ \ \/ \ \ \/\ \L\ \  __\ \ \/\ \/\ \  
echo \ \____/\ \_\  \ \_\ \____ \/\_\\ \_\ \_\ \_\ 
echo  \/___/  \/_/   \/_/\/___L\ \/_/ \/_/\/_/\/_/ 
echo                       /\____/                 
echo                       \_/__/                  
echo. 

set ORIGIN_HOME=%USERPROFILE%\.orig.in
IF NOT EXIST %ORIGIN_HOME% (
   echo creating orig.in home dir %ORIGIN_HOME%
   mkdir %ORIGIN_HOME%
)
SET JAVA_DOWNLOAD=unknown
SET JAVA_DOWNLOAD_BIN=unknown
set JAVA_BIN=java

IF EXIST "%PROGRAMFILES(X86)%" (
	set JAVA_DOWNLOAD=http://get.jenv.mvnsearch.org/download/java/java-1.8.0_20-x64.zip
	set JAVA_DOWNLOAD_BIN=$ORIGIN_HOME/java/tbd
) ELSE (
	set JAVA_DOWNLOAD=http://get.jenv.mvnsearch.org/download/java/java-1.8.0_20-win.zip
	set JAVA_DOWNLOAD_BIN=$ORIGIN_HOME/java/tb
)

@%JAVA_BIN% -version
if ERRORLEVEL 1 (
	echo java executable not found ... installing
	call:download %JAVA_DOWNLOAD% "%ORIGIN_HOME%/java.zip"
	call:unzip "%ORIGIN_HOME%/java.zip" -d "%ORIGIN_HOME%/java/"
	JAVA_BIN=%JAVA_DOWNLOAD_BIN%
	%JAVA_BIN% -version
) 
call:download "http://orig-in.github.io/download/install.jar" "%ORIGIN_HOME%/install.jar"
call:download "http://orig-in.github.io/install/elevate.exe" "%ORIGIN_HOME%/elevate.exe"

"%ORIGIN_HOME%/elevate.exe" %JAVA_BIN% -jar "%ORIGIN_HOME%/install.jar"


::--------------------------------------------------------
::-- Functions
::--------------------------------------------------------
goto:eof

:download
	echo downloading %~2
	powershell -Command "$proxy = [System.Net.WebRequest]::GetSystemWebProxy();$proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials;$wc = new-object system.net.WebClient;$wc.proxy = $proxy;$wc.DownloadFile('%~1', '%~2');"
goto:eof

:unzip
	echo unzipping %~1
	powershell -Command "$shell=new-object -com shell.application;$zip=$shell.NameSpace('%~1');foreach($item in $zip.items()){$shell.Namespace('%~2').copyhere($item);}"
goto:eof