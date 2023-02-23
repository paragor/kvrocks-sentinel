#/bin/bash
cd $(dirname $(dirname $(realpath $0)))

docker-compose exec client apk add bind-tools
for host in m s se1 se2 se3
do
  echo "$host : $(docker-compose exec client dig +short $host)"
done

echo "sentinel: \n$( docker compose exec client redis-cli -h se1 SENTINEL get-master-addr-by-name redismaster)"
echo "m: $( docker compose exec client redis-cli -h m -p 6378 info Replication  | grep role)\ns: $( docker compose exec client redis-cli -h s -p 6378 info Replication | grep role)\n"

