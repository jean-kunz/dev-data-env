docker stop jean-hub
docker rm jean-hub
docker build  -f /data/projects/dev-data-env/docker/hub.Dockerfile -t jean/hub .
# You should mount the docker.sock file from host VM to container. So, that the jupyterhub container can Spawn single user Notebook containers on the host.
docker run -d -v /var/run/docker.sock:/var/run/docker.sock  -v /data/projects/dev-data-env/jupyterhub:/jupyterhub-config -p 8000:8000  --name jean-hub jean/hub
docker exec -it jean-hub /bin/bash