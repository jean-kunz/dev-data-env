FROM python:3.6
RUN pip3 install \
    jupyterhub \
    notebook

# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
USER jovyan

VOLUME [ "/jupypter-config" ]

CMD ["jupyterhub-singleuser"]