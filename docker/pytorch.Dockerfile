FROM continuumio/miniconda3


RUN conda install pip && \
    pip install --upgrade jupyter \
    jupyterlab 


RUN conda install numpy matplotlib seaborn spacy     

RUN conda install pytorch torchvision  -c pytorch
RUN conda config --append channels conda-forge
RUN conda config --append channels https://repo.anaconda.com/pkgs/main/linux-64
#RUN conda install -c derickl torchtext
RUN pip install torchtext

EXPOSE 8888
VOLUME ['/projects','/dataset','/models']

WORKDIR /projects

CMD ["bash", "-c", "jupyter lab --ip 0.0.0.0 --no-browser --NotebookApp.token= --allow-root"]
#CMD ["bash", "-c", "/opt/conda/bin/python --version"]
