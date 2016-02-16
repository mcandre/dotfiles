# mkdir -p $HOME/.bashrc.d/
# ln -s .../tomcat $HOME/.bashrc.d/tomcat
# echo 'for f in "$HOME"/.bashrc.d/* ; do source "$f" ; done' >> $HOME/.bashrc

# Tomcat
export TOMCAT_HOME='/usr/local/Cellar/tomcat6/6.0.43'
export CATALINA_HOME="$TOMCAT_HOME/libexec"
export CATALINA_OPTS="-Xms2g -Xmx2g -XX:MaxPermSize=1024M -XX:PermSize=512M -XX:NewRatio=3 -XX:ParallelGCThreads=8 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+AggressiveOpts -Djavax.net.ssl.trustStore=$HOME/nicerts -Djavax.net.ssl.trustStorePassword=changeit -Djavax.net.ssl.keyStore=$HOME/nicerts -Djavax.net.ssl.keyStorePassword=changeit -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=n"
alias tomstart='$TOMCAT_HOME/bin/startup.sh'
alias tomstop='$TOMCAT_HOME/bin/shutdown.sh 20'
alias tomlog='tail -f $CATALINA_HOME/logs/catalina.out'
