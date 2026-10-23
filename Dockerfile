
FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    chromium \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

CMD ["bash", "-lc", "echo 'Base image ready; YouTube streaming runner still needs to be configured.' && sleep infinity"]
