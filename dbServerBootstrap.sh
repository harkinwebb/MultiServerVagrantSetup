#!/usr/bin/env bash

echo "#####################################################"
echo "#########   Starting DB Server provision   ##########"
echo "#####################################################"

apt-get update

echo "###########################################"
echo "#########      MYSQL Install     ##########"
echo "###########################################"

echo mysql-server mysql-server/root_password password password | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password password | sudo debconf-set-selections

apt-get install -y mysql-server
apt-get install -y mysql-client

#echo "###########################################"
#echo "#########    Import test data    ##########"
#echo "###########################################"

#mysql -uroot -ppassword < /var/www/provisioning/test.sql