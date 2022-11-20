#!/bin/sh

export EPOCH=$(date '+%s')
docker stack deploy --prune -c compose.yml pki
