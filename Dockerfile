FROM python:3.11-slim

# Környezeti változók, hogy ne cache-eljen
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Könyvtár létrehozás
WORKDIR /app

# Követelmények bemásolása
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install "fastapi[standard]"

COPY ./src/ ./

RUN apt-get update && apt-get install -y ca-certificates supervisor && rm -rf /var/lib/apt/lists/*

EXPOSE 8000

COPY ./supervisor.conf /etc/supervisord.conf

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]