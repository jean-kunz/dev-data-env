#FROM jupyterhub/jupyterhub-onbuild:0.9.3
FROM jupyterhub/jupyterhub:0.9.3

# Install dockerspawner, oauth, postgres
RUN /opt/conda/bin/conda install -yq psycopg2=2.7 

RUN /opt/conda/bin/conda clean -tipsy 
RUN /opt/conda/bin/pip install dockerspawner==0.9.* oauthenticator==0.8.* jupyterhub-dummyauthenticator


# Copy TLS certificate and key
#ENV SSL_CERT /srv/jupyterhub/secrets/jupyterhub.crt
#ENV SSL_KEY /srv/jupyterhub/secrets/jupyterhub.key
#COPY ./secrets/*.crt $SSL_CERT
#COPY ./secrets/*.key $SSL_KEY

#RUN chmod 700 /srv/jupyterhub/secrets && \
#    chmod 600 /srv/jupyterhub/secrets/*

#COPY ./userlist /srv/jupyterhub/userlist

CMD ["jupyterhub","-f", "/jupyterhub-config/jupyterhub_config.py"]
