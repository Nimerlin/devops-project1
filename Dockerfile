FROM amazonlinux
MAINTAINER Nitin
RUN yum install httpd -y;
EXPOSE 80
CMD ["/usr/sbin/init"]
COPY index.html /var/www/html/





