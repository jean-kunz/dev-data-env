FROM tensorflow/tensorflow:2.0.0-py3

RUN pip install --upgrade pip && \
    pip install \
    jupyterhub==1.0.0 \
    notebook \
    jupyterlab



# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
#WORKDIR $HOME
USER jovyan

VOLUME [ "/data" ]

WORKDIR /data

EXPOSE 8888
EXPOSE 6000

CMD ["jupyterhub-singleuser"]