#!/bin/sh
# Small wrapper around the official entrypoint:
# 1. refuse to start without APP_KEY or a root password (no default admin123),
# 2. wait for Postgres on the private network,
# 3. hand over to the upstream /app/docker-entrypoint.sh.
set -e

if [ -z "${APP_KEY:-}" ]; then
  echo "APP_KEY is not set. Set it to a long random string." >&2
  exit 1
fi
if [ -z "${INIT_ROOT_PASSWORD:-}" ] || [ "${INIT_ROOT_PASSWORD}" = "admin123" ]; then
  echo "INIT_ROOT_PASSWORD is empty or the upstream default. Set a strong password." >&2
  exit 1
fi
export INIT_ROOT_EMAIL="${INIT_ROOT_EMAIL:-admin@nocobase.com}"

if [ -n "${DB_HOST:-}" ]; then
  echo "Waiting for the database at ${DB_HOST}:${DB_PORT:-5432} ..."
  i=0
  until node -e "require('net').connect({host:process.env.DB_HOST,port:+(process.env.DB_PORT||5432)}).on('connect',()=>process.exit(0)).on('error',()=>process.exit(1))"; do
    i=$((i+1))
    if [ "$i" -ge 60 ]; then
      echo "Database not reachable after 120 s, starting anyway." >&2
      break
    fi
    sleep 2
  done
fi

exec /app/docker-entrypoint.sh
