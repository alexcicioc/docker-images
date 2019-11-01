FROM alexcicioc/php:7.3-apache-composer-mysql

COPY apache /etc/apache2/

# Generate oauth keys
WORKDIR /app/keys
RUN openssl genrsa -out private.key 2048
RUN openssl rsa -in private.key -pubout -out public.key
RUN chmod 600 public.key && chown www-data:www-data private.key public.key
ENV PATH_TO_PUBLIC_KEY=/app/keys/public.key
ENV PATH_TO_PRIVATE_KEY=/app/keys/private.key

WORKDIR /var/www/php
