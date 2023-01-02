# Use the official PHP 7.4 image.
# https://hub.docker.com/_/php
FROM php:8.0-apache

# Copy local code to the container image.
COPY index.php /var/www/html/

# Use port 8080 in Apache configuration files.
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Configure PHP for development.
# Switch to the production php.ini for production operations.
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
# https://hub.docker.com/_/php#configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

#FROM php:8.0-apache
#RUN apt-get update && apt-get install -y git
#RUN curl -sS https://getcomposer.org/installer | \
    #php -- --install-dir=/usr/local/bin --filename=composer
#RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    #&& apt-get install -y nodejs

CMD ["php", "-S", "0.0.0.0:80"]