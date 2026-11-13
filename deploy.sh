#!/usr/bin/env bash
set -euo pipefail

SERVER="deploy@localhost"
PORT=2222
TARGET="/var/www/portofolio/"

echo ">> Deploy ke $SERVER:$TARGET"
rsync -avz --delete \
  --exclude '.git' --exclude '.github' \
  --exclude 'Dockerfile' --exclude '.dockerignore' \
  --exclude 'deploy.sh' \
  -e "ssh -p $PORT" ./ "$SERVER:$TARGET"

echo ">> Selesai. Cek http://localhost:8081"