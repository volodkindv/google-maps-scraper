FROM ultrafunk/undetected-chromedriver:106

LABEL org.opencontainers.image.authors="volodkindv@yandex.ru"

ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python -m pip install  -r requirements.txt

RUN mkdir app
RUN mkdir app/build
WORKDIR /app
COPY . /app

CMD ["python", "main.py"]