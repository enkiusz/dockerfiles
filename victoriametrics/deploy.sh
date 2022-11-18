#!/bin/sh

export EPOCH=$(date --utc '+%s')
docker stack deploy --prune -c compose.yml victoriametrics

