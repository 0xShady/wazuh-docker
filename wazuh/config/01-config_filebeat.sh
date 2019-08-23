#!/bin/bash
# Wazuh App Copyright (C) 2019 Wazuh Inc. (License GPLv2)

set -e

WAZUH_FILEBEAT_MODULE=wazuh-filebeat-0.1.tar.gz

if [ "$ELASTICSEARCH_URL" != "" ]; then
  >&2 echo "Customize Elasticsearch ouput IP."
  sed -i 's|http://elasticsearch:9200|'$ELASTICSEARCH_URL'|g' /etc/filebeat/filebeat.yml
fi

# Configure filebeat.yml security settings

if [ "$SSL_CERTIFICATE_AUTHORITIES" != "" ]; then
  >&2 echo "Customize Elasticsearch ouput IP."
  sed -i 's|#ssl.certificate_authorities:|'ssl.certificate_authorities:\ [\"$SSL_CERTIFICATE\"]'|g' /etc/filebeat/filebeat.yml
fi

if [ "$SSL_CERTIFICATE" != "" ]; then
  >&2 echo "Customize Elasticsearch ouput IP."
  sed -i 's|#ssl.certificate:|'ssl.certificate:\ \"$SSL_CERTIFICATE\"'|g' /etc/filebeat/filebeat.yml
fi

if [ "$SSL_KEY" != "" ]; then
  >&2 echo "Customize Elasticsearch ouput IP."
  sed -i 's|#ssl.key:|'ssl.key:\ \"$SSL_KEY\"'|g' /etc/filebeat/filebeat.yml
fi

if [ "$USERNAME" != "" ]; then
  >&2 echo "Customize Elasticsearch ouput IP."
  sed -i 's|#username:|'username:\ \"$USERNAME\"'|g' /etc/filebeat/filebeat.yml
fi

if [ "$PASSWORD" != "" ]; then
  >&2 echo "Customize Elasticsearch ouput IP."
  sed -i 's|#password:|'password:\ \"$PASSWORD\"'|g' /etc/filebeat/filebeat.yml
fi
