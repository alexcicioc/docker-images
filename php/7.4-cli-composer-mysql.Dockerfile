FROM alexcicioc/php:7.4-cli-composer

RUN docker-php-ext-install mysqli pdo_mysql
