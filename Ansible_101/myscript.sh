#!/bin/bash

docker network disconnect bridge srv1
docker network disconnect bridge srv2
docker network disconnect bridge srv3
docker network disconnect bridge srv4
docker network disconnect bridge srv5

docker network connect bridge srv1
docker network connect bridge srv2
docker network connect bridge srv3
docker network connect bridge srv4
docker network connect bridge srv5

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' srv1
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' srv2
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' srv3
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' srv4
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' srv5
