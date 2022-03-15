FROM centos:latest
RUN yum -y install httpd
CMD echo "Hello World"
