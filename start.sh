#!/usr/bin/env sh
set -eu

echo "Starting audio extractor on port ${APP_PORT:-3001}"
node /app/index.js &

echo "Starting n8n on port ${PORT:-5678}"
exec n8n start