FROM ubuntu

RUN apt update && apt install apache2 -y

COPY website/index.html /var/www/html/index.html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
