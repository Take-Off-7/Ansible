#!/bin/bash

docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD:/src \
  -w /src \
  ttyridal/molecule \
  molecule test
