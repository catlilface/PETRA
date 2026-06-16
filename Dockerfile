FROM ghcr.io/astral-sh/uv:python3.14-alpine

WORKDIR /app

COPY pyproject.toml uv.lock /app/

RUN uv sync --no-dev

COPY ./src /app/src

CMD ["uv", "run", "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "6992"]
