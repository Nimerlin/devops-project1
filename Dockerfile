FROM ubuntu:20.04
RUN yum update && yum install httpd -y
COPY index.html /var/www/html/

CMD [“/usr/sbin/httpd”,” -D”,” FOREGROUND”]
EXPOSE 80
