Write-Output "                                            "
Write-Output "              __               __           "  
Write-Output "  ___   _ __ /\_\     __      /\_\    ___   "  
Write-Output " / __``\/\``'__\/\ \  /'_ ``\    \/\ \ /' _ ``\  " 
Write-Output "/\ \L\ \ \ \/ \ \ \/\ \L\ \  __\ \ \/\ \/\ \ " 
Write-Output "\ \____/\ \_\  \ \_\ \____ \/\_\\ \_\ \_\ \_\" 
Write-Output " \/___/  \/_/   \/_/\/___L\ \/_/ \/_/\/_/\/_/" 
Write-Output "                      /\____/                " 
Write-Output "                      \_/__/                 " 
Write-Output ".                                            "
$ORIGIN_HOME="$env:USERPROFILE\.orig.in"
$ORIGIN_BOOTSTRAP="$ORIGIN_HOME\bootstrap"
md $ORIGIN_BOOTSTRAP -ea 0 | Out-Null

$JAVA_BIN="java"

function download ($src, $dst){
    Write-Output "downloading $src to $dst"
    $proxy = [System.Net.WebRequest]::GetSystemWebProxy()
    $proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials
    $wc = new-object system.net.WebClient
    $wc.proxy = $proxy
    $wc.DownloadFile($src, $dst);
}

function unzip ($src, $dst){
    Write-Output "unzipping $src to $dst"
   	$shell=new-object -com shell.application
   	$zip=$shell.NameSpace($src)
   	foreach($item in $zip.items()){
   		$shell.Namespace($dst).copyhere($item)
   	}
}


try {
	& $JAVA_BIN "-version"
} catch {
 	Write-Output "java executable not found ... installing"
 	$BOOTSTRAP_JRE_ZIP="$ORIGIN_BOOTSTRAP\bootstrap_jre.zip"
	download "https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.1+12/OpenJDK21U-jre_x64_windows_hotspot_21.0.1_12.zip"  $BOOTSTRAP_JRE_ZIP
	unzip $BOOTSTRAP_JRE_ZIP $ORIGIN_BOOTSTRAP
	$JAVA_BIN="$ORIGIN_BOOTSTRAP\jdk-21.0.1+12-jre\bin\java.exe"
}

$INSTALL_JAR="$ORIGIN_BOOTSTRAP\install.jar"
download "http://orig-in.github.io/download/install.jar" $INSTALL_JAR
& $JAVA_BIN -jar $INSTALL_JAR
 
