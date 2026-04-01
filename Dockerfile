FROM node:20-bookworm-slim

WORKDIR /app

# Install n8n globally
RUN npm install -g n8n

# Install your app dependencies
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# Copy app files
COPY index.js ./
COPY start.js ./

EXPOSE 5678

CMD ["node", "/app/start.js"]
