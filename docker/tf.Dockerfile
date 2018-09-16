FROM tensorflow/tensorflow:1.10.1-gpu-py3

RUN pip install jupyterlab

EXPOSE 8888 6006 6064
VOLUME ['/projects','/dataset']

WORKDIR /projects 

CMD ["bash", "-c", "jupyter lab --ip 0.0.0.0 --no-browser --NotebookApp.token= --allow-root"]
