ORIGIN_HOME=~/.orig.in
JAVA_DOWNLOAD=http://get.jenv.mvnsearch.org/download/java/java-1.8.0_60.zip
JAVA_DOWNLOAD_BIN=unknown
case "`uname`" in
    Darwin*)
		JAVA_DOWNLOAD=http://get.jenv.mvnsearch.org/download/java/java-1.9.0-ea-mac.zip
		JAVA_DOWNLOAD_BIN=$ORIGIN_HOME/java/java-1.9.0-ea/Contents/Home/bin/java
        ;;
esac
JAVA_BIN=java
if ! $JAVA_BIN -version; then
	echo "no java found. installing ..."
	wget $JAVA_DOWNLOAD -O $ORIGIN_HOME/java.zip
	unzip $ORIGIN_HOME/java.zip -d $ORIGIN_HOME/java/
	JAVA_BIN=$JAVA_DOWNLOAD_BIN
	$JAVA_BIN -version
fi
if [ ! -d "$ORIGIN_HOME" ]; then
	echo creating $ORIGIN_HOME
	mkdir $ORIGIN_HOME
fi
wget http://orig-in.github.io/download/install.jar -O $ORIGIN_HOME/install.jar
java -jar $ORIGIN_HOME/install.jar

