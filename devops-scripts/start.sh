



# a2ensite callerpro.conf

# a2dissite 000-default.conf

composer update --working-dir=/var/www -W --no-interaction --optimize-autoloader

chmod 775 /var/www/storage/logs/laravel.log
chown $USER:www-data /var/www/storage/logs/laravel.log

# # service apache2 start
# # systemctl start apache2
# # apachectl start
# # apachectl -k restart
# # apachectl -k graceful

# apachectl -D FOREGROUND

# apt install nginx

# mkdir -p /etc/nginx/sites-enabled
# ln -s /etc/nginx/sites-available/callerpro.conf /etc/nginx/sites-enabled/

# service php8.2-fpm start && nginx -g "daemon off;"

#-------------

# apt install nginx



php-fpm