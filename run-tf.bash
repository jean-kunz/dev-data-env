docker stop jean-tf
docker rm jean-tf
docker build  -f /data/projects/dev-data-env/docker/tf.Dockerfile -t jean/tf .
#docker run --runtime=nvidia -u $(id -u):$(id -g) -v $(pwd):projects -it tf
docker run --runtime=nvidia -d -u $(id -u):$(id -g) -v /data/projects:/projects \
  -v /data/datasets:/datasets -v /data/models:/models -p 8888:8888 \
  -p 6006:6006 -p 6064:6064 -p 7778:7778 --name jean-tf jean/tf

docker exec -it jean-tf /bin/bash
