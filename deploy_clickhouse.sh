#!/bin/bash
set -x

# Pull and launch Clickhouse Docker image
docker pull yandex/clickhouse-server
sudo mkdir /root/clickhouse-data
sudo docker run -p 8123:8123 -p 9000:9000 -d --name CH-server --ulimit nofile=262144:262144 --volume=/root/clickhouse-data:/var/lib/clickhouse yandex/clickhouse-server
# Test CH (via the client in the docker)
# docker run -it --rm --link yandex/clickhouse-client --host CH-server

# Install clickhouse-client for the host
sudo apt-get install -y apt-transport-https ca-certificates dirmngr
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8919F6BD2B48D754

echo "deb https://packages.clickhouse.com/deb stable main" | sudo tee \
    /etc/apt/sources.list.d/clickhouse.list
sudo apt-get update

sudo apt-get install -y clickhouse-client

# Test CH
clickhouse-client
