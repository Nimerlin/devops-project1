FROM httpd:latest
CMD ["systemctl httpd start"]
COPY index.html /var/www/html/
EXPOSE 80

