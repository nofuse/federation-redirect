FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY .well-known /usr/share/nginx/html/.well-known
EXPOSE 8080
