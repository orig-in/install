echo '                                              '
echo '              __               __             '
echo '  ___   _ __ /\_\     __      /\_\    ___     '
echo ' / __`\/\`'"'"'__\/\ \  /'"'"'_ `\    \/\ \ /'"'"' _ `\   '
echo '/\ \L\ \ \ \/ \ \ \/\ \L\ \  __\ \ \/\ \/\ \  '
echo '\ \____/\ \_\  \ \_\ \____ \/\_\\ \_\ \_\ \_\ '
echo ' \/___/  \/_/   \/_/\/___L\ \/_/ \/_/\/_/\/_/ '
echo '                      /\____/                 '
echo '                      \_/__/                  '
echo ''
if [[ -z "${ORIGIN_HOME}" ]]; then
  ORIGIN_HOME=~/.orig.in
else
  ORIGIN_HOME="${ORIGIN_HOME}"
fi

if [ ! -d "$ORIGIN_HOME" ]; then
	echo creating $ORIGIN_HOME
	mkdir $ORIGIN_HOME
fi

if [ ! -d "$ORIGIN_HOME/java/latest" ]; then
	echo "java executable not found, installing ..."
	
    #TODO : what about 32 bit linux?
	JAVA_DOWNLOAD=http://installbuilder.bitrock.com/java/jdk1.8.0_144-linux-x64.zip
	JAVA_FOLDER=jdk1.8.0_144-linux-x64/java-linux-x64
	case "`uname`" in
	    Darwin*)
			JAVA_DOWNLOAD=http://installbuilder.bitrock.com/java/jdk1.8.0_144-osx.zip
			JAVA_FOLDER=jdk1.8.0_144-osx/java-osx
	        ;;
	esac
	mkdir $ORIGIN_HOME/download/
	wget -N $JAVA_DOWNLOAD -O $ORIGIN_HOME/download/java.zip
	unzip $ORIGIN_HOME/download/java.zip -d $ORIGIN_HOME/download/java/
	mkdir /home/matthi/.orig.in/java/
	mv $ORIGIN_HOME/download/java/$JAVA_FOLDER $ORIGIN_HOME/java/latest
	rm -rf $ORIGIN_HOME/download
fi

wget -N http://orig-in.github.io/download/install.jar -O $ORIGIN_HOME/install.jar
wget -N http://orig-in.github.io/download/origin-upgrade.jar -O $ORIGIN_HOME/origin-upgrade.jar
wget -N http://orig-in.github.io/download/relaunch.jar -O $ORIGIN_HOME/relaunch.jar
$ORIGIN_HOME/java/latest/bin/java -jar $ORIGIN_HOME/install.jar

