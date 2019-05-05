function mkdirif {
	if [ ! -d "$1" ]; then
		echo creating $1
		mkdir -p $1
	fi
}  

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
if [[ "$OSTYPE" == linux* ]]; then
	OS='linux'
fi
if [[ "$OSTYPE" == darwin* ]]; then
	OS='mac'
fi

if [[ -z "${ORIGIN_HOME}" ]]; then
  ORIGIN_HOME=~/.orig.in
else
  ORIGIN_HOME="${ORIGIN_HOME}"
fi
if [ -d "$ORIGIN_HOME" ]; then
   echo $ORIGIN_HOME exists
fi

mkdirif $ORIGIN_HOME


if [ ! -d "$ORIGIN_HOME/java/latest" ]; then
	echo "java executable not found, installing ..."
	JAVA_DOWNLOAD_FILE=OpenJDK12U-jdk_x64_${OS}_hotspot_12.0.1_12.tar.gz
	JAVA_DOWNLOAD=https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.1%2B12/$JAVA_DOWNLOAD_FILE
	JAVA_FOLDER=jdk-12.0.1+12
	
	mkdirif $ORIGIN_HOME/download/
	wget -N $JAVA_DOWNLOAD -O $ORIGIN_HOME/download/$JAVA_DOWNLOAD_FILE
	
	mkdirif $ORIGIN_HOME/java
	tar -xzf $ORIGIN_HOME/download/$JAVA_DOWNLOAD_FILE -C $ORIGIN_HOME/java
	ln -s $ORIGIN_HOME/java/$JAVA_FOLDER $ORIGIN_HOME/java/latest
	rm -rf $ORIGIN_HOME/download
fi

wget -N http://orig-in.github.io/download/install.jar -O $ORIGIN_HOME/install.jar
wget -N http://orig-in.github.io/download/origin-upgrade.jar -O $ORIGIN_HOME/origin-upgrade.jar
wget -N http://orig-in.github.io/download/relaunch.jar -O $ORIGIN_HOME/relaunch.jar
$ORIGIN_HOME/java/latest/bin/java -jar $ORIGIN_HOME/install.jar

