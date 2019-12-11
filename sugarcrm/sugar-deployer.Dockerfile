FROM debian
ARG SUGAR_USER_ID=1000
ARG SUGAR_GROUP_ID=1000

RUN apt update && apt install -y rsync npm php curl
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN mkdir /sugar

WORKDIR "/sugar"

ADD ./docker/mount-job /usr/local/bin/

CMD ["start-job"]
