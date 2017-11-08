FROM python:alpine
MAINTAINER Roel Harbers <roel.harbers@on2it.net>

EXPOSE 3031

RUN apk add --no-cache \
    gcc \
    linux-headers \
    musl-dev \
;

WORKDIR /backend
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY bin bin
COPY app app

CMD ["bin/docker-cmd.sh"]
