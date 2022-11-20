#!/bin/bash

while [ "$1" ]; do
    nodehost="$1"; shift
    echo "Generating node certificate for '$nodehost'"
    echo {\"key\":{\"algo\":\"rsa\",\"size\":2048},\"names\":[{ \"OU\": \"Cockroach Nodes\"}]} | cfssl gencert -remote=pki.shill.gq -profile=tls-server -hostname="$nodehost" -cn="node" - > $nodehost.json

    #jq -r .key < $nodehost.json | docker secret create "cockroachdb_${nodehost}_key" -
    #jq -r .cert < $nodehost.json | docker secret create "cockroachdb_${nodehost}_cert" -

    mkdir "$nodehost"
    jq -r .key < $nodehost.json > $nodehost/node.key
    chmod 0400 $nodehost/node.key
    jq -r .cert < $nodehost.json > $nodehost/node.crt
    cfssl info -remote=pki.shill.gq | jq -r .certificate > $nodehost/ca.crt

done

# Generate root client certificate
echo {\"key\":{\"algo\":\"rsa\",\"size\":2048},\"names\":[{ \"OU\": \"Cockroach Users\"}]} | cfssl gencert -remote=pki.shill.gq -profile=tls-server -cn="root" - > client-root.json
jq -r .cert < client-root.json > client.root.crt
jq -r .key < client-root.json > client.root.key

cfssl info -remote=pki.shill.gq | jq -r .certificate > ca.crt
