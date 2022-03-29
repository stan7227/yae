FROM nginx:alpine

RUN rm -f /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/app.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

EXPOSE 80
