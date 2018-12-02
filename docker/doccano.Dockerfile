FROM python:3

RUN cd /

RUN git clone https://github.com/chakki-works/doccano.git && \
    cd doccano && \
    pip install -r requirements.txt

WORKDIR doccano/app

RUN pip install psycopg2-binary
RUN python manage.py migrate

RUN python manage.py  createsuperuser --username admin --noinput \
    --email admin@banana.com
EXPOSE 8888

CMD ["bash", "-c", "python manage.py runserver ipaddr:8888"]
