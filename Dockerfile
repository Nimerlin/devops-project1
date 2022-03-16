FROM amazonlinux
MAINTAINER Nitin
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
EXPOSE 80
CMD ["/usr/sbin/init"]
COPY index.html /var/www/html/





