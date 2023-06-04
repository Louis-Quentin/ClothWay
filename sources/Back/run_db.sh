set -e

Container="eip_db_1"

[ "$(docker ps -a | grep $Container)" ] && docker stop $Container
[ "$(docker ps -a | grep $Container)" ] && docker rm $Container
