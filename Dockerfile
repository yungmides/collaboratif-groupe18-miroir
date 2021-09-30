FROM php:5.6.4-apache
WORKDIR "/var/www/html/"
USER root
EXPOSE 80

RUN apt-get update && apt-get install -y curl && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    #&& docker-php-ext-install pdo pdo_mysql

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Get latest Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY ./.docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf

#RUN chown -R www-data:www-data /var/www/html && a2enmod rewrite
RUN ls

