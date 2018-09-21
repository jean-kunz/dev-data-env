docker stop jean-hub
docker rm jean-hub
docker build  -f /data/projects/dev-data-env/docker/hub.Dockerfile -t jean/hub .

docker run -d -v /data/projects/dev-data-env/jupyterhub:/jupyterhub-config -p 8000:8000  --name jean-hub jean/hub
docker exec -it jean-hub /bin/bash