docker stop my-notebook
docker rm my-notebook
docker build  -f my-notebook/Dockerfile -t jean/my-notebook .
#docker run -it \
#-v ~/projects/dev-data-env/jupyterhub/jupyterhub-config:/jupypter-config -p 8001:8000  \
#--name my-notebook jean/my-notebook
#docker exec -it my-notebook /bin/bash