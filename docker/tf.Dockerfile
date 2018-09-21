FROM tensorflow/tensorflow:1.10.1-gpu-py3

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get install -y nodejs


RUN pip install jupyterlab \
    ipywidgets \
    ipympl \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install jupyter-matplotlib \
    && jupyter labextension install @jupyterlab/hub-extension \
    && jupyter labextension install jupyterlab_bokeh \
    && jupyter labextension install jupyterlab_tensorboard

RUN pip install spacy \
    textacy \
    gensim



EXPOSE 8888 6006 6064
VOLUME ['/projects','/dataset']

WORKDIR /projects

CMD ["bash", "-c", "jupyter lab --ip 0.0.0.0 --no-browser --NotebookApp.token= --allow-root"]
