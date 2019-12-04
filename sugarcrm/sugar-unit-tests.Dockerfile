FROM alexcicioc/sugar-cli:9-v1.0

RUN mkdir /sugar

ADD run-phpunit-tests /usr/local/bin/

CMD ["run-phpunit-tests"]
