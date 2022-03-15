FROM centos:latest
RUN yum update -y \ yum install httpd -y     
Run service httpd enable
CMD ["systemctl httpd start"]
COPY index.html /var/www/html/
EXPOSE 80

