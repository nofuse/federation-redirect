FROM nginx:alpine
COPY .well-known /usr/share/nginx/html/.well-known
COPY default.conf.template /etc/nginx/templates/default.conf.template
EXPOSE 80
CMD ["/bin/sh", "-c", "envsubst '$$PUBLIC_MATRIX_DOMAIN $$MATRIX_HOST $$MATRIX_PORT' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
