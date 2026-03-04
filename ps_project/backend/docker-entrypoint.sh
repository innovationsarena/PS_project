#!/bin/sh
set -e

if [ "${ADMIN_SYNC_ON_START:-1}" = "1" ] && [ -d /opt/admin-build ]; then
  mkdir -p /app/web/admin

  if [ "${ADMIN_FORCE_SYNC:-0}" = "1" ] || [ ! -f /app/web/admin/index.html ]; then
    rm -rf /app/web/admin/*
    cp -a /opt/admin-build/. /app/web/admin/
  fi
fi

exec make build run
