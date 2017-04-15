FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY routes.d /etc/nginx/routes.d
RUN nginx -t
