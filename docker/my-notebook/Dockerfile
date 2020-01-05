FROM python:3.7
RUN pip3 install \
    jupyterhub==1.0.0 \
    notebook

RUN pip3 list | grep jupyterhub

# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
USER jovyan
#ENV  JUPYTERHUB_API_TOKEN=a743580e799d4212961f7f65dcfcea6d

VOLUME [ "/jupypter-config" ]

#CMD ["jupyterhub-singleuser"]