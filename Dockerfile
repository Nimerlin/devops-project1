FROM httpd:latest
RUN yum install initscripts -y
CMD ["systemctl httpd start"]
COPY index.html /var/www/html/
EXPOSE 80

