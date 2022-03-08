FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install httpd -y
CMD chkconfig --levels 235 httpd on
ENTRYPOINT ["/usr/sbin/httpd"] & CMD ["-D", "FOREGROUND"]
COPY index.html /var/www/html/
EXPOSE 80
