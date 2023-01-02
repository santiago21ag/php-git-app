FROM php:8.0-apache
RUN apt-get update && apt-get install -y git
#RUN curl -sS https://getcomposer.org/installer | \
    #php -- --install-dir=/usr/local/bin --filename=composer
#RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    #&& apt-get install -y nodejs

CMD ["php", "-S", "0.0.0.0:80"]