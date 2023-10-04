#!/bin/bash

# Clean Previous
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_ELASTICSEARCH_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_ELASTICSEARCH_NAME

# Compose Up
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_ELASTICSEARCH_NAME/docker-compose.yaml up -d --wait --build

# ⬇️

# https://www.elastic.co/guide/en/elasticsearch/reference/master/security-basic-setup-https.html
# [/usr/share/elasticsearch/elasticsearch-ssl-http.zip]
# $HOME/bin/elasticsearch-certutil http -s
# /usr/share/elasticsearch/data/ssl.zip
# $HOME/bin/elasticsearch-create-enrollment-token --scope kibana
# keytool -importkeystore -destkeystore <filename-your-http-PKCS-12> -srckeystore <filename-new-PKCS-12.p12> -srcstoretype PKCS12