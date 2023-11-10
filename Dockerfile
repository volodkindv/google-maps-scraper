# FROM ultrafunk/undetected-chromedriver:106
FROM ultrafunk/undetected-chromedriver:3.20-chrome-lateinstall
# FROM ultrafunk/undetected-chromedriver:3.20-chrome108

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONPATH=/app/src \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_ROOT_USER_ACTION=ignore \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_CACHE_DIR=/var/cache/pypoetry \
    POETRY_HOME=/usr/local\
    VENV_PATH=/app/.venv

ENV PATH="$VENV_PATH/bin:$PATH"

RUN pip install poetry && poetry config virtualenvs.create false

COPY pyproject.toml .
COPY poetry.lock .
RUN poetry install

RUN mkdir app
WORKDIR /app
COPY . /app

CMD ["python", "main.py"]