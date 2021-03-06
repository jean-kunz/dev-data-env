FROM tensorflow/tensorflow:1.12.0-gpu-py3

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get install -y nodejs

RUN pip  install jupyter-tensorboard && jupyter tensorboard enable --system

RUN pip install jupyterlab==0.34.12 \
    ipywidgets \
    ipympl \
#    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
#    && jupyter labextension install jupyter-matplotlib \
 #   && jupyter labextension install @jupyterlab/hub-extension \
 #   && jupyter labextension install jupyterlab_bokeh \
 # currently incompatible with jupyterlab version
    && jupyter labextension install jupyterlab_tensorboard


RUN pip install --upgrade pip

RUN pip install spacy \
    textacy \
    gensim \
    # memory profilers
    psutil \
    memory_profiler \
    sh \
    pprint \
    pyyaml \
    setuptools \
#    apache-beam \  May create a conflict with tf regarding dependency towards protobuf.
    tensor2tensor \
    tensorflow-probability-gpu \
    tensorflow-hub \
    tensorflow-datasets \
    pymc3


#RUN python3 -m spacy download en

RUN pip install birdseye


#RUN pip install tensorflow-data-validation

#RUN pip install tensorflow-model-analysis \
#    &&  jupyter nbextension enable --py widgetsnbextension \
#    && jupyter nbextension install --py --symlink tensorflow_model_analysis \
#    && jupyter nbextension enable --py tensorflow_model_analysis



EXPOSE 8888 6006 6064 7778
VOLUME ['/projects','/dataset','/models']

WORKDIR /projects

CMD ["bash", "-c", "jupyter lab --ip 0.0.0.0 --no-browser --NotebookApp.token= --allow-root"]
