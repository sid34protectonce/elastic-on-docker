docker network create elastic

docker pull docker.elastic.co/elasticsearch/elasticsearch:8.13.4

docker run --name es01 --net elastic -p 9200:9200 -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:8.13.4

docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

export ELASTIC_PASSWORD="abc123"

docker cp es01:/usr/share/elasticsearch/config/certs/http_ca.crt .

# Kibana flow

docker pull docker.elastic.co/kibana/kibana:8.13.4

docker run --name kib01 --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:8.13.4

docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic