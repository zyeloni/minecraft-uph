#!/bin/bash

args=""
for ARG in "$@"; do
    args+=" $ARG"
done
docker-compose --env-file ./config/.env $args

