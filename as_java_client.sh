#!/bin/bash

CURRENT_USER=$USER
if [[ $CURRENT_USER == "root" ]]; then
  CURRENT_USER=$SUDO_USER
fi

#CURRENT_HOME=`eval echo ~$CURRENT_USER`
CURRENT_HOME=/aerospike

echo -------- Installing Aerospike Java client ----------------

apt-get install openjdk-8-jdk -y
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JRE_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre
export PATH=$PATH:/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin:/usr/lib/jvm/java-1.7.0-openjdk.x86_64/jre/bin
cd $CURRENT_HOME
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> .bashrc
echo "export JRE_HOME=/usr/lib/jvmjava-1.8.0-openjdk-amd64/jre" >> .bashrc
echo "export PATH=$PATH:/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin:/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/bin" >> .bashrc
echo "export PATH=${CURRENT_HOME}/apache-maven-3.3.9/bin:$PATH" >> .bashrc
wget 'ftp://mirror.reverse.net/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz'
tar xzf apache-maven-3.3.9-bin.tar.gz
cd apache-maven-3.3.9
export PATH=${CURRENT_HOME}/apache-maven-3.3.9/bin:$PATH
mvn --version
cd ${CURRENT_HOME}
wget -O java.tgz 'http://aerospike.com/download/client/java/latest/artifact/tgz'
tar xzf java.tgz
ASVERSION=`ls -rd aerospike-client-java-*|head`
cd $ASVERSION
cd examples
mvn package
cd "${CURRENT_HOME}/${ASVERSION}/benchmarks/"
mvn package
#./run_examples -usage
echo -e "\n"
echo " What's next? "
echo " Try running our examples:"
echo "cd ${CURRENT_HOME}/${ASVERSION}/examples/"
echo "Run PUT and GET example:"
echo "./run_examples PutGet"
echo ""
echo "Run all the examples:"
echo "./run_examples all"
echo ""
echo "Run benchmarks:"
echo "cd ${CURRENT_HOME}/${ASVERSION}/benchmarks/"
echo "./run_benchmarks -h 127.0.0.1 -p 3000 -n test -k 100000000 -l 30 -S 1 -o S:50 -w RU,10 -z 20"
