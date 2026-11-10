#!/usr/bin/env bash
set -e

# Move to the directory containing this script.
cd "$(dirname "$0")"

# Install application dependencies.
npm install

# Restart the existing application, or start it for the first time.
if pm2 describe example_app > /dev/null 2>&1; then
  pm2 restart example_app --update-env
else
  pm2 start ./bin/www --name example_app --env production
fi
