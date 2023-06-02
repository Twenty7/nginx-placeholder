#!/usr/bin/env bash

APP_NAME=$1
if [ -z "$APP_NAME" ]; then
  echo "Missing APP_NAME Argument." >&2
  exit 1
fi
if [ ! -f "./.env.$APP_NAME" ]; then
  echo "Missing .env.$APP_NAME File" >&2
  exit 1
fi

set -a; . ./.env.$APP_NAME; set +a

docker stack deploy --compose-file docker-compose.yml $APP_NAME
