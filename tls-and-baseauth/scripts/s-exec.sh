#/bin/bash
TLS_CONF="--tls --cert /etc/redis/certs/redis.crt --key /etc/redis/certs/redis.key --cacert /etc/redis/certs/ca.crt"

cd $(dirname $(dirname $(realpath $0)))
docker compose exec client redis-cli -h s $TLS_CONF $@
