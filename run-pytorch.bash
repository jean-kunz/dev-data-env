docker stop jean-pt
docker rm jean-pt
docker build  -f /data/projects/dev-data-env/docker/pytorch.Dockerfile -t jean/pt .

docker run --runtime=nvidia -d -u $(id -u):$(id -g) -v /data/projects:/projects \
-v /data/datasets:/datasets -v /data/models:/models \
-p 8889:8888  --name jean-pt jean/pt

docker exec -it jean-pt /bin/bash
