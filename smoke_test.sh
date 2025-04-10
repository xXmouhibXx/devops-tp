#!/bin/bash
set -e

container_id=$(docker run -d -p 5000:5000 $1)
sleep 10
curl -f http://localhost:5000 && echo "App is up!"
docker stop $container_id
docker rm $container_id
