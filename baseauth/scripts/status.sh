#/bin/bash
cd $(dirname $(dirname $(realpath $0)))


DC_ENV=-e=REDISCLI_AUTH=kvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssucks

docker-compose exec client apk add bind-tools
for host in m s se1 se2 se3
do
  echo "$host : $(docker-compose exec client dig +short $host)"
done

echo "sentinel: \n$( docker compose exec $DC_ENV client redis-cli -h se1 SENTINEL get-master-addr-by-name redismaster)"
echo "m: $( docker compose exec $DC_ENV client  redis-cli -h m info Replication | grep role)\ns: $( docker compose exec $DC_ENV client  redis-cli -h s info Replication | grep role)\n"

