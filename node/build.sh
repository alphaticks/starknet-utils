#!bin/bash
docker build -t starknet-node:1.0 --build-arg PATHFINDER_VERSION="v0.2.6-alpha" .
if [ ! -z "$1" ]
then
   docker tag starknet-node:latest alphaticks/starknet-node:$1
   docker push alphaticks/starknet-node:$1
fi
