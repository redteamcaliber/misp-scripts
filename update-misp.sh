#!/bin/bash
cd /var/www/MISP
git pull
cd /var/www/MISP/app/Lib/cakephp
git fetch origin
git checkout 2.6
#cd /var/www/MISP/app/files/scripts/python-cybox
#git checkout v2.1.0.12
#python setup.py install
#cd /var/www/MISP/app/files/scripts/python-stix
#git checkout v1.1.1.4
#python setup.py install
cd /var/www/MISP/app
php composer.phar self-update
php composer.phar update
cp -fa /var/www/MISP/INSTALL/setup/config.php /var/www/MISP/app/Plugin/CakeResque/Config/config.php
chown -R root:www-data /var/www/MISP
find /var/www/MISP -type d -exec chmod g=rx {} \;
chmod -R g+r,o= /var/www/MISP
chown www-data:www-data /var/www/MISP/app/files
chown www-data:www-data /var/www/MISP/app/files/terms
chown www-data:www-data /var/www/MISP/app/files/scripts/tmp
chown www-data:www-data /var/www/MISP/app/Plugin/CakeResque/tmp
chown -R www-data:www-data /var/www/MISP/app/tmp
chown -R www-data:www-data /var/www/MISP/app/webroot/img/orgs
chown -R www-data:www-data /var/www/MISP/app/webroot/img/custom
su www-data -c 'bash /var/www/MISP/app/Console/worker/start.sh'
echo " "
echo " "
echo "Finished Update. Please check instance to make sure upgrade successful"
