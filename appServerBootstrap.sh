#!/usr/bin/env bash

echo "######################################################"
echo "#########   Starting App Server provision   ##########"
echo "######################################################"

apt-get update

echo "###########################################"
echo "#########   Apache 2 Install     ##########"
echo "###########################################"

apt-get install -y apache2

a2enmod rewrite

echo "####################################################################"
echo "##str_replace("Where's zed .... zed's dead baby", "z", "s") ########"
echo "####################################################################"

sudo mv /etc/apache2/apache2.conf /etc/apache2/apache2.bak
sudo mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.bak

sudo sed '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride all/' /etc/apache2/apache2.bak > /etc/apache2/apache2.conf
sudo sed 's_DocumentRoot /var/www/html_DocumentRoot /var/www/public_' /etc/apache2/sites-enabled/000-default.bak > /etc/apache2/sites-enabled/000-default.conf

service apache2 restart

echo "################################################"
echo "#### Mapping www root to the host machine ######"
echo "################################################"

if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

echo "###########################################"
echo "#########     PHP Install        ##########"
echo "###########################################"

apt-get install imagemagick

apt-get install -y php5 php5-mysql php5-mcrypt php5-imagick php5-curl

php5enmod mcrypt

service apache2 restart

echo "###########################################"
echo "#########   Composer Install     ##########"
echo "###########################################"

curl -sS https://getcomposer.org/installer | php 
mv composer.phar /usr/local/bin/composer

cd /var/www
composer install