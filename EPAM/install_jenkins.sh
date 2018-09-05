#!/bin/bash
apt-get install –yes apt-transport-https
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo ‘

echo 'deb https://pkg.jenkins.io/debian binary/' >> /etc/apt/sources.list

apt-get update -qq && apt-get -qq install --yes jenkins
if [[ $(dpkg --get-selections | cut -f1|grep -i jenkins) ]]; then echo 'succesfully installed'; 

else printf 'Problem in installing please check'; exit 1; 

fi

if [[ $(ps -e -o command|grep -i jenkins) ]]; then echo 'working' echo ‘do more here if necessery with some more commands’; else echo 'not working log to file' >> jenkins.log exit 1; fi

JENKINS_PASSWORD=`cat cat /var/lib/jenkins/secrets/initialAdminPassword`;
echo $JENKINS_PASSWORD

