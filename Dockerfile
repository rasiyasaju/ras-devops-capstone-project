FROM ubuntu

RUN apt update && apt install apache2 -y

COPY website/index.html /var/www/html/index.html

CMD ["apachectl", "-D", "FOREGROUND"]
