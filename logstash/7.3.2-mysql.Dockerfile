FROM docker.elastic.co/logstash/logstash:7.3.2
COPY ./mysql-connector-java-8.0.17.jar logstash-core/lib/jars

RUN logstash-plugin install logstash-input-jdbc
