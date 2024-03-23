#!/bin/bash -ex

tag=ryanshaw/node-open-mining-portal

docker build -t $tag .

docker push $tag
