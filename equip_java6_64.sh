#!/bin/sh

#
# Ubuntu Equip 
#  Java 6 64-bit Equip
# Licence: MIT
# to run: wget --no-check-certificate https://github.com/Phury/ubuntu-equip/raw/master/equip_java6_64.sh && bash equip_java6_64.sh

if [ -d "/usr/lib/jvm/" ]; then
	echo "There's already an installation of Java JDK in /usr/lib/jvm"
	rm -f equip_java6_64.sh
	echo "Skipping..."
	exit 0
fi

wget --no-check-certificate https://github.com/aglover/ubuntu-equip/raw/master/equip_base.sh && bash equip_base.sh

sudo apt-get install curl -y 

curl -L --cookie "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin -o jdk-6u45-linux-x64.bin
chmod +x jdk-6u45-linux-x64.bin
./jdk-6u45-linux-x64.bin
sudo mkdir -p /usr/lib/jvm 
sudo mv ./jdk1.6.* /usr/lib/jvm/

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.6.0_45/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.6.0_45/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.6.0_45/bin/javaws" 1

sudo chmod a+x /usr/bin/java 
sudo chmod a+x /usr/bin/javac 
sudo chmod a+x /usr/bin/javaws
sudo chown -R root:root /usr/lib/jvm/jdk1.6.0_45

rm jdk-6u45-linux-x64.bin
rm -f equip_base.sh 
rm -f equip_java6_64.sh

java -version

