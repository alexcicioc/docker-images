FROM sugarprojects/sugar-php-cli:9-v1.1

RUN mkdir /sugar

ADD run-phpunit-tests /usr/local/bin/

CMD ["run-phpunit-tests"]
