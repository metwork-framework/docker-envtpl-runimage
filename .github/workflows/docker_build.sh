#!/bin/bash

#set -eu
set -x

docker pull metwork/envtpl-runimage:master
HASH_BEFORE=`docker images -q metwork/envtpl-runimage:master` 
docker build -t metwork/envtpl-runimage:master -t metwork/envtpl-runimage:latest .
HASH_AFTER=`docker images -q metwork/envtpl-runimage:master`
if [ "${HASH_BEFORE}" != "${HASH_AFTER}" ]; then
    docker push metwork/envtpl-runimage:latest
    docker push metwork/envtpl-runimage:master
fi
