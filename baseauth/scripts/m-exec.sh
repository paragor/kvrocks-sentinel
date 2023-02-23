#/bin/bash
cd $(dirname $(dirname $(realpath $0)))
DC_ENV=-e=REDISCLI_AUTH=kvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssuckskvrockssucks
docker compose exec $DC_ENV client redis-cli -h m  $@
