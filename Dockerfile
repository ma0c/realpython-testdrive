FROM python:3.6-alpine

RUN apk update
RUN apk add --no-cache binutils
RUN apk add --no-cache gcc
RUN apk add --no-cache musl-dev
RUN apk add --no-cache postgresql-dev

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD ./requirements.txt /usr/src/app/requirements.txt

RUN pip install -r requirements.txt

ADD . /usr/src/app

CMD python manage.py runserver -h 0.0.0.0
