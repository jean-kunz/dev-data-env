docker stop jean-doccano
docker rm jean-doccano
docker build  -f /data/projects/dev-data-env/docker/doccano.Dockerfile -t jean/doccano .
#docker run --runtime=nvidia -u $(id -u):$(id -g) -v $(pwd):projects -it tf
docker run --runtime=nvidia -d -u $(id -u):$(id -g) \
  -v /data/projects:/projects \
  -p 8893:8888 \
  --name jean-doccano jean/doccano

docker exec -it jean-doccano /bin/bash
