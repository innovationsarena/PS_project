FROM mariadb:10.11

EXPOSE 3306

# Copy user/permission bootstrap script that MariaDB runs on first init.
COPY setup.sh /docker-entrypoint-initdb.d/00_setup.sh

# Copy raw migrations/seeds and generate a single init SQL dump during image build.
COPY migrations /tmp/migrations
COPY seeds /tmp/seeds

RUN set -e; \
  chmod +x /docker-entrypoint-initdb.d/00_setup.sh; \
  { \
    cat /tmp/migrations/*.sql /tmp/seeds/*.sql; \
  } > /docker-entrypoint-initdb.d/10_dump.sql; \
  rm -rf /tmp/migrations /tmp/seeds
