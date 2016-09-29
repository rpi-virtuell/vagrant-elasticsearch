#!/usr/bin/env bash

# Vagrant bootstrap file for elasticsearch
#
# Frank Staude <frank@staude.net>
#
# - 29.09.2016 initial Version, getestet mit elasticsearch 2.4.1
#

# update system
sudo apt-get update
sudo apt-get upgrade

# install Java / openjdk-7
sudo apt-get purge openjdk*
sudo apt-get -y install openjdk-7-jdk

# get Elasticsearch repository Public Signing Key
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# add Elasticsearch repository to apt
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

# install Elasticsearch
sudo apt-get update && sudo apt-get install elasticsearch
sudo update-rc.d elasticsearch defaults 95 10
sudo /etc/init.d/elasticsearch start

# config Elasticsearch for portforwarding from host
sudo echo "network.bind_host: 0" >> /etc/elasticsearch/elasticsearch.yml
sudo echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml

# enable dynamic scripting
sudo echo "script.inline: on" >> /etc/elasticsearch/elasticsearch.yml
sudo echo "script.indexed: on" >> /etc/elasticsearch/elasticsearch.yml

# enable cors
sudo echo "http.cors.enabled: true" >> /etc/elasticsearch/elasticsearch.yml

# install head plugin
sudo /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head

# restart eelasticsearch
sudo /etc/init.d/elasticsearch restart
