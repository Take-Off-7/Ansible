#!/bin/bash

docker run --privileged  \
  --cgroupns=host \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v /run \
  -v /run/lock \
  -v /tmp \
  -p 2226:22 \
  --restart=always \
  --tmpfs /run \
  --tmpfs /run/lock \
  --name srv6 \
  -d \
  geerlingguy/docker-centos8-ansible \
  /sbin/init
