FROM tensorflow/tensorflow:1.10.1-gpu-py3

EXPOSE 8888 6006 6064
VOLUME ['/projects','/dataset']

CMD ["bash", "-c", "jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"]
