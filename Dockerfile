# Stage 1: install app dependencies
FROM node:20-bookworm-slim AS app-builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev

COPY index.js ./
COPY start.js ./

# Stage 2: final image with n8n
FROM docker.n8n.io/n8nio/n8n:latest

USER root

WORKDIR /app

COPY --from=app-builder /app /app
RUN chown -R node:node /app

USER node
WORKDIR /home/node

CMD ["node", "/app/start.js"]
