FROM httpd:2.4
COPY index.html /var/www/html/
CMD ["service" "httpd" "start"]
EXPOSE 80
