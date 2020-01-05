docker stop my-hub
docker rm my-hub
docker build  -f my-hub/Dockerfile -t jean/my-hub .
# You should mount the docker.sock file from host VM to container. So, that the jupyterhub container can Spawn single user Notebook containers on the host.
docker run -d \
-v /var/run/docker.sock:/var/run/docker.sock  \
-v ~/projects/dev-data-env/jupyterhub/jupyterhub-config:/jupypter-config \
--net jupyterhub -p 8000:8000 -p 8081:8081 \
--name my-hub jean/my-hub
docker exec -it my-hub /bin/bash