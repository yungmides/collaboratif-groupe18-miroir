FROM php:5.6.4-apache
WORKDIR "/var/www/html/"
USER root
EXPOSE 80

RUN apt-get update && apt-get install -y curl ca-certificates git zip unzip && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    #&& docker-php-ext-install pdo pdo_mysql

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Config apache
COPY ./.docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data /var/www/html && a2enmod rewrite

#A RETIRER QUAND PHP 8
RUN service apache2 start

COPY . .
# Get latest Composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer
RUN COMPOSER_MEMORY_LIMIT=-1 composer install --ignore-platform-reqs