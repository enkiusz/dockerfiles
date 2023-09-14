#!/bin/sh

docker buildx build --push --platform linux/arm64/v8,linux/i386,linux/amd64 --tag enkiusz/keepalived:latest .
