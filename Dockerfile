FROM ubuntu

RUN apt update && apt install apache2 -y

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY website/index.html /var/www/html/index.html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
