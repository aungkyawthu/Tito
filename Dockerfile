FROM php:rc-apache
COPY . /var/www/html/

apt-get update
apt-get install php5-mysql vim libmcrypt-dev
docker-php-ext-install mysqli pdo pdo_mysql mcrypt
cp /usr/share/php5/php.ini-production /usr/local/etc/php/php.ini

cat <<EOF >> /etc/apache2/mods-enabled/env.conf
<IfModule env_module>
    SetEnv TITO-SQL "tito-sql"
</IfModule>
EOF
