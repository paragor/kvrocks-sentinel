#/bin/bash

TLS_CONF="--tls --cert /etc/redis/certs/redis.crt --key /etc/redis/certs/redis.key --cacert /etc/redis/certs/ca.crt"


cd $(dirname $(dirname $(realpath $0)))

docker-compose exec client apk add bind-tools
for host in m s se1 se2 se3
do
  echo "$host : $(docker-compose exec client dig +short $host)"
done

echo "sentinel: \n$( docker compose exec client redis-cli -h se1 $TLS_CONF SENTINEL get-master-addr-by-name redismaster)"
echo "m: $( docker compose exec client redis-cli -h m $TLS_CONF info Replication  | grep role)\ns: $( docker compose exec client redis-cli -h s $TLS_CONF info Replication | grep role)\n"

