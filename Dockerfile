FROM ubuntu:20.04
RUN yum update && yum install -
    rsyslog \
    which \
    tar \ 
    hostname \
    net-tools \
    wget \
 && rm -rf /var/lib/apt/lists/*
RUN yum install httpd -y
COPY index.html /var/www/html/

CMD [“/usr/sbin/httpd”,” -D”,” FOREGROUND”]
EXPOSE 80
