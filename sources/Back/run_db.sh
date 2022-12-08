docker build -t clothway_db .
containerName="clothway_postgres"
if docker ps -a --format '{{.Names}}' | grep -Eq "^${containerName}\$"; then
    docker restart ${containerName}
else
    docker run -d -p 5432:5432 --name clothway_postgres clothway_db
fi
docker exec -it clothway_postgres bash -c "sh /tmp/entrypoint.sh"
