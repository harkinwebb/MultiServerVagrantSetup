#!/usr/bin/env bash

echo "#########################################################"
echo "#########   Starting Worker Server provision   ##########"
echo "#########################################################"

apt-get update

echo "###########################################"
echo "#########     PHP Install        ##########"
echo "###########################################"

apt-get install -y php5 php5-mysql php5-mcrypt php5-curl php5-cli

php5enmod mcrypt

echo "###########################################"
echo "#########   Composer Install     ##########"
echo "###########################################"

curl -sS https://getcomposer.org/installer | php 
mv composer.phar /usr/local/bin/composer

#need to do rabit mq install here 