#/bin/bash
TLS_CONF="--tls --cert /etc/redis/certs/redis.crt --key /etc/redis/certs/redis.key --cacert /etc/redis/certs/ca.crt"

cd $(dirname $(dirname $(realpath $0)))
host=$(docker compose exec client redis-cli -h se1 $TLS_CONF SENTINEL get-master-addr-by-name redismaster | head -n 1)
echo "> $host"
docker compose exec client redis-cli -h $host $TLS_CONF $@
