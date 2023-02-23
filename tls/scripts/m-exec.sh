#/bin/bash
cd $(dirname $(dirname $(realpath $0)))
docker compose exec client redis-cli -h m $@
