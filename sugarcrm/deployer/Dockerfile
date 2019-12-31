FROM sugarprojects/sugar-server:9-v1.2
ARG SUGAR_USER_ID=1000
ARG SUGAR_GROUP_ID=1000

RUN apt update && apt install -y rsync npm
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN mkdir /sugar

WORKDIR "/sugar"

ADD ./scripts /usr/local/bin/

CMD ["start-job"]
