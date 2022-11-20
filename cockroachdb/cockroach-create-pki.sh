#!/bin/bash

cockroach cert create-ca --certs-dir=. --ca-key=ca.key
docker secret create cockroachdb_ca_cert ./ca.crt
docker secret create cockroachdb_ca_key ./ca.key


while [ "$1" ]; do
    nodehost="$1"; shift
    echo "Generating node certificate for '$nodehost'"

    cockroach cert create-node --certs-dir=. --ca-key=ca.key "$nodehost"
    docker secret create "cockroach_${nodehost}_cert" node.crt
    docker secret create "cockroach_${nodehost}_key" node.key
    rm node.crt node.key

done

cockroach cert create-client --certs-dir=. --ca-key=ca.key root
#docker secret create 'cockroach_client.root_cert' 