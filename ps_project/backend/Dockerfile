ARG ADMIN_NODE_VERSION=14
 
FROM node:${ADMIN_NODE_VERSION}-alpine AS admin-build
WORKDIR /admin
COPY ./react-admin/package*.json ./
RUN npm i
COPY ./react-admin/ ./
RUN npm run build

FROM golang:latest
WORKDIR /app
RUN apt-get update && apt-get install -yq
COPY ./backend/ ./
COPY --from=admin-build /admin/build/ /opt/admin-build/
COPY ./backend/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
EXPOSE 8080
