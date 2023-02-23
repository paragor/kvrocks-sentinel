#/bin/bash
DC_ENV=-e=REDISCLI_AUTH=kvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssucks

cd $(dirname $(dirname $(realpath $0)))
host=$(docker compose exec $DC_ENV client redis-cli -h se1  SENTINEL get-master-addr-by-name redismaster | head -n 1)
echo "> $host"
docker compose exec $DC_ENV client  redis-cli -h $host  $@
