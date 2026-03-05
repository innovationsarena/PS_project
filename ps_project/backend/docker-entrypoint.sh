#!/bin/sh
set -e

if [ -d /opt/admin-build ]; then
  mkdir -p /app/web/admin
  rm -rf /app/web/admin/*
  cp -a /opt/admin-build/. /app/web/admin/
fi

exec make build run
