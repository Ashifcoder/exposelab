echo "website Creation"

rm /var/www/html/public/index.html
cp /vagrant/CoolScripts/index.php /var/www/html/public/index.php
cp /vagrant/CoolScripts/robots.txt /var/www/html/public/robots.txt
cp /vagrant/CoolScripts/dev.php /var/www/html/public/dev.php
echo "Running Web Server"

service apache2 restart

echo "Web Server Running!"