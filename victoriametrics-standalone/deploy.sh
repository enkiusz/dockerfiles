#!/bin/sh

export EPOCH=$(date '+%s')
docker stack deploy -c compose.yml vm "$@"
