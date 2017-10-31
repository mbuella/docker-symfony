#!/usr/bin/env bash

# cd to application
cd /var/www/application

# install symfony vendor/deps
composer install --prefer-dist -n -vv

# database migrations/fixtures
# (must be automated only the first time app is deployed)
php bin/console \ 
    doctrine:migrations:migrate \
        --allow-no-migration \
        --no-interaction \
        --env=prod
php bin/console \
    doctrine:fixtures:load \
        --no-interaction \
        --env=prod
    
# Other commands after this line
# ...
# Other commands end

# fixing permissions
chmod -R 777 var/cache
chmod -R 777 var/logs

# start PHP FPM Server
exec /usr/local/sbin/php5-fpm --nodaemonize