#!/usr/bin/env bash
set -e

flutter build web --release --output ~/pers/okandemir.net_release

cd ~/pers/okandemir.net_release

if [ -n "$(git status --porcelain)" ]; then
git add -A
git commit -m "Deploy web $(date -u +'%Y-%m-%d %H:%M:%S UTC')"
git push
else
echo "No changes to commit."
fi
