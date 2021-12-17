FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive


RUN adduser --quiet --disabled-password qtuser && usermod -a -G audio qtuser


ENV LIBGL_ALWAYS_INDIRECT=1


RUN apt-get update && apt-get install -y python3-pyqt5

RUN  apt-get install -y python3-pyqt5.qtsql libqt5sql5-psql

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . /usr/src/app/

CMD ["python3", "main.py"]