FROM php:8.0-apache
WORKDIR /var/www/html/
RUN php -r "readfile('http://getcomposer.org/installer%27);" | php -- --install-dir=/usr/bin/ --filename=composer
COPY . .
RUN composer install
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find $(php-config --extension-dir) -name xdebug.so)" \
         > /usr/local/etc/php/conf.d/xdebug.ini