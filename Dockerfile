FROM alpine:3.11.6
MAINTAINER Airspot <info@airspot.tech>

RUN apk add --no-cache --virtual .build-deps g++ python3-dev && \
    apk add --no-cache build-base && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools

RUN pip3 install pyyaml anyjson \
    pytest jsonpath-rw jsonpath-rw-ext redis python-dateutil pytz requests gunicorn \
    flask json-logging bumpversion cloudevents==0.3.0

# TODO REMOVE
RUN pip install pykube-ng

ADD ./app /app

ENV PYTHONPATH /app
ENV FLASK_APP /app/main.py
ENV FLASK_ENV production
