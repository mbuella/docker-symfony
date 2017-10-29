#!/usr/bin/env bash

# install symfony vendor/deps
composer install --prefer-dist -n -vv

# fixing permissions
cd /var/www/application
chmod -R 777 var/cache
chmod -R 777 var/logs

# database migrations/fixtures
php bin/console doctrine:migrations:migrate
php bin/console doctrine:fixtures:load

# Other commands here