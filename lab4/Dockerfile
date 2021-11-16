FROM python:3.9

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./src /usr/src/app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "bot.py"]