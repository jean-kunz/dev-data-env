#FROM python:3.7-buster
FROM ubuntu:18.04

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    build-essential \
    ca-certificates \
    locales \
    python3-dev \
    python3-pip \
    python3-pycurl \
    nodejs \
    npm \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade setuptools pip wheel

ENV SHELL=/bin/bash \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

RUN  locale-gen $LC_ALL

RUN python3 -m pip install --no-cache --upgrade setuptools pip

RUN pip install jupyterhub
RUN npm install -g configurable-http-proxy 

RUN pip install dockerspawner jupyterhub-dummyauthenticator

VOLUME ["/jupypter-config"]
EXPOSE 8000

CMD ["jupyterhub","-f","/jupypter-config/jupyterhub_config.py"]