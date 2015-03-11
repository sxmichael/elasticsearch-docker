# Pull base image.
FROM dockerfile/elasticsearch

ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Install plugins
RUN \
  cd /elasticsearch && \
  mkdir -p plugins && \
  bin/plugin -i mobz/elasticsearch-head && \
#  bin/plugin -i elasticsearch/marvel/latest && \
  bin/plugin -i elasticsearch/elasticsearch-river-rabbitmq/2.4.1

VOLUME /elasticsearch/plugins
