# Pull base image.
FROM dockerfile/elasticsearch

ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Install plugins
RUN \
  cd /elasticsearch && \
  mkdir -p plugins && \
  bin/plugin -i mobz/elasticsearch-head && \
#  bin/plugin -i elasticsearch/marvel/latest && \
  bin/plugin -i elasticsearch/elasticsearch-river-rabbitmq/2.4.1 && \
  bin/plugin -u https://github.com/NLPchina/elasticsearch-sql/releases/download/1.3.1/elasticsearch-sql-1.3.1.zip --install sql && \
  bin/plugin -u https://github.com/Asquera/elasticsearch-http-basic/releases/download/v1.4.0/elasticsearch-http-basic-1.4.0.jar --install http-basic

VOLUME /elasticsearch/plugins
