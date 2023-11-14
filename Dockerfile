FROM ultrafunk/undetected-chromedriver:106

LABEL org.opencontainers.image.authors="volodkindv@yandex.ru"

ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python -m pip install  -r requirements.txt

RUN mkdir app
WORKDIR /app
COPY ./src /app/src
COPY ./build /app/build
COPY ./main.py /app

CMD ["python", "main.py"]