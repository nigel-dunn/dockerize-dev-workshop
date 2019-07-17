FROM php:apache

RUN docker-php-ext-install mysqli

RUN apt-get update && apt-get install wget

COPY docker/install_composer.sh /root/

RUN chmod 755 /root/install_composer.sh && /root/install_composer.sh

ENV COMPOSER_ALLOW_SUPERUSER true
