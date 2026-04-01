FROM docker.n8n.io/n8nio/n8n:latest

USER root

RUN apk add --no-cache nodejs npm

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY index.js ./
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

USER node
WORKDIR /home/node

CMD ["/app/start.sh"]