#!/bin/bash
registry=
http_proxy=
https_proxy=
docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy -t elqzookeeper:3.4.8 .
#docker tag elqzookeeper:3.4.8 $registry/elqzookeeper:3.4.8
#docker push $registry/elqzookeeper:3.4.8
