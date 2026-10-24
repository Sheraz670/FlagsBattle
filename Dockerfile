
FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y \
    ffmpeg chromium xvfb fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN chmod +x /app/stream.sh

CMD ["bash", "/app/stream.sh"]
