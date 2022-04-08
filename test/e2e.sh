#!/bin/bash

set -eux

go run main.go -id node0 ~/node0 &

sleep 20

curl -XPOST localhost:11000/key -d '{"foo": "bar"}'

RESPONSE=$(curl -XGET localhost:11000/key/foo)
echo $RESPONSE
if [ $RESPONSE != '{"foo":"bar"}' ]; then
  exit 1
fi