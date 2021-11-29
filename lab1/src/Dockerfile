FROM python:3.9

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONUTF8=1

COPY . /usr/src/app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE ${FLASK_RUN_PORT}

CMD ["flask", "run"]